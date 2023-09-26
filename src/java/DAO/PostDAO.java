/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostImage;
import model.PostRental;

/**
 *
 * @author Tuấn Anh
 */
public class PostDAO extends DBContext {

    public List<PostRental> getAllPosts() {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM POST;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                String status = rs.getString(10);
                int promotion_id = rs.getInt(11);
                Date start = rs.getDate(12);
                Date end = rs.getDate(13);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public List<PostImage> getPostImages(int postid) {
        List<PostImage> post = new ArrayList<>();
        String sqlCommand = "select b.post_id, b.img_url, b.img_type from post a join Post_Image b on a.id = b.post_id where a.id = " + postid;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int pid = rs.getInt(1);
                String image = rs.getString(2);
                String img_type = rs.getString(3);
                PostImage po = new PostImage(postid, image, img_type);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return post;
    }
    public List<PostRental> getPostDetailsbyID(int pid){
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM POST where id = " + pid;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                String status = rs.getString(10);
                int promotion_id = rs.getInt(11);
                Date start = rs.getDate(12);
                Date end = rs.getDate(13);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }
    public List<PostRental> searchPostByKeyword(String key){
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Post WHERE name LIKE '%" + key + "%'";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                String status = rs.getString(10);
                int promotion_id = rs.getInt(11);
                Date start = rs.getDate(12);
                Date end = rs.getDate(13);
                
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, status, promotion_id, start, end);
                post.add(po);
                System.out.println("abcabc");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }
    

}
