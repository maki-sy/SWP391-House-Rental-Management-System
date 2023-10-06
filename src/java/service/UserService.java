/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.TokenDAO;
import DAO.UserDAO;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Multipart;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Properties;
import java.util.function.Predicate;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Landlord;
import model.Tenant;
import model.Token;
import model.Users;

/**
 *
 * @author DTS
 */
public class UserService {

    private static final TenantDAO TENANT_DAO = new TenantDAO();
    private static final LandlordDAO LANDLORD_DAO = new LandlordDAO();
    private static final TokenDAO TOKEN_DAO = new TokenDAO();
    private static final UserDAO USER_DAO = new UserDAO();

    /**
     *
     * @param firstName
     * @param lastName
     * @param email
     * @param phone
     * @param password Raw password
     */
    public void registerTenant(String firstName, String lastName, String email, String phone, String password) {

        System.out.println("registerTenant() called");
        // Check for User with role Tenant with existance emai
        List<Users> usersList = USER_DAO.getUsersByEmail(email);
        Predicate<Users> byStatus = user -> user.getStatus() != Users.Status.UNV;
        Predicate<Users> byRole = user -> user.getRoleID() == Users.Role.TENANT.getValue();
        List<Users> tenantList = usersList.stream().filter(byRole).collect(Collectors.toList());

        if (tenantList.isEmpty()) { // This email have never been registered as tenant before. And also there is no account the same email, that has been VERIFIED
            // Check if there is account with email, and is already activated (verified/banned/etc. )
            List<Users> userStatus = usersList.stream().filter(byStatus).collect(Collectors.toList());
            if (!userStatus.isEmpty()) {
                System.out.println("AN ACCOUNT WITH THIS EMAIL ALREADY EXISTS AND ACTIVATED");
                return;
            }

            byte[] salt = generateSalt();
            byte[] hashedPassword = hashingPassword(password, salt);

            // Add user record to Users table DB     
//            int lastID = USER_DAO.getLastUserID();
            Users user = new Users(email, hashedPassword, salt, Users.Role.TENANT.getValue(), Users.Status.UNV);
            int userID = USER_DAO.addUser(user);

            // Add tenant record to Tenant table
            Tenant tenant = new Tenant(userID, firstName, lastName, null, phone, null);
            TENANT_DAO.addTenant(tenant);

            // Generate token for email verification
            Token token = generateUserToken(userID, email, Token.TokenType.CONFIRMATION);

            // Send an email with token to user's email to verify email address
            sendConfirmationEmail(email, token.getToken(), "TENANT");
        } else { // This email have been used to register tenant before
            System.out.println("DUPLICATE EMAIL WITH TENANT ROLE");
        }
    }

    public void registerLandlord(String firstName, String lastName, String email, String phone, String password) {
        // Check for User with role Tenant with existance emai
        List<Users> usersList = USER_DAO.getUsersByEmail(email);
        Predicate<Users> byStatus = user -> user.getStatus() != Users.Status.UNV;
        Predicate<Users> byRole = user -> user.getRoleID() == Users.Role.LANDLORD.getValue();
        List<Users> landlordList = usersList.stream().filter(byRole).collect(Collectors.toList());

        if (landlordList.isEmpty()) { // This email have never been registered as tenant before
            // Check if there is account with email, and is already activated (verified/banned/etc. )
            List<Users> userStatus = usersList.stream().filter(byStatus).collect(Collectors.toList());
            if (!userStatus.isEmpty()) {
                System.out.println("AN ACCOUNT WITH THIS EMAIL ALREADY EXISTS AND ACTIVATED");
                return;
            }

            byte[] salt = generateSalt();
            byte[] hashedPassword = hashingPassword(password, salt);

            // Add user record to Users table DB     
//            int lastID = USER_DAO.getLastUserID();
            Users user = new Users(email, hashedPassword, salt, Users.Role.LANDLORD.getValue(), Users.Status.UNV);
            int userID = USER_DAO.addUser(user);

            // Add tenant record to Tenant table
            Landlord landlord = new Landlord(userID, firstName, lastName, null, phone, null, 0);
            LANDLORD_DAO.addLandlord(landlord);

            // Generate token for email verification
            Token token = generateUserToken(userID, email, Token.TokenType.CONFIRMATION);

            // Send an email with token to user's email to verify email address
            sendConfirmationEmail(email, token.getToken(), "LANDLORD");
        }
    }

    private boolean checkActiveAccount(String email) {
        return USER_DAO.checkActiveAccount(email);
    }

