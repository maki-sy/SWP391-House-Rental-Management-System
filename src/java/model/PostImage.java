/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tuấn Anh
 */
public class PostImage {
    private int id;
    private int post_id;
    private String img_url;
    private String img_type;

    public PostImage(int id, int post_id, String img_url, String img_type) {
        this.id = id;
        this.post_id = post_id;
        this.img_url = img_url;
        this.img_type = img_type;
    }

    
    public PostImage(int post_id, String img_url, String img_type) {
        this.post_id = post_id;
        this.img_url = img_url;
        this.img_type = img_type;
    }


    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getImg_type() {
        return img_type;
    }

    public void setImg_type(String img_type) {
        this.img_type = img_type;
    }
    

    @Override
    public String toString() {
        return "PostImage{" + "img_url=" + img_url + '}';
    }
    
    
}
