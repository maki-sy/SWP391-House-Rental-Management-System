/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import DAO.PromotionDAO;
import java.sql.Date;
import java.util.List;
import model.PostRental;
import model.Promotion;

/**
 *
 * @author Administrator
 */
public class PromotionService {

    private static final PromotionDAO PROMOTION_DAO = new PromotionDAO();
    private static final PostDAO POST_DAO = new PostDAO();

    public List<PostRental> GetPost() {
        List<PostRental> listp = POST_DAO.getAllPosts();
        return listp;
    }

    public int createReturnId(Promotion pro) {
        int id = PROMOTION_DAO.createReturnPromotionID(pro);
        return id;
    }

    public void UpdatePostPromotionID(int post_id, int promotion_id) {
        POST_DAO.UpdatePostPromotion_id(post_id, promotion_id);
    }

    public List<Promotion> getAllPromotion() {
        List<Promotion> list = PROMOTION_DAO.getAllPromotion();
        return list;
    }

    public void DeletePostPromotionId(int id) {
        POST_DAO.RemovePostPromotion_id(id);
    }

    public void DeletePromotion(int id) {
        PROMOTION_DAO.removePromotion(id);
    }

    public Promotion GetPromotionById(int id) {
        Promotion promotion = PROMOTION_DAO.GetPromotionByID(id);
        return promotion;
    }

    public void UpdatePromotionDiscountDes(int discount, String des, int id) {
        PROMOTION_DAO.UpdatePromotionDiscountDes(discount, des, id);
    }

    public void UpdatePromotionDuration(Date start, Date end, int id) {
        PROMOTION_DAO.UpdatePromotionDuration(start, end, id);
    }

    public List<Promotion> GetPromotionByLandlordId(int id) {
        List<Promotion> list = PROMOTION_DAO.GetPromotionByLandlordId(id);
        return list;
    }

    public List<PostRental> GetPostByLandlordId(int id) {
        List<PostRental> list = POST_DAO.getPostDetailsbyLandlordId(id);
        return list;
    }

    public boolean validateDiscount(String temp_discount) {
        int discount = 0;
        try {
            discount = Integer.parseInt(temp_discount);
            if (discount < 0 || discount > 100) {
                return false;
            } else {
                return true;
            }
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    public boolean validateDate(String startDate, String endDate) {
        try {
            Date promotion_start_date = Date.valueOf(startDate);
            Date promotion_end_date = Date.valueOf(endDate);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public static void main(String[] args) {
        PromotionService p = new PromotionService();
        String temp = "ok";
        if (p.validateDiscount(temp)) {
            System.err.println("true");
        } else {
            System.out.println("false");
        }
    }
}
