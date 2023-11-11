/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Wishlist;

/**
 *
 * @author DTS
 */
public class WishlistDAO extends DBContext {

    /**
     *
     * @return
     */
    public List<Wishlist> getAll() {
        List<Wishlist> wishes = new ArrayList<>();

        String SQL = "SELECT * FROM Wishlist";

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int uid = rs.getInt(2);
                int pid = rs.getInt(3);

                Wishlist w = new Wishlist(id, uid, pid);
                wishes.add(w);
            }
        } catch (SQLException ex) {
            System.out.println("getAll() Wishlist reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return wishes;
    }

    /**
     *
     * @param userID
     * @return
     */
    public List<Wishlist> getWishlistByUserID(int userID) {
        String SQL = "SELECT * FROM Wishlist WHERE user_id = ?";
        List<Wishlist> wishes = new ArrayList<>();

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userID);

            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int uid = rs.getInt(2);
                int pid = rs.getInt(3);

                Wishlist w = new Wishlist(id, uid, pid);
                wishes.add(w);
            }
        } catch (SQLException ex) {
            System.out.println("getWishlistByUserID reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return wishes;
    }

    /**
     * Add wish to Wishlist
     *
     * @param wish
     * @return
     */
    public int addWish(Wishlist wish) {
        String SQL = "INSERT INTO [Wishlist]\n"
                + "           ([user_id]\n"
                + "           ,[property_id])\n"
                + "     VALUES\n"
                + "           (?,?);";
        int added = 0;

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, wish.getId());
            preStmt.setInt(2, wish.getPostId());

            added = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("addWish reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return added;
    }

    /**
     *
     * @param userID
     * @param postID
     * @return
     */
    public int addWish(int userID, int postID) {
        String SQL = "INSERT INTO [Wishlist]\n"
                + "           ([user_id]\n"
                + "           ,[property_id])\n"
                + "     VALUES\n"
                + "           (?,?);";
        int added = 0;

        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userID);
            preStmt.setInt(2, postID);

            added = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("addWish reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return added;
    }

    /**
     *
     * @param wishID
     * @return
     */
    public int deleteWishByID(int wishID) {
        String SQL = "DELETE FROM [dbo].[Wishlist]\n"
                + "      WHERE id = ?;";
        int deleted = 0;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, wishID);
            deleted = preStmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("deleteWishByID() reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deleted;
    }

    /**
     * Delete a wish of a user for a post
     *
     * @param userId
     * @param postId
     * @return
     */
    public int deleteWishById(int userId, int postId) {
        String SQL = "DELETE FROM [dbo].[Wishlist]\n"
                + "      WHERE user_id = ? AND property_id = ?;";
        int deleted = 0;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userId);
            preStmt.setInt(2, postId);

            deleted = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("deleteWishById reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return deleted;
    }

    /**
     * Check whether this property has been added to user's wish list before
     *
     * @param userId
     * @param postId
     * @return true if property has already been added to user's wish list
     */
    public boolean checkExist(int userId, int postId) {
        boolean added = false;
        String SQL = "SELECT id FROM Wishlist WHERE user_id = ? AND property_id = ?;";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, userId);
            preStmt.setInt(2, postId);

            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                added = true;
            }
        } catch (SQLException ex) {
            System.out.println("checkExist() reports " + ex.getMessage());
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return added;
    }
}
