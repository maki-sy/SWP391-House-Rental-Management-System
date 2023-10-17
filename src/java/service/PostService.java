/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import java.util.List;
import model.PostRental;
import model.Wishlist;

/**
 *
 * @author Sy
 */
public class PostService {

    private final static PostDAO POST_DAO = new PostDAO();

    public int getLandlordIDbyPostID(int postID) {
        PostDAO pdao = new PostDAO();
        PostRental post = null;
        int rs = -1;
        post = pdao.getPostDetailsbyID(postID);
        if (post != null) {
            rs = post.getLandlord_id();
        }
        return rs;
    }

    /**
     * Get post information by postID
     *
     * @param postID
     * @return PostRental object contains information, or null if there is no
     * post corresponding to postID
     */
    public PostRental getPostByID(int postID) {
        System.out.println("getPostByID() service " + postID);
        return POST_DAO.getPostByID(postID);
    }
    
    /**
     * Get post's name by ID
     * @param postID
     * @return post name if post exist, otherwise null
     */
    public String getPostName(int postID){
        return POST_DAO.getPostName(postID);
    }
    
    
}
