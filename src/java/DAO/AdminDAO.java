/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author DTS
 */
public class AdminDAO extends DBContext {

    /**
     * Get Admin object by UserID.
     *
     * @param id
     * @return Admin object corresponding to UserID, or null if there is no
     * Admin meet the criterion.
     */
    public Admin getAdminByID(int id) {
        String SQL = "SELECT * FROM Admin WHERE id = ?;";
        Admin admin = null;

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, id);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String phone = rs.getString(4);

                admin = new Admin(id, firstName, lastName, phone);
            }

        } catch (SQLException ex) {
            System.out.println("getAdminByID() reports " + ex.getMessage());
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return admin;
    }
    
    public void addAdmin(Admin admin) {
        String sqlCommand = "INSERT INTO [Admin] ([id],[first_name],[last_name],[Phone])\n"
                + "     VALUES (?,?,?,?)";

        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);

            preStatement.setInt(1, admin.getId());
            preStatement.setString(2, admin.getFirstName());
            preStatement.setString(3, admin.getLastName());
            preStatement.setString(4, admin.getPhone());

            preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addAdmin() reports: " + ex.getMessage());
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateAdminInfo(int userid, String fname, String lname, String phone) {
        String SQL = "UPDATE [dbo].[Admin]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[Phone] = ?\n"
                + " WHERE id = ?;";

        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, fname);
            preStmt.setString(2, lname);
            preStmt.setString(3, phone);
            preStmt.setInt(4, userid);

            preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateAdminInfo() reports " + ex.getMessage());
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
