/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.DBContext;
import DAO.PostDAO;
import DAO.UserDAO;
import java.util.List;
import model.PostRental;
import model.Users;

/**
 *
 * @author Tuấn Anh
 */
public class AdminService extends DBContext{
    public List<PostRental> getAllPost(){
        DAO.PostDAO dao = new PostDAO();
        List<PostRental> list = dao.getAllPosts();
        return list;
    }
    public List<Users> getAllUsers(){
        DAO.UserDAO dao = new UserDAO();
        List<Users> list = dao.getAllUsers();
        return list;
    }
}
