/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Review;
import model.Tenant;

/**
 *
 * @author Administrator
 */
public class ReviewDAO extends DBContext {

    public void addReview(Review review) {
        try {
            String sql = "INSERT INTO [dbo].[Review]\n"
                    + "           ([user_id]\n"
                    + "           ,[property_id]\n"
                    + "           ,[review_date]\n"
                    + "           ,[rating]\n"
                    + "           ,[review])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)\n";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, review.getUser_id());
            stm.setInt(2, review.getProperty_id());
            stm.setDate(3, review.getReview_date());
            stm.setInt(4, review.getRating());
            stm.setString(5, review.getReview());
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addReview() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Tenant> getReviewByPostId(int id) {
        List<Tenant> list = new ArrayList<>();
        String sql = "SELECt a.rating,a.review,b.first_name,b.last_name,b.phone,a.review_date\n"
                + "  FROM Review a JOIN Tenant b ON a.user_id=b.id WHERE property_id = ?";
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int rid = rs.getInt("rating");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String review = rs.getString("review");
                String phone = rs.getString("phone");
                String civilID = rs.getString("review_date");
                Tenant te = new Tenant(rid, firstName, lastName, review, phone, civilID);
                list.add(te);
            }
        } catch (SQLException ex) {
            System.err.println("getReviewByPostId() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ReviewDAO d = new ReviewDAO();
//        Review review= new Review(-1,2,2,2,"hay");
//        d.addReview(review);
//        Date local = Date.valueOf(LocalDate.now());
//        Review re = new Review(-1, 2, 2, local, 4, "hay");
//        d.addReview(re);
//        List<Tenant> list = new ArrayList<>();
//        list = d.getReviewByPostId(1);
//        for (Tenant tenant : list) {
//            System.out.println(tenant.getCivilID());
//        }

    }

}
