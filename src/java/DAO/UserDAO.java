/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;

/**
 * Represent DAO across three tables Admin, Tenant, and Landlord
 *
 * @author DTS
 */
public class UserDAO extends DBContext {

    /**
     * Check across three tables Tenant, Admin and Landlord for existence of
     * account with email
     *
     * @param email
     * @return String[], [0] = email, [1] = table
     */
//    public String[] checkAccount(String email) {
//        String sqlCommand = "SELECT Email, 'Tenant' AS SourceTable\n"
//                + "FROM Tenant\n"
//                + "WHERE Email = ?\n"
//                + "UNION ALL\n"
//                + "SELECT Email, 'Landlord' AS SourceTable\n"
//                + "FROM Landlord\n"
//                + "WHERE Email = ?\n"
//                + "UNION ALL\n"
//                + "SELECT Email, 'Admin' AS SourceTable\n"
//                + "FROM Admin\n"
//                + "WHERE Email = ?;";
//        String[] info = null;
//        try {
//            PreparedStatement pre = connect.prepareStatement(sqlCommand);
//            pre.setString(1, email);
//            pre.setString(2, email);
//            pre.setString(3, email);
//            
//            ResultSet rs = pre.executeQuery();
//            
//            // This loop should be executed at most 1 time since email need to be unique across three tables
//            while(rs.next()) {
//                info = new String[4];
//                info[0] = rs.getString(1); // email
//                info[1] = rs.getString(2); // the table that the email belongs to
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return info;
//    }
    /**
     *
     * @return
     */
    public ArrayList<Users> getAllUsers() {
        ArrayList<Users> users = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Users;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String email = rs.getString(2);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                int roleId = rs.getInt(5);
                Users.Status status = Users.Status.valueOf(rs.getString(6));
                Users user = new Users(id, email, hashedPassword, salt, roleId, status);
                users.add(user);
            }
        } catch (SQLException ex) {
            System.out.println("getAllUsers() reports " + ex.getMessage());
        }
        return users;
    }

    /**
     * Query the Users table in DB and get all the User
     *
     * @param email
     * @return List contains all the users
     */
    public List<Users> getUsersByEmail(String email) {
        List<Users> users = new ArrayList<>();
        String SQL = "SELECT * FROM Users";
        ResultSet rs = getData(SQL);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                byte[] hashedPwd = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                int roleID = rs.getInt(5);
                Users.Status status = Users.Status.valueOf(rs.getString(6));

                users.add(new Users(id, email, hashedPwd, salt, roleID, status));
            }
        } catch (SQLException ex) {
            System.out.println("getUserByEmail() reports" + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return users;
    }

    public Users getUserByEmailRole(String email, int roleID) {
        String SQL = "SELECT * FROM Users WHERE email = ? AND role_id = ?;";
        Users user = null;
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, email);
            preStmt.setInt(2, roleID);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                byte[] hashedPwd = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                Users.Status status = Users.Status.valueOf(rs.getString(6));

                user = new Users(id, email, hashedPwd, salt, roleID, status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    /**
     *
     * @param user
     * @return
     */
    public int addUser(Users user) {
        String SQL = "INSERT INTO [Users]\n"
                + "           ([email]\n"
                + "           ,[hashed_password]\n"
                + "           ,[salt]\n"
                + "           ,[role_id]\n"
                + "           ,[status])"
                + "     VALUES (?, ?, ?, ?, ?)";

        int added = 0;
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, user.getEmail());
            preStmt.setBytes(2, user.getHashedPassword());
            preStmt.setBytes(3, user.getSalt());
            preStmt.setInt(4, user.getRoleID());
            preStmt.setString(5, user.getStatus().name());

            added = preStmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return added;
    }

    /**
     *
     * @return
     */
    public int getLastUserID() {
        String SQL = " SELECT IDENT_CURRENT('[Users]');";
        int id = 0;
        ResultSet rs = getData(SQL);
        try {
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("getLastUserID() reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    /**
     *
     * @param id
     * @return
     */
    public Users getUserByID(int id) {
        String SQL = "SELECT * FROM Users WHERE id = ?;";
        Users user = null;
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setInt(1, id);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                String email = rs.getString(2);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                int roleID = rs.getInt(5);
                Users.Status status = Users.Status.valueOf(rs.getString(6));

                user = new Users(id, email, hashedPassword, salt, roleID, status);
            }
        } catch (SQLException ex) {
            System.out.println("getUserByID(int id) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }

    public int updateUser(Users user) {
        String SQL = "UPDATE [dbo].[Users]\n"
                + "   SET [email] = ?\n"
                + "      ,[hashed_password] = ?\n"
                + "      ,[salt] = ?\n"
                + "      ,[role_id] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?;";

        int modified = 0;
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, user.getEmail());
            preStmt.setBytes(2, user.getHashedPassword());
            preStmt.setBytes(3, user.getSalt());
            preStmt.setInt(4, user.getRoleID());
            preStmt.setString(5, user.getStatus().name());
            preStmt.setInt(6, user.getId());

            modified = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateUser(Users user) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modified;
    }

    /**
     * This function check is there any account with this email has been
     * activated in the DB
     *
     * @param userID
     * @return true if already has an account with this email activated. False
     * otherwise
     */
    public boolean checkActiveAccount(String email) {
        String SQL = "SELECT * FROM Users WHERE email = ? AND status != 'UNV';";
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, email);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
