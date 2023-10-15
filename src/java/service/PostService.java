/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.PostDAO;
import java.util.ArrayList;
import java.util.List;
import model.PostRental;

/**
 *
 * @author Sy
 */
public class PostService {

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
}
