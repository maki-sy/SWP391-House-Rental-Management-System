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
     * @return true if this account has been banned and in active, false otherwise
     */
    public boolean checkBannedByID(int userID) {
        String SQL = "SELECT * FROM User_banned WHERE id = ? AND status = ?;";
        boolean banned = false;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userID);
            preStmt.setString(2, UserBanned.Status.Active.name());
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

    /**
     * Get UserBanned object by user's id. If there is no userID corresponding
     * in the UserBanned table, this function returns null
     *
     * @param userID
     * @return UserBanned object
     */
    public UserBanned getBannedUserByID(int userID) {
        UserBanned banned = null;
        String SQL = "SELECT * FROM User_banned WHERE id = ?;";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userID);
            
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                String email = rs.getString(2);
                String startDate = rs.getString(3);
                String endDate = rs.getString(4);
                UserBanned.Status status = UserBanned.Status.valueOf(rs.getString(5));
                
                banned = new UserBanned(userID, email, startDate, endDate, status);
            }
        } catch (SQLException ex) {
            System.out.println("getBannedUserByID() reports " + ex.getMessage());
            Logger.getLogger(UserBannedDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return banned;
    }
    
    public int updateBannedByID(UserBanned ban) {
        String SQL = "UPDATE [dbo].[User_banned]\n"
                + "   SET [email] = ?\n"
                + "      ,[ban_start_date] = ?\n"
                + "      ,[ban_end_date] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?;";
        
        int updated = 0;
        
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setString(1, ban.getEmail());
            preStmt.setString(2, ban.getStartDate());
            preStmt.setString(3, ban.getEndDate());
            preStmt.setString(4, ban.getStatus().name());
            preStmt.setInt(5, ban.getId());
            
            updated = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("updateBannedByID() reports " + ex.getMessage());
            Logger.getLogger(UserBannedDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return updated;
    }
}