    /**
     *
     * @param sendTo
     * @param subject
     * @param content
     */
    private void sendEmail(String sendTo, String subject, String content) {

        // DEFAULT ADMIN MAIL SENDER
        String username = "haquangthangvnn@gmail.com";
        String password = "pbrngqhdqhzkinrq";
        // ------------

        Properties prop = new Properties();

        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(sendTo));
            message.setSubject(subject);

            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(content, "text/html; charset=utf-8");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(mimeBodyPart);

            message.setContent(multipart);

            Transport.send(message);
        } catch (MessagingException e) {
            System.out.println("Messeage exception in sendEmail(): " + e.getMessage());
        }
    }

    /**
     * Send email to receivedEmail contains an token to verify their
     * registration
     *
     * @param receivedEmail
     * @param token formatted token string (token with format: The first 3
     * @param role A String describe role user register for
     */
    private void sendConfirmationEmail(String receivedEmail, String token, String role) {
        String subject = "Confirm registration for House Rental Management System";
        String content = "Hi " + receivedEmail + ", you received this email because you've been registered as a " + role + " in our website. Here is your confimation link to verify your email <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/verify?token=" + token + "\">CLICK HERE TO CONFIRM</a>";

        // Send confirmation email to user
        sendEmail(receivedEmail, subject, content);
    }

    private void changePasswordEmail(String receivedEmail, String token) {
        String subject = "Verifying change password request";
        String content = "Hi " + receivedEmail + ", you received this email because you've requested to change your password. To verify the request, click on the following link : <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/changePassword?token=" + token + "\">CHANGE YOUR PASSWORD HERE</a>";

        // Send confirmation email to user
        sendEmail(receivedEmail, subject, content);
    }

    /**
     * Generate token string, used in forgot password or confirmation email
     *
     * @return token string
     */
    private String generateTokenStr() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[20];
        random.nextBytes(bytes);

        String token = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
        System.out.println("Generated token: " + token);
        System.out.println("Token length: " + token.length());
        return token;
    }

    /**
     * Generate token object corresponding to an email, and then add it to DB
     *
     * @param userID userID ties to this token
     * @param email email to generate token, after the token is generated, an
     * record will be added to the DB corresponding to this email
     * @param type Token's type as in Token.TokenType
     *
     * @return token object just created
     */
    private Token generateUserToken(int userID, String email, Token.TokenType type) {
        String tokenStr = generateTokenStr();
//        tokenStr = usrRole + tokenStr;

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime expire = now.plusMinutes(10); // token will expire in 10 minutes

        // token id is IDENTITTY in DB, -1 is just a dummy value
        Token token = new Token(userID, email, tokenStr, expire.toString(), type);
        TOKEN_DAO.addToken(token);
        return token;
    }

    /**
     * Login for tenant and landlord
     *
     * @param email
     * @param password raw password user inputted
     * @param roleID role id of user
     * @return Users object logged in if successfully, or null if log in fail
     */
    public Users login(String email, String password, int roleID) {

        Users user = USER_DAO.getUserByEmailRole(email, roleID);
        if (user == null) { // there is no user with such type and role
            System.out.println("login() says: There is no account with email " + email + " and roleID " + roleID);
            return null;
        }

        // verify whether this account activated or not
        if (user.getStatus() == Users.Status.UNV) {
            System.out.println("Account " + email + " has not been activated");
            return null;
        }

        byte[] salt = user.getSalt();
        byte[] correctPass = user.getHashedPassword();
        byte[] inputPass = hashingPassword(password, salt);
        boolean sucess = Arrays.equals(correctPass, inputPass);

        if (sucess) {
            return user;
        } else {
            return null;
        }
    }

    /**
     * Generate salt, helping in password hashing
     *
     * @return byte[16] array filled in with random bytes
     */
    private byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);

        return salt;
    }

    /**
     * Hashing a password
     *
     * @param password
     * @param salt
     * @return hashed password. Or null if SHA-512 is not supported
     */
    private byte[] hashingPassword(String password, byte[] salt) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-512");
            md.update(salt);
            byte[] hashedPassword = md.digest(password.getBytes(StandardCharsets.UTF_8));
