/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.AdminDAO;
import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.TokenDAO;
import DAO.UserAvatarDAO;
import DAO.UserBannedDAO;
import DAO.UserDAO;
import DAO.UserRoleDAO;
import DAO.WishlistDAO;
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
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
import model.Admin;
import model.Landlord;
import model.Tenant;
import model.Token;
import model.UserAvatar;
import model.UserBanned;
import model.Users;
import model.Wishlist;

/**
 *
 * @author DTS
 */
public class UserService {

    private static final TenantDAO TENANT_DAO = new TenantDAO();
    private static final LandlordDAO LANDLORD_DAO = new LandlordDAO();
    private static final TokenDAO TOKEN_DAO = new TokenDAO();
    private static final UserDAO USER_DAO = new UserDAO();
    private static final AdminDAO ADMIN_DAO = new AdminDAO();
    private static final WishlistDAO WISHLIST_DAO = new WishlistDAO();
    private static final UserBannedDAO BAN_DAO = new UserBannedDAO();
    private static final UserRoleDAO USER_ROLE_DAO = new UserRoleDAO();

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

    /**
     * Send a confirmation email to user. This function will generate a new
     * token to DB (expire time = 10 mins), this token will be embedded to
     * confirm link that sent to user's email address
     *
     * @param receiver Email address
     * @param user Users that the generated token applied for
     */
    public void sendConfirmationEmail(String receiver, Users user) {
        // Generate token for email verification
        Token token = generateUserToken(user.getId(), user.getEmail(), Token.TokenType.CONFIRMATION);

        String subject = "Confirm registration for House Rental Management System";
        String content;
        try {
            content = "Hi " + receiver + ", you received this email because you've been registered as a " + user.getRole().name() + " in our website. Here is your confimation link to verify your email <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/verify?token=" + token.getToken() + "\">CLICK HERE TO CONFIRM</a>";
        } catch (Exception ex) {
            content = "Hi " + receiver + ", you received this email because you've been registered as a <<<INVALID ROLE NAME>>> in our website. Here is your confimation link to verify your email <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/verify?token=" + token.getToken() + "\">CLICK HERE TO CONFIRM</a>";
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Send confirmation email to user
        sendEmail(receiver, subject, content);
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
     * @param token token string
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

        if (BAN_DAO.checkBannedByID(user.getId())) { // If this user is banned
            System.out.println("Account " + user.getEmail() + " has been banned");
            return null;
        }

        if (user.getStatus().toString().equals("DEL")) { // If this user is disabled
            System.out.println("Account " + user.getEmail() + " has been disabled");
            return null;
        }

        byte[] salt = user.getSalt();
        byte[] correctPass = user.getHashedPassword();
        byte[] inputPass = hashingPassword(password, salt);
        boolean sucess = Arrays.equals(correctPass, inputPass);

        if (sucess) { // correct username and password
            Users verifiedUser = USER_DAO.getVerifiedAccount(email);
            // ... but there is another account with the same email, and verified
            if (verifiedUser != null && (verifiedUser.getId() != user.getId())) {
                System.out.println("There is another account with the same email, and has been verified");
                return null;
            }

            // If email and password correct, and there is no account activated for this email
            if (user.getStatus() == Users.Status.UNV && verifiedUser == null) {
                System.out.println("This account " + email + " has not been activated. We will send you a confirmation email");
                // re-send confirmation email for this account
                sendConfirmationEmail(email, user);
                return null;
            }

            // this account has been activated
            return user;
        } else {
            return null;
        }
    }

    /**
     * Login for Tenant, Landlord and Admin (currently not in used)
     *
     * @param email
     * @param password
     * @return Users object logged in if successfully, or null if login fail
     */
    public Users login(String email, String password) {
        Users user = USER_DAO.getVerifiedAccount(email);
        boolean sucess = false;
        if (user != null) {
            if (BAN_DAO.checkBannedByID(user.getId())) { // If this user is banned
                System.out.println("Account " + user.getEmail() + " has been banned");
                return null;
            }

            if (user.getStatus().toString().equals("DEL")) { // If this user is disabled
                System.out.println("Account " + user.getEmail() + " has been disabled");
                return null;
            }

            byte[] salt = user.getSalt();
            byte[] correctPass = user.getHashedPassword();
            byte[] inputPass = hashingPassword(password, salt);
            sucess = Arrays.equals(correctPass, inputPass);
        }
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
     * Send forgot password email to email address. The email will be sent in
     * two cases: First, the account's email is activated. Second, there is no
     * account with this email has been activated, if so there will be two link
     * corresponding to two roles to reset password. If you provides this
     * function a email, in the database has two accounts for this email, and
     * one account has been activated, then only account with role of activated
     * account will be able to reset the password
     *
     * @param email
     */
    public void sendForgotPwdEmail(String email) {

        if (!USER_DAO.checkEmail(email)) {
            System.out.println("Email " + email + " does not exist in the database");
            return;
        }

        String mailSubject = "Account recovery for House Rental Management";
        Users user = USER_DAO.getVerifiedAccount(email);
        if (user == null) { // there is no activated account, we create reset link for all roles of this email
            System.out.println("Account(s) has not been activated");
            // users list contains at most 2 account with email, and unverified
            List<Users> users = USER_DAO.getUsersByEmail(email);
            String content = "You've requested to reset your password \n.";
            for (Users u : users) {
                Token token = generateUserToken(u.getId(), email, Token.TokenType.FORGOTPWD);
                try {
                    content += "Click on this link to reset your " + u.getRole().name().toUpperCase() + " account password <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/recover?service=resetPwd&token=" + token.getToken() + "\">RESET YOUR PASSWORD HERE</a>\n";
                } catch (Exception ex) {
                    System.out.println("sendForgotPwdEmail() reports: getRole() of Users model throw exception " + ex.getMessage());
                    Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
                    return;
                }
            }
            sendEmail(email, mailSubject, content);
        } else { // there is activated account, we send the link to reset password for that account of specific role
            Token token = generateUserToken(user.getId(), email, Token.TokenType.FORGOTPWD);
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

    /**
     * Get User's name = first name + last name
     *
     * @param userID
     * @return User's name or null if there is no user with corresponding id
     */
    public String getUserName(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getFirstName() + " " + t.getLastName();
        }
        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getFirstName() + " " + l.getLastName();
        }
        Admin a = ADMIN_DAO.getAdminByID(userID);
        if (a != null) {
            return a.getFirstName() + " " + a.getLastName();
        }

        return null;
    }

    public String getFirstName(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getFirstName();
        }
        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getFirstName();
        }
        Admin a = ADMIN_DAO.getAdminByID(userID);
        if (a != null) {
            return a.getFirstName();
        }

        return null;
    }

