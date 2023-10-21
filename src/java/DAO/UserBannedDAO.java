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
import model.UserBanned;

/**
 *
 * @author DTS
 */
public class UserBannedDAO extends DBContext {

    /**
     * Check banned status of an account by user's id
     *
     * @param userID
     * @return true if this account has been banned, false otherwise
     */
    public boolean checkBannedByID(int userID) {
        String SQL = "SELECT * FROM User_banned WHERE id = ?;";
        boolean banned = false;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userID);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                banned = true;
            }
        } catch (SQLException ex) {
            System.out.println("checkBannedByID() reports " + ex.getMessage());
            Logger.getLogger(UserBannedDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return banned;
    }

    /**
     * Add UserBanned record to the database
     *
     * @param user
     * @return
     */
    public int addUserBanned(UserBanned user) {
        String SQL = "INSERT INTO [dbo].[User_banned]\n"
                + "           ([id]\n"
                + "           ,[email]\n"
                + "           ,[ban_start_date]\n"
                + "           ,[ban_end_date]\n"
                + "           ,[status])\n"
                + "     VALUES (?,?,?,?,?);";

        int added = 0;

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, user.getId());
            preStmt.setString(2, user.getEmail());
            preStmt.setString(3, user.getStartDate());
            preStmt.setString(4, user.getEndDate());
            preStmt.setString(5, user.getStatus().name());

            added = preStmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("addUserBanned() reports " + ex.getMessage());
            Logger.getLogger(UserBannedDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return added;
    }
}
