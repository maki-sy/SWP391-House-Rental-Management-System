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
import model.Tenant;
import service.UserService;

/**
 *
 * @author DTS
 */
public class TenantDAO extends DBContext {

    /**
     * Get all tenants from the DB
     *
     * @return A list contains all tenants
     */
    public List<Tenant> getAllTenants() {
        List<Tenant> tenantList = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Tenant";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String email = rs.getString(2);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                String firstName = rs.getString(5);
                String lastName = rs.getString(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                String civilID = rs.getString(9);
                String statusStr = rs.getString(10);

                // https://stackoverflow.com/questions/604424/how-to-get-an-enum-value-from-a-string-value-in-java
                Tenant.TenantStatus tStatus = Tenant.TenantStatus.valueOf(statusStr);

                Tenant t = new Tenant(id, email, hashedPassword, salt, firstName, lastName, address, phone, civilID, tStatus);
                tenantList.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return tenantList;
    }

    /**
     *
     * @param t Tenant object to be inserted to DB. !!! Note that <b>ID will be
     * ignored</b>, and will be assigned automatically by the DB
     * @return number of record added. That is 1 if inserted successfully, 0
     * otherwise
     */
    public int addTenant(Tenant t) {
        String sqlCommand = "INSERT INTO Tenant (email, hashed_password, salt, first_name, last_name, address, phone, civil_id, status) VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?);";
        int updateRecord = 0;
        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);
            preStatement.setString(1, t.getEmail());
            preStatement.setBytes(2, t.getHashedPassword());
            preStatement.setBytes(3, t.getSalt());
            preStatement.setString(4, t.getFirstName());
            preStatement.setString(5, t.getLastName());
            preStatement.setString(6, t.getAddress());
            preStatement.setString(7, t.getPhone());
            preStatement.setString(8, t.getCivilID());
            preStatement.setString(9, t.getStatus().name());

            updateRecord = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addTenant() function report: " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return updateRecord;
    }

    /**
     *
     * @param email
     * @return
     */
    public Tenant getTenantByEmail(String email) {
        String sqlCommand = "SELECT * FROM Tenant WHERE email = ?;";
        Tenant t = null;
        try {
            PreparedStatement pre = connect.prepareStatement(sqlCommand);
            pre.setString(1, email);

            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                String firstName = rs.getString(5);
                String lastName = rs.getString(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                String civilID = rs.getString(9);
                Tenant.TenantStatus status = Tenant.TenantStatus.valueOf(rs.getString(10));

                t = new Tenant(id, email, hashedPassword, salt, firstName, lastName, address, phone, civilID, status);
            }
        } catch (SQLException ex) {
            System.err.println("getTenantByEmail(String email) reports: " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }
}
