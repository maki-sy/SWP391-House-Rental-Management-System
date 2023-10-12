/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Promotion;
//

/**
 *
 * @author Administrator
 */
public class PromotionDAO extends DBContext {

    public void addPromotion(Promotion promotion) {
        try {
            String sql = "INSERT INTO [dbo].[Promotions]\n"
                    + "           ([discount]\n"
                    + "           ,[descriptions]\n"
                    + "           ,[promotion_start_date]\n"
                    + "           ,[promotion_end_date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, promotion.getDiscount());
            stm.setString(2, promotion.getDescriptions());
            stm.setDate(3, promotion.getPromotion_start_date());
            stm.setDate(4, promotion.getPromotion_end_date());
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("addPromotion() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removePromotion(int promotion_id) {
        try {
            String sql = "DELETE FROM [dbo].[Promotions]\n"
                    + "      WHERE promotion_id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, promotion_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("removePromotion() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int createReturnPromotionID(Promotion promotion) {
        try {
            String sql = "INSERT INTO [dbo].[Promotions]\n"
                    + "           ([discount]\n"
                    + "           ,[descriptions]\n"
                    + "           ,[promotion_start_date]\n"
                    + "           ,[promotion_end_date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, promotion.getDiscount());
            stm.setString(2, promotion.getDescriptions());
            stm.setDate(3, promotion.getPromotion_start_date());
            stm.setDate(4, promotion.getPromotion_end_date());
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.err.println("addPromotion() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Promotion> getAllPromotion() {
        List<Promotion> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Promotions";
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Promotion pro = new Promotion();
                pro.setPromotion_id(rs.getInt(1));
                pro.setDiscount(rs.getInt(2));
                pro.setDescriptions(rs.getString(3));
                pro.setPromotion_start_date(rs.getDate(4));
                pro.setPromotion_end_date(rs.getDate(5));
                list.add(pro);
            }
        } catch (SQLException ex) {
            System.err.println("getAllPromotion() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Promotion GetPromotionByID(int id) {
        String sql = "SELECT * FROM Promotions WHERE promotion_id=" + id;
        ResultSet rs = getData(sql);
        Promotion pro = new Promotion();
        try {
            while (rs.next()) {
                pro.setPromotion_id(rs.getInt(1));
                pro.setDiscount(rs.getInt(2));
                pro.setDescriptions(rs.getString(3));
                pro.setPromotion_start_date(rs.getDate(4));
                pro.setPromotion_end_date(rs.getDate(5));
            }
        } catch (SQLException ex) {
            System.err.println("getPromotionById() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }

    public void UpdatePromotionDiscountDes(int discount, String des, int id) {
        try {
            String sql = "UPDATE Promotions SET discount = ?,descriptions=? WHERE promotion_id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, discount);
            stm.setString(2, des);
            stm.setInt(3, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("UpdatePromotionDiscountDes() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdatePromotionDuration(Date start, Date end, int id) {
        try {
            String sql = "UPDATE Promotions SET promotion_start_date = ?,promotion_end_date = ? WHERE promotion_id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setDate(1, start);
            stm.setDate(2, end);
            stm.setInt(3, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("UpdatePromotionDuration() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Promotion> GetPromotionByLandlordId(int id) {
        List<Promotion> list = new ArrayList<>();
        String sql = "SELECT landlord_id, a.promotion_id, discount, descriptions, promotion_start_date, promotion_end_date\n"
                + "FROM Post a\n"
                + "JOIN Promotions b ON a.promotion_id = b.promotion_id\n"
                + "WHERE landlord_id = \n" + id
                + "GROUP BY landlord_id, a.promotion_id, discount, descriptions, promotion_start_date, promotion_end_date;";
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Promotion pro = new Promotion();
                pro.setPromotion_id(rs.getInt("promotion_id"));
                pro.setDiscount(rs.getInt("discount"));
                pro.setDescriptions(rs.getString("descriptions"));
                pro.setPromotion_start_date(rs.getDate("promotion_start_date"));
                pro.setPromotion_end_date(rs.getDate("promotion_end_date"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            System.err.println("GetPromotionByLandlordId() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        PromotionDAO d = new PromotionDAO();
        //       d.removePromotion(10); ok
//        List<Promotion> list = d.getAllPromotion();
//        for (Promotion promotion : list) {
//            System.out.println(promotion.getPromotion_id());
//        }
//        Promotion pro = d.GetPromotionByID(4);
//        System.out.println(pro.getPromotion_id());
//        d.UpdatePromotionDiscountDes(40, "ok", 4);
//        long miliSeconds = System.currentTimeMillis();
//        Date date1 = new Date(miliSeconds);
//        d.UpdatePromotionDuration(date1, date1, 4);
    }

}
