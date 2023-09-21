/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.UserDAO;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Landlord;
import model.Tenant;

/**
 *
 * @author DTS
 */
public class UserService {

    private static final TenantDAO TENANT_DAO = new TenantDAO();
    private static final LandlordDAO LANDLORD_DAO = new LandlordDAO();
    private static final UserDAO USER_DAO = new UserDAO();

    public void registerTenant(String firstName, String lastName, String email, String phone, String password) {
        byte[] salt = generateSalt();
        byte[] hashedPassword = hashingPassword(password, salt);

        // tenantID is set IDENTITY, we don't need to explicit set it. -1 is just a dummy value
        Tenant t = new Tenant(-1, email, hashedPassword, salt, firstName, lastName, null, phone, null, Tenant.TenantStatus.UNV);
        TENANT_DAO.addTenant(t);

    }

    public void registerLandlord(String firstName, String lastName, String email, String phone, String password) {
        byte[] salt = generateSalt();
        byte[] hashedPassword = hashingPassword(password, salt);

        // landlordID is set IDENTITY, we don't need to explicit set it. -1 is just a dummy value
        Landlord landlord = new Landlord(-1, email, hashedPassword, salt, firstName, lastName, null, phone, null, Landlord.LandlordStatus.UNV, 0);
        LANDLORD_DAO.addLandlord(landlord);
    }

    /**
     * Login for tenant and landlord
     *
     * @param email
     * @param password raw password user inputted
     * @return Object represent Tenant or Landlord if login success, null if unsuccess
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
}
