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
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String address = rs.getString(4);
                String phone = rs.getString(5);
                String civilID = rs.getString(6);

                // https://stackoverflow.com/questions/604424/how-to-get-an-enum-value-from-a-string-value-in-java
//                Tenant.TenantStatus tStatus = Tenant.TenantStatus.valueOf(statusStr);

                Tenant t = new Tenant(id, firstName, lastName, address, phone, civilID);
                tenantList.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("getAllTenants() reports " + ex.getMessage());
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
        String sqlCommand = "INSERT INTO Tenant (id, first_name, last_name, address, phone, civil_id) VALUES\n"
                + "(?, ?, ?, ?, ?, ?);";
        int updateRecord = 0;
        System.out.println(t);
        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);
            preStatement.setInt(1, t.getId());
            preStatement.setString(2, t.getFirstName());
            preStatement.setString(3, t.getLastName());
            preStatement.setString(4, t.getAddress());
            preStatement.setString(5, t.getPhone());
            preStatement.setString(6, t.getCivilID());

            updateRecord = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addTenant() function report: " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return updateRecord;
    }

    /**
     * Get Tenant object by UserID.
     *
     * @param userID
     * @return Tenant corresponding to FK UserID, or null if there is no tenant
     * meet criterion
     */
    public Tenant getTenantByUserID(int userID) {
        String sqlCommand = "SELECT * FROM Tenant WHERE id = ?;";
        Tenant t = null;
        try {
            PreparedStatement pre = connect.prepareStatement(sqlCommand);
            pre.setInt(1, userID);

            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String address = rs.getString(4);
                String phone = rs.getString(5);
                String civilID = rs.getString(6);
                

                t = new Tenant(userID, firstName, lastName, address, phone, civilID);
            }
        } catch (SQLException ex) {
            System.err.println("getTenantByEmail(int userID) reports: " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return t;
    }

    /**
     * Update Tenant in the DB by UserID
     * @param tenant
     * @return
     */
    public int updateTenantByID(Tenant tenant) {
        String sqlCommand = "UPDATE [Tenant]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[civil_id] = ?\n"
                + " WHERE id = ?;";
        int modified = 0;
        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);

            preStatement.setString(1, tenant.getFirstName());
            preStatement.setString(2, tenant.getLastName());
            preStatement.setString(3, tenant.getAddress());
            preStatement.setString(4, tenant.getPhone());
            preStatement.setString(5, tenant.getCivilID());
            
            preStatement.setInt(6, tenant.getId());

            modified = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateTenant() reports " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modified;
    }
    public int updateProfileByID(int tenant_id, String fname, String lname, String address, String phone) { 
        int n = 0;
        String sql = "UPDATE [Tenant] SET [first_name]=?,[last_name] = ?,[address]=? ,[phone] = ? WHERE [id]=?;";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, fname);
            pre.setString(2, lname);
            pre.setString(3, address);
            pre.setString(4, phone);
            pre.setInt(5, tenant_id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
