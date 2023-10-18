/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.DBContext;
import DAO.PostDAO;
import DAO.PostImageDAO;
import java.util.ArrayList;
import java.util.List;
import model.PostImage;
import model.PostRental;
import model.Wishlist;

/**
 *
 * @author Sy
 */
public class PostService extends DBContext {

    private final static PostDAO POST_DAO = new PostDAO();

    public int getLandlordIDbyPostID(int postID) {
        PostService po = new PostService();
        PostRental post = null;
        int rs = -1;
        post = po.getPostDetailsbyID(postID);
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
    
    
    public PostRental getPostDetailsbyID(int pid) {
        PostDAO dao = new DAO.PostDAO();
        PostRental post = dao.getPostDetailsbyID(pid);
        return post;
    }

    public ArrayList<PostRental> getPublishedPosts() {
        PostDAO dao = new DAO.PostDAO();
        ArrayList<PostRental> postList = dao.getPublishedPosts();
        return postList;
    }

    public String getImageThumbailsByPostID(int postID) {
        PostImageDAO dao = new PostImageDAO();
        String url = dao.getImageThumbailsByPostID(postID);
        return url;
    }

    public List<String> getPostImagesUrlByPostId(int postid) {
        PostDAO dao = new PostDAO();
        List<String> result = new ArrayList<>();
        List<PostImage> posts = dao.getMainPostImages(postid);
        for (PostImage idx : posts) {
            result.add(idx.getImg_url());
        }
        return result;
    }

    private ArrayList<String> getImageHomeThumbails(List<PostRental> list) {
        PostImageDAO dao = new PostImageDAO();
        ArrayList<String> thumbnailsURL = new ArrayList<>();
        ArrayList<PostImage> thumbnails = dao.getImageThumbails();
        for (PostRental idx : list) {
            for (PostImage thumb : thumbnails) {
                if (idx.getId() == thumb.getPost_id()) {
                    thumbnailsURL.add(thumb.getImg_url());
                    break;
                }
            }
        }
        return thumbnailsURL;
    }

    public List<PostRental> getHighestHousePrice() {
        DAO.PostDAO dao = new PostDAO();
        List<PostRental> list = dao.getHighestHousePrice();
        return list;
    }

    public List<PostRental> getLastestHouse() {
        DAO.PostDAO dao = new PostDAO();
        List<PostRental> list = dao.getLastestPost();
        return list;
    }

    public ArrayList<String> getLastestPostThum() {
        DAO.PostDAO dao = new PostDAO();
        return this.getImageHomeThumbails(dao.getLastestPost());
    }

    public static void main(String[] args) {
        PostService dao = new PostService();
        
    }

}
