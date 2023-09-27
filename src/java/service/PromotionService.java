/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import DAO.PromotionDAO;
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
    public List<PostRental> GetPostByLandlordID(int id){
        List<PostRental> listp = POST_DAO.getAllPosts();
        //chua co get post by landlord id
        return listp;
    } 
    public List<PostRental> GetPost(){
        List<PostRental> listp = POST_DAO.getAllPosts();
        return listp;
    } 
    public int createReturnId(Promotion pro){
        int id=PROMOTION_DAO.createReturnPromotionID(pro);
        return id;
    }
    public void UpdatePostPromotionID(int post_id,int promotion_id){
        POST_DAO.UpdatePostPromotion_id(post_id, promotion_id);
    }
    public List<Promotion> getAllPromotion(){
        List<Promotion> list =PROMOTION_DAO.getAllPromotion();
        return list;
    }
}
