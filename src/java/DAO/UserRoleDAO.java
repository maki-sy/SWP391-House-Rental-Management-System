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

/**
 *
 * @author DTS
 */
public class UserRoleDAO extends DBContext {

    /**
     * Get role's name by role's id
     *
     * @param roleID
     * @return String representation of role name, or null if there is no roleID
     */
    public String getRoleName(int roleID) {
        String SQL = "SELECT role_name FROM User_role WHERE id = ?;";
        String roleName = null;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, roleID);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                roleName = rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println("getRoleName() reports " + ex.getMessage());
            Logger.getLogger(UserRoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return roleName;
    }

}
