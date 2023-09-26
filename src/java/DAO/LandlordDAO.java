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
                String email = rs.getString(2);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                String firstName = rs.getString(5);
                String lastName = rs.getString(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                String civilID = rs.getString(9);
                Landlord.LandlordStatus status = Landlord.LandlordStatus.valueOf(rs.getString(10));
                int point = rs.getInt(11);

                Landlord landlord = new Landlord(id, email, hashedPassword, salt, firstName, lastName, address, phone, civilID, status, point);
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
        String sqlCommand = "INSERT INTO [Landlord] ([email],[hashed_password],[salt],[first_name],[last_name],[address],[phone],[civil_id],[status],[account_points])\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);

            preStatement.setString(1, landlord.getEmail());
            preStatement.setBytes(2, landlord.getHashedPassword());
            preStatement.setBytes(3, landlord.getSalt());
            preStatement.setString(4, landlord.getFirstName());
            preStatement.setString(5, landlord.getLastName());
            preStatement.setString(6, landlord.getAddress());
            preStatement.setString(7, landlord.getPhone());
            preStatement.setString(8, landlord.getCivilID());
            preStatement.setString(9, landlord.getStatus().name());
            preStatement.setInt(10, landlord.getPoint());

            added = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addLandlord() reports: " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return added;
    }

    /**
     *
     * @param email
     * @return
     */
    public Landlord getLandlordByEmail(String email) {
        String sqlCommand = "SELECT * FROM Landlord WHERE email = ?;";
        Landlord l = null;
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
                Landlord.LandlordStatus status = Landlord.LandlordStatus.valueOf(rs.getString(10));
                int point = rs.getInt(11);

                l = new Landlord(id, email, hashedPassword, salt, firstName, lastName, address, phone, civilID, status, point);
            }
        } catch (SQLException ex) {
            System.err.println("getLandlordByEmail(String email) reports: " + ex.getMessage());
            Logger.getLogger(TenantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return l;
    }

    public int updateLandlordByEmail(Landlord landlord) {
        String sqlCommand = "UPDATE [Landlord]\n"
                + "   SET [hashed_password] = ?\n"
                + "      ,[salt] = ?\n"
                + "      ,[first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[civil_id] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[account_points] = ?\n"
                + " WHERE email = ?;";
        int modified = 0;
        try {
            PreparedStatement pstmt = connect.prepareStatement(sqlCommand);
            pstmt.setBytes(1, landlord.getHashedPassword());
            pstmt.setBytes(2, landlord.getSalt());
            pstmt.setString(3, landlord.getFirstName());
            pstmt.setString(4, landlord.getLastName());
            pstmt.setString(5, landlord.getAddress());
            pstmt.setString(6, landlord.getPhone());
            pstmt.setString(7, landlord.getCivilID());
            pstmt.setString(8, landlord.getStatus().name());
            pstmt.setInt(9, landlord.getPoint());
            pstmt.setString(10, landlord.getEmail());

            modified = pstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateLandlordByEmail() reports " + ex.getMessage());
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modified;
    }

    public Landlord getLandlordById(int targetId) {
        String sqlCommand = "SELECT * FROM Landlord WHERE id = ?;";
        try {
            PreparedStatement pre = connect.prepareStatement(sqlCommand);
            pre.setInt(1, targetId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String email = rs.getString(2);
                byte[] hashedPassword = rs.getBytes(3);
                byte[] salt = rs.getBytes(4);
                String firstName = rs.getString(5);
                String lastName = rs.getString(6);
                String address = rs.getString(7);
                String phone = rs.getString(8);
                String civilID = rs.getString(9);
                Landlord.LandlordStatus status = Landlord.LandlordStatus.valueOf(rs.getString(10));
                int point = rs.getInt(11);
                Landlord landlord = new Landlord(id, email, hashedPassword, salt, firstName, lastName, address, phone, civilID, status, point);
                return landlord;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

}
