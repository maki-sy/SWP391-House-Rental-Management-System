/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tuấn Anh
 */
public class UserAvatar {
    private int user_id;
    private String avatar_url;

    public UserAvatar() {
    }

    public UserAvatar(int user_id, String avatar_url) {
        this.user_id = user_id;
        this.avatar_url = avatar_url;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    @Override
    public String toString() {
        return "UserAvatar{" + "user_id=" + user_id + ", avatar_url=" + avatar_url + '}';
    }
    
    
}
