/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.TokenDAO;
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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Landlord;
import model.Tenant;
import model.Token;

/**
 *
 * @author DTS
 */
public class UserService {

    private static final TenantDAO TENANT_DAO = new TenantDAO();
    private static final LandlordDAO LANDLORD_DAO = new LandlordDAO();
    private static final TokenDAO TOKEN_DAO = new TokenDAO();
//    private static final UserDAO USER_DAO = new UserDAO();

    /**
     *
     * @param firstName
     * @param lastName
     * @param email
     * @param phone
     * @param password Raw password
     */
    public void registerTenant(String firstName, String lastName, String email, String phone, String password) {
        // Check for Tenant with existance emai
        Tenant tenant = TENANT_DAO.getTenantByEmail(email);
        if (tenant == null) { // email have not been registered
            byte[] salt = generateSalt();
            byte[] hashedPassword = hashingPassword(password, salt);

            // tenantID is set IDENTITY, we don't need to explicit set it. -1 is just a dummy value
            tenant = new Tenant(-1, email, hashedPassword, salt, firstName, lastName, null, phone, null, Tenant.TenantStatus.UNV);
            TENANT_DAO.addTenant(tenant);

            // Generate token for email verification
            Token token = generateToken("TEN", email, Token.TokenType.CONFIRMATION);

            // Send an email with token to user's email to verify email address
            sendConfirmationEmail(email, token.getToken());
        } else { // this email has already been used
            // DEBUG
            System.out.println("Email " + email + " has already been registered as Tenant role");
        }
    }

    public void registerLandlord(String firstName, String lastName, String email, String phone, String password) {
        Landlord landlord = LANDLORD_DAO.getLandlordByEmail(email);
        if (landlord == null) { // email have not been registered
            byte[] salt = generateSalt();
            byte[] hashedPassword = hashingPassword(password, salt);

            // landlordID is set IDENTITY, we don't need to explicit set it. -1 is just a dummy value
            landlord = new Landlord(-1, email, hashedPassword, salt, firstName, lastName, null, phone, null, Landlord.LandlordStatus.UNV, 0);
            LANDLORD_DAO.addLandlord(landlord);
            
            // Generate token for email verification
            Token token = generateToken("LAN", email, Token.TokenType.CONFIRMATION);

            // Send an email with token to user's email to verify email address
            sendConfirmationEmail(email, token.getToken());
        } else {
            // DEBUG
            System.out.println("Email " + email + " has already been registered as Landlord role");
        }

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
     * characters indicate user role)
     */
    private void sendConfirmationEmail(String receivedEmail, String token) {
        String subject = "Confirm registration for House Rental Management System";
        String content = "Hi " + receivedEmail + ", you received this email because you've been registered as a member in our website. Here is your confimation link to verify your email <a target=\"_blank\" href=\"http://localhost:8080/SWP391-House-Rental-Management/verify?token=" + token + "\">CLICK HERE TO CONFIRM</a>";

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
     * @param usrRole First 3 characters role of an user (TEN, ADM, LAN)). In
     * this function, user's role will be embedded to the raw token, therefore
     * when server interpret token, it can determine user role just by looking
     * at the token
     * @param email email to generate token, after the token is generated, an
     * record will be added to the DB corresponding to this email
     * @param type Token's type as in Token.TokenType
     *
     * @return token object just created
     */
    private Token generateToken(String usrRole, String email, Token.TokenType type) {
        String tokenStr = generateTokenStr();
        tokenStr = usrRole + tokenStr;

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime expire = now.plusMinutes(10); // token will expire in 10 minutes

        // token id is IDENTITTY in DB, -1 is just a dummy value
        Token token = new Token(-1, email, tokenStr, expire.toString(), type);
        TOKEN_DAO.addToken(token);
        return token;
    }

    /**
     * Login for tenant and landlord
     *
     * @param email
     * @param password raw password user inputted
     * @return Object represent Tenant or Landlord if login success, null if
     * unsuccess
     */
    public Object login(String email, String password) {

        Tenant t = TENANT_DAO.getTenantByEmail(email);
        if (t != null) {
            byte[] salt = t.getSalt();
            byte[] correctPass = t.getHashedPassword();
            byte[] inputPass = hashingPassword(password, salt);
            boolean sucess = Arrays.equals(correctPass, inputPass);
            if (sucess) {
                return t;
            } else {
                return null;
            }
        }

        Landlord l = LANDLORD_DAO.getLandlordByEmail(email);
        if (l != null) {
            byte[] salt = l.getSalt();
            byte[] correctPass = l.getHashedPassword();
            byte[] inputPass = hashingPassword(password, salt);
            boolean sucess = Arrays.equals(correctPass, inputPass);
            if (sucess) {
                return l;
            } else {
                return null;
            }
        }

        return null; // NEED TO UPDATE ASAP
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
     */
    public void verifyEmail(String tokenStr) {

        Token token = TOKEN_DAO.getToken(tokenStr);
        if (token == null) { // invalid token: token does not exist in the DB
            System.out.println("Token does not exist in the DB");
            return;
        }

        // Check for expire time of token
        boolean expired = isTokenExpire(token);
        if (expired) { // If token already expired
            System.out.println("Token expired");
            return;
        }
        // Intepret the first 3 characters to determine user role
        String role = tokenStr.substring(0, 3);

        switch (role) {
            case "TEN":
                Tenant tenant = TENANT_DAO.getTenantByEmail(token.getEmail());
                tenant.setStatus(Tenant.TenantStatus.VER);
                TENANT_DAO.updateTenantByEmail(tenant);
                break;
                
            case "LAN":
                Landlord landlord = LANDLORD_DAO.getLandlordByEmail(token.getEmail());
                landlord.setStatus(Landlord.LandlordStatus.VER);
                LANDLORD_DAO.updateLandlordByEmail(landlord);
                break;
        }
    }

    /**
     * Check whether passed token is still valid in time
     *
     * @param token an existed token in the DB
     * @return true if token has been expired, false otherwise
     */
    private boolean isTokenExpire(Token token) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.[SSS][SS]");
        System.out.println("Time: " + token.getExpireDate());
        LocalDateTime tokenTime = LocalDateTime.parse(token.getExpireDate(), formatter);
        LocalDateTime now = LocalDateTime.now();

        return tokenTime.isBefore(now);
    }

    public static void main(String[] args) {
//        UserService u = new UserService();
//        // Generate token for email verification
//        Token token = u.generateToken("TEN", "haquangthangtn@gmail.com", Token.TokenType.CONFIRMATION);
//
//        // Send an email with token to user's email to verify email address
//        u.sendConfirmationEmail("haquangthangtn@gmail.com", token.getToken());

//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.[SSS][SS]");
//        LocalDateTime test = LocalDateTime.parse("2023-09-24 19:55:44.02", formatter);
//        System.out.println(test);
        Token token = TOKEN_DAO.getToken("TEN1QPvZJFuZVWltaXwQCpmpNwB5bE");
        String time = token.getExpireDate();
//        String formatted = 
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.[SSS][SS]");

        System.out.println(LocalDateTime.parse(time, formatter));
//
//        String dateTimeStr1 = "2023-09-24 19:55:44.020";
//        String dateTimeStr2 = "2023-09-24 19:55:44.02";
//
//        LocalDateTime dateTime1 = LocalDateTime.parse(dateTimeStr1, formatter);
//        LocalDateTime dateTime2 = LocalDateTime.parse(dateTimeStr2, formatter);
    }
}
