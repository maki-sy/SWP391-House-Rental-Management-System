/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        String SQL = "SELECT * FROM Users WHERE email = ?;";
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, email);
            ResultSet rs = preStmt.executeQuery();
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
     * @param user Users object to added to the DB. userID field will be ignored
     * since user_id in the DB is set as IDENTITY
     * @return ID of user have just added to the DB. Or -1 if there is error
     */
    public int addUser(Users user) {
        // Method 1: INSERT return user_id
//        String SQL = "INSERT INTO Users (email, hashed_password, salt, role_id, status)\n"
//                + "  OUTPUT INSERTED.id\n"
//                + "VALUES (?,?,?,?,?);";

        // Method 2: Using PreparedStatement to return IDENTITY columns
        String SQL = "INSERT INTO USers(email, hashed_password, salt, role_id, status\n)"
                + "VALUES (?,?,?,?,?);";

        // ===== DEBUG =====
        System.out.println(user);
        // ===== DEBUG =====
        int userID = -1;

        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            preStmt.setString(1, user.getEmail());
            preStmt.setBytes(2, user.getHashedPassword());
            preStmt.setBytes(3, user.getSalt());
            preStmt.setInt(4, user.getRoleID());
            preStmt.setString(5, user.getStatus().name());

            preStmt.executeUpdate();

            // get id IDENTITY column SQL just generated for us
            ResultSet userRS = preStmt.getGeneratedKeys();
            if (userRS.next()) {
                userID = userRS.getInt(1);
                System.out.println("User added with IDENTITY id = " + userID);
                return userID;
            }
        } catch (SQLException ex) {
            System.out.println("addUser() reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userID;
    }

    /**
     *
     * @return
     */
    public int getLastUserID() {
        String SQL = "SELECT IDENT_CURRENT('[Users]');";
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
     * @param email
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

    public boolean checkEmail(String email) {
        String SQL = "SELECT * FROM Users WHERE email = ?;";
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, email);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("checkEmail(String email) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateUserPassword(Users user, byte[] password, byte[] salt) {
        String SQL = "UPDATE Users set hashed_password = ?, salt = ? where id = ?";
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setBytes(1, password);
            preStmt.setBytes(2, salt);
            preStmt.setInt(3, user.getId());

            preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateUserPassword(Users user, byte[] password) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Get verified account corresponding to email
     *
     * @param email
     * @return Users object that verified and corresponding to email. Or null if
     * there is no user.
     */
    public Users getVerifiedAccount(String email) {
        String SQL = "SELECT * FROM Users WHERE email = ? AND status != ?;";
        Users user = null;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setString(1, email);
            preStmt.setString(2, Users.Status.UNV.name());

            ResultSet rs = preStmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                byte[] hashedPwd = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                int roleID = rs.getInt(5);
                Users.Status status = Users.Status.valueOf(rs.getString(6));

                user = new Users(id, email, hashedPwd, salt, roleID, status);
            }

        } catch (Exception ex) {
            System.out.println("getVerifiedAccount() reports " + ex.getMessage());
        }

        return user;
    }

    public String getUserRole(Users user) {
        int role_id = user.getRoleID();
        String SQL = "SELECT role_name FROM User_role WHERE id = ?;";
        String role_name = null;
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setInt(1, role_id);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                role_name = rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println("getUserRole(int roleID) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return role_name;
    }

    public void updateUserInfo(int userid, String email, String status) {
        String SQL = "UPDATE [dbo].[Users]\n"
                + "   SET [email] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?;";

        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, email);
            preStmt.setString(2, status);
            preStmt.setInt(3, userid);

            preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateUser(Users user) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int userid) {
        String role = getUserRole(getUserByID(userid));
        switch (role) {
            case "Tenant":
                String SQL1 = "delete from Tenant where id = ?";
                try {
                    PreparedStatement preStmt = connect.prepareStatement(SQL1);
                    preStmt.setInt(1, userid);

                    preStmt.executeUpdate();
                } catch (SQLException ex) {
                    System.out.println("deleteUser(int userid) reports " + ex.getMessage());
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "Landlord":
                String SQL2 = "delete from Landlord where id = ?";
                try {
                    PreparedStatement preStmt = connect.prepareStatement(SQL2);
                    preStmt.setInt(1, userid);

                    preStmt.executeUpdate();
                } catch (SQLException ex) {
                    System.out.println("deleteUser(int userid) reports " + ex.getMessage());
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "Admin":
                String SQL3 = "delete from Admin where id = ?";
                try {
                    PreparedStatement preStmt = connect.prepareStatement(SQL3);
                    preStmt.setInt(1, userid);

                    preStmt.executeUpdate();
                } catch (SQLException ex) {
                    System.out.println("deleteUser(int userid) reports " + ex.getMessage());
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
        }

        String SQL = "delete from Users where id = ?";
        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setInt(1, userid);

            preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("deleteUser(int userid) reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Update user's status by ID. If there is no id corresponding, update will
     * be performed, but no effect to the DB
     *
     * @param userID
     * @param status
     * @return
     */
    public int updateUserStatus(int userID, Users.Status status) {
        String SQL = "UPDATE [dbo].[Users]\n"
                + "   SET [status] = ?\n"
                + " WHERE id = ?;";

        int updated = 0;

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(2, userID);
            preStmt.setString(1, status.name());

            updated = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateUserStatus() reports " + ex.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return updated;
    }
}