//            System.out.println("Password after hash: " + Arrays.toString(hashedPassword));
            return hashedPassword;
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Handle logic for email confirmation
     *
     * @param tokenStr
     * @return
     */
    public boolean verifyEmail(String tokenStr) {

        Token token = TOKEN_DAO.getToken(tokenStr);
        if (token == null) { // invalid token: token does not exist in the DB
            System.out.println("Token does not exist in the DB");
            return false;
        }

        // Check for expire time of token
        boolean expired = isTokenExpire(token);
        if (expired) { // If token already expired
            System.out.println("Token expired");
            return false;
        }

        // Get User object corresponding to token
        Users user = USER_DAO.getUserByID(token.getUserID());
        if (user == null) {
            return false;
        }
        // check whether has another account corresponding to this email has activated
        boolean isActived = checkActiveAccount(user.getEmail());
        if (!isActived) {
            user.setStatus(Users.Status.VER);
            USER_DAO.updateUser(user);
            return true;
        } else {
            System.out.println("THERE IS ALREADY ANOTHER ACCOUNT WITH THIS EMAIL ADDRESS");
            return false;
        }
    }

    public String verifyChangePassword(String password, String tokenStr) {
        Token token = TOKEN_DAO.getToken(tokenStr);
        if (token == null) { // invalid token: token does not exist in the DB
            System.out.println("Token does not exist in the DB");
            return "invalidToken";
        } else {

            // Check for expire time of token
            boolean expired = isTokenExpire(token);
            if (expired) { // If token already expired
                System.out.println("Token expired");
                return "tokenExpired";
            } else {

                // Get User object corresponding to token
                Users user = USER_DAO.getUserByID(token.getUserID());

                byte[] salt = generateSalt();
                byte[] hashed_password = hashingPassword(password, salt);
                USER_DAO.updateUserPassword(user, hashed_password, salt);
                return "success";
            }
        }

    }

    /**
     * Check whether passed token is still valid in time
     *
     * @param token an existed token in the DB
     * @return true if token has been expired, false otherwise
     */
    private boolean isTokenExpire(Token token) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.[SSS][SS][S]");
        System.out.println("Time: " + token.getExpireDate());
        LocalDateTime tokenTime = LocalDateTime.parse(token.getExpireDate(), formatter);
        LocalDateTime now = LocalDateTime.now();

        return tokenTime.isBefore(now);
    }

    public boolean checkPassword(Users user, String inputPassword) {
        byte[] salt = user.getSalt();
        byte[] hashedInputPassword = hashingPassword(inputPassword, salt);

        boolean check = Arrays.equals(hashedInputPassword, user.getHashedPassword());

        return check;
    }

    public void changePassword(int user_id, String email) {
        Token token = generateUserToken(user_id, email, Token.TokenType.CHANGEPWD);
        changePasswordEmail(email, token.getToken());
    }

    /**
     * Send forgot password email to email address. If the email address does
     * not exist in the DB, or the account has not been activated, the email
     * will not be sent
     *
     * @param email
     */
    public void sendForgotPwdEmail(String email) {
        Users user = USER_DAO.getVerifiedAccount(email);
        if (user == null) {
            System.out.println("Email does not exist, or this account has not been activated");
        } else {
            Token token = generateUserToken(user.getId(), email, Token.TokenType.FORGOTPWD);
            String mailSubject = "Account recovery for House Rental Management";
            String content = "You've requested to reset your password, please click on this link to reset your password <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/recover?service=resetPwd&token=" + token.getToken() + "\">RESET YOUR PASSWORD HERE</a>";
            sendEmail(email, mailSubject, content);
        }
    }

    /**
     * Check for valid token. A valid token is a token that is in the DB, not
     * expired, and its type corresponding to token's string matches with type
     *
     * @param token token string
     * @param type type of token
     * @return true if exist Token object in DB with token's string = token, and
     * token's type = type. False otherwise
     */
    public boolean checkValidToken(String token, Token.TokenType type) {
        Token tokenObj = TOKEN_DAO.getToken(token);
        if (tokenObj == null) { // if this token does not exist
            System.out.println("This token does not exist");
            return false;
        } else {
            return (!isTokenExpire(tokenObj) && (tokenObj.getType() == type));
        }
    }

    /**
     * Reset user password corresponding to token in the DB
     *
     * @param token
     * @param usrPassword
     */
    public void resetUserPassword(String token, String usrPassword) {
        Token tokenObj = TOKEN_DAO.getToken(token);
        Users user = USER_DAO.getUserByID(tokenObj.getUserID());
        
        byte[] salt = generateSalt();
        byte[] hashedPwd = hashingPassword(usrPassword, salt);
        
        user.setSalt(salt);
        user.setHashedPassword(hashedPwd);
        
        USER_DAO.updateUser(user);
    }
}
