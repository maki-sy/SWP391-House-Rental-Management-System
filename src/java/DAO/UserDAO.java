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
    public String[] checkAccount(String email) {
        String sqlCommand = "SELECT Email, 'Tenant' AS SourceTable\n"
                + "FROM Tenant\n"
                + "WHERE Email = ?\n"
                + "UNION ALL\n"
                + "SELECT Email, 'Landlord' AS SourceTable\n"
                + "FROM Landlord\n"
                + "WHERE Email = ?\n"
                + "UNION ALL\n"
                + "SELECT Email, 'Admin' AS SourceTable\n"
                + "FROM Admin\n"
                + "WHERE Email = ?;";
        String[] info = null;
        try {
            PreparedStatement pre = connect.prepareStatement(sqlCommand);
            pre.setString(1, email);
            pre.setString(2, email);
            pre.setString(3, email);
            
            ResultSet rs = pre.executeQuery();
            
            // This loop should be executed at most 1 time since email need to be unique across three tables
            while(rs.next()) {
                info = new String[4];
                info[0] = rs.getString(1); // email
                info[1] = rs.getString(2); // the table that the email belongs to
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return info;
    }
}
