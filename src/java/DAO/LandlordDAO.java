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
import model.Landlord;

/**
 *
 * @author DTS
 */
public class LandlordDAO extends DBContext {

    /**
     *
     * @return
     */
    public List<Landlord> getAllLandlords() {
        List<Landlord> landlords = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Landlord;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String address = rs.getString(4);
                String phone = rs.getString(5);
                String civilID = rs.getString(6);
                int point = rs.getInt(7);

                Landlord landlord = new Landlord(id, firstName, lastName, address, phone, civilID, point);
                landlords.add(landlord);
            }
        } catch (SQLException ex) {
            System.err.println("getAllLandlords() function report: " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return landlords;
    }

    /**
     *
     * @param landlord
     * @return
     */
    public int addLandlord(Landlord landlord) {
        int added = 0;
        String sqlCommand = "INSERT INTO [Landlord] ([id],[first_name],[last_name],[address],[phone],[civil_id],[account_points])\n"
                + "     VALUES (?,?,?,?,?,?,?)";

        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);

            preStatement.setInt(1, landlord.getId());
            preStatement.setString(2, landlord.getFirstName());
            preStatement.setString(3, landlord.getLastName());
            preStatement.setString(4, landlord.getAddress());
            preStatement.setString(5, landlord.getPhone());
            preStatement.setString(6, landlord.getCivilID());
            preStatement.setInt(7, landlord.getPoint());

            added = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addLandlord() reports: " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return added;
    }

    /**
     * Get landlord by user's id
     * @param userID
     * @return Landlord object corresponding to user's id, or null if there is no landlord
     */
    public Landlord getLandlordByUserID(int userID) {
        String sqlCommand = "SELECT * FROM Landlord WHERE id = ?;";
        Landlord l = null;
        try {
            PreparedStatement pre = connect.prepareStatement(sqlCommand);
            pre.setInt(1, userID);

            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String address = rs.getString(4);
                String phone = rs.getString(5);
                String civilID = rs.getString(6);
                int point = rs.getInt(7);

                l = new Landlord(id, firstName, lastName, address, phone, civilID, point);
            }
        } catch (SQLException ex) {
            System.err.println("getLandlordByEmail() reports: " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return l;
    }

    /**
     * Update landlord which has id in the DB = landlord.id
     *
     * @param landlord
     * @return
     */
    public int updateLandlordByID(Landlord landlord) {
        String sqlCommand = "UPDATE [Landlord]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[civil_id] = ?\n"
                + "      ,[account_points] = ?\n"
                + " WHERE id = ?;";
        int modified = 0;
        try {
            PreparedStatement pstmt = connect.prepareStatement(sqlCommand);
            pstmt.setString(1, landlord.getFirstName());
            pstmt.setString(2, landlord.getLastName());
            pstmt.setString(3, landlord.getAddress());
            pstmt.setString(4, landlord.getPhone());
            pstmt.setString(5, landlord.getCivilID());
            pstmt.setInt(6, landlord.getPoint());
            pstmt.setInt(7, landlord.getId());

            modified = pstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateLandlordByEmail() reports " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modified;
    }

    public int updateProfileByID(int landlord_id, String fname, String lname, String address, String phone) {
        int n = 0;
        String sql = "UPDATE [Landlord] SET [first_name]=?,[last_name] = ?,[address]=? ,[phone] = ? WHERE [id]=?;";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, fname);
            pre.setString(2, lname);
            pre.setString(3, address);
            pre.setString(4, phone);
            pre.setInt(5, landlord_id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateProfileByID() reports " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean UpdateAccountPoints(int userId, int accountPoints) {
        try {
            String sql = "UPDATE Landlord SET account_points=? WHERE id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, accountPoints);
            stm.setInt(2, userId);
            int rowUpdated = stm.executeUpdate();
            return (rowUpdated > 0);
        } catch (SQLException ex) {
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateLandlordInfo(int userid, String fname, String lname, String civilid, String address, String phone) {
        String SQL = "UPDATE [dbo].[Landlord]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[civil_id] = ?\n"
                + " WHERE id = ?;";

        try {
            PreparedStatement preStmt = connect.prepareStatement(SQL);
            preStmt.setString(1, fname);
            preStmt.setString(2, lname);
            preStmt.setString(3, address);
            preStmt.setString(4, phone);
            preStmt.setString(5, civilid);
            preStmt.setInt(6, userid);

            preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateLandlordInfo(int userid, String fname, String lname, String civilid, String address, String phone) reports " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