    /**
     * Get landlord current balance in the account.
     *
     * @param landlordID
     * @return Current balance of landlord. If the user's id passed in is not of
     * a landlord account or not a exists ID, it returns 0
     */
    public int getLandlordPoint(int landlordID) {
        int point = 0;
        Users user = getUserByID(landlordID);
        if (user == null || user.getRoleID() != 2) { // if id does not exist, or user is not landlord
            return 0;
        }
        point = LANDLORD_DAO.getLandlordPoint(landlordID);
        return point;
    }

    public String getLastName(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getLastName();
        }
        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getLastName();
        }
        Admin a = ADMIN_DAO.getAdminByID(userID);
        if (a != null) {
            return a.getLastName();
        }

        return null;
    }

    public String getAddress(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getAddress();
        }
        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getAddress();
        }
        Admin a = ADMIN_DAO.getAdminByID(userID);
        if (a != null) {
            return ""; //Admin do not need address
        }

        return null;
    }

    public String getPhone(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getPhone();
        }
        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getPhone();
        }
        Admin a = ADMIN_DAO.getAdminByID(userID);
        if (a != null) {
            return a.getPhone();
        }

        return null;
    }

    public String getCivilID(int userID) {
        Tenant t = TENANT_DAO.getTenantByUserID(userID);
        if (t != null) {
            return t.getCivilID();
        }

        Landlord l = LANDLORD_DAO.getLandlordByUserID(userID);
        if (l != null) {
            return l.getCivilID();
        }

        return null;
    }

    public Users getUserByEmail(String email) {
        UserDAO userdao = new UserDAO();
        List<Users> list = userdao.getUsersByEmail(email);
        if (list.isEmpty()) {
            return null;
        }
        Users user = userdao.getUsersByEmail(email).get(0);
        return user;
    }

    public void addAdminUser(String email, String fname, String lname, String phone, String password) {
        byte[] salt = generateSalt();
        byte[] hashedPwd = hashingPassword(password, salt);
        Users user = new Users(email, hashedPwd, salt, 3, Users.Status.VER);
        int userID = USER_DAO.addUser(user);
        Admin admin = new Admin(userID, fname, lname, phone);
        ADMIN_DAO.addAdmin(admin);
    }

    public void addTenantUser(String email, String fname, String lname, String address, String phone, String civilID, String password) {
        byte[] salt = generateSalt();
        byte[] hashedPwd = hashingPassword(password, salt);
        Users user = new Users(email, hashedPwd, salt, 1, Users.Status.VER);
        int userID = USER_DAO.addUser(user);
        Tenant tenant = new Tenant(userID, fname, lname, address, phone, civilID);
        TENANT_DAO.addTenant(tenant);
    }

    public void addLandlordUser(String email, String fname, String lname, String address, String phone, String civilID, String password) {
        byte[] salt = generateSalt();
        byte[] hashedPwd = hashingPassword(password, salt);
        Users user = new Users(email, hashedPwd, salt, 2, Users.Status.VER);
        int userID = USER_DAO.addUser(user);
        Landlord landlord = new Landlord(userID, fname, lname, address, phone, civilID, 0); //set new Landlord account with 0 point
        LANDLORD_DAO.addLandlord(landlord);
    }

    /**
     * Add post to user's wish list. This function only add property to user's
     * wish list when that property is not in wish list before
     *
     * @param userID
     * @param postID
     */
    public void addToWishlist(int userID, int postID) {
//        Check whether this property has been added to user's wish list before
        if (!WISHLIST_DAO.checkExist(userID, postID)) {
            WISHLIST_DAO.addWish(userID, postID);
        }
    }

    public List<Wishlist> getWishlistByUserID(int userID) {
        return WISHLIST_DAO.getWishlistByUserID(userID);
    }

    public int deleteWish(int wishID) {
        return WISHLIST_DAO.deleteWishByID(wishID);
    }

    /**
     * Delete a wish corresponding to postId of a userId
     * @param userId
     * @param postId
     * @return 
     */
    public int deleteWish(int userId, int postId) {
        return WISHLIST_DAO.deleteWishById(userId, postId);
    }

    /**
     * Ban an user by user's id. Ban is only taken if this user's id exists and
     * not already been banned. TODO: Using Timer for auto unban
     *
     * @param userID
     * @param duration
     */
    public void banUser(int userID, int duration) {
        Users user = USER_DAO.getUserByID(userID);
        if (user != null && user.getStatus() != Users.Status.BAN) {

            LocalDateTime startDate = LocalDateTime.now();
            LocalDateTime endDate = startDate.plusDays(duration);

            UserBanned ban = BAN_DAO.getBannedUserByID(userID);
            if (ban == null) { // this user has never been banned before, add it to database
                ban = new UserBanned(userID, user.getEmail(), startDate.toString(), endDate.toString(), UserBanned.Status.Active);
                BAN_DAO.addUserBanned(ban);
            } else { // this user has been banned before, we update record in the database
                ban.setStartDate(startDate.toString());
                ban.setEndDate(endDate.toString());
                ban.setStatus(UserBanned.Status.Active);
                BAN_DAO.updateBannedByID(ban);
            }

            // Save user status to database
            USER_DAO.updateUserStatus(userID, Users.Status.BAN);

        } else {
            System.out.println("banUser() says: There is no userID");
        }
    }

    /**
     * Get User object by user's id. If there is no user, this function return
     * null
     *
     * @param userID
     * @return User object, or null if there is no user
     */
    public Users getUserByID(int userID) {
        return USER_DAO.getUserByID(userID);
    }

    /**
     * Get role's name by role's id
     *
     * @param roleID
     * @return String representation of role name, or null if there is no roleID
     */
    public String getRoleName(int roleID) {
        return USER_ROLE_DAO.getRoleName(roleID);
    }

    /**
     * Unban an user by user's id. An account is only capable of unban when it
     * is not already banned or deleted. After unban, account will we set to UNV
     * status (unverified email)
     *
     * @param userID
     * @throws java.lang.Exception User does not exist or user's status is not
     * banned
     */
    public void unbanUser(int userID) throws Exception {
        Users user = getUserByID(userID);
        // check for existence of user
        if (user == null) {
            throw new Exception("Cannot unban user, user does not exist");
        }
        // check status of user
        Users.Status status = user.getStatus();
        if (status == Users.Status.BAN) {
            // unban user by updating user's status
            user.setStatus(Users.Status.UNV);

            // update User_Banned table
            UserBanned banned = BAN_DAO.getBannedUserByID(userID);
            if (banned == null) {
                throw new Exception("UserID " + userID + " does not get banned");
            }
            banned.setStatus(UserBanned.Status.Disable); // disable ban penalize

            // Save changes to the database
            BAN_DAO.updateBannedByID(banned);
            USER_DAO.updateUser(user);
        } else {
            throw new Exception("Cannot unban user that are not banned");
        }

    }

    public UserAvatar getAvatarByUserID(int id) {
        UserAvatarDAO dao = new UserAvatarDAO();
        return dao.getAvatarByUserID(id);
    }

    public boolean updateUserAvatar(int userID, String avatarURL) {
        UserAvatarDAO dao = new UserAvatarDAO();
        return dao.updateAvatar(userID, avatarURL);
    }

    public boolean uploadAvatarAndSetAsProfileImage(int userId, Part filePart, String appPath) {
        String fileName = getFileName(filePart);
        if (!fileName.equals("unknown.jpg") && !fileName.isEmpty()) {
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);
            String newFileName = "user-id-" + userId + "-avatar." + fileExtension;

            String savePath = appPath + File.separator + "web" + File.separator + "assets" + File.separator + "img";
            String saveSQLpath = "./assets/img/" + newFileName;

            try ( InputStream fileContent = filePart.getInputStream()) {
                Path filePath = Paths.get(savePath, newFileName);
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                if (this.updateUserAvatar(userId, saveSQLpath)) {
                    return true;
                }
            } catch (IOException ex) {
                Logger.getLogger(LandlordService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    public String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown.jpg";
    }
}
