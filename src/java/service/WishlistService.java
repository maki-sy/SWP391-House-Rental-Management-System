/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.WishlistDAO;

public class WishlistService {
    public boolean checkExist(int userID, int postID){
        WishlistDAO dao= new WishlistDAO();
        return dao.checkExist(userID, postID);
    }
}
