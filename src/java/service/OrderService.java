/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.LandlordDAO;
import DAO.OrdersDAO;
import DAO.UserDAO;
import java.util.ArrayList;
import java.util.List;
import model.Landlord;
import model.Orders;
import model.PostRental;
import model.Users;

/**
 *
 * @author Sy
 */
public class OrderService {

    public void addOrder(Orders order) {
        OrdersDAO dao = new OrdersDAO();
        dao.addOrder(order);
    }

    public ArrayList<Orders> getOrdersOfTenant(int tenantID) {
        OrdersDAO dao = new OrdersDAO();
        return dao.getOrdersByTenantId(tenantID);
    }

    public boolean isSpamOrders(Orders order, int tenantID) {
        List<Orders> list = getOrdersOfTenant(tenantID);
        for (Orders ord : list) {
            if(ord.getTenantId()==order.getTenantId()&&ord.getPostId()==order.getPostId()){
                if(!"Rejected".equals(ord.getStatus())){
                    return true;
                }
            }
        }
        return false;
    }

    public Landlord getLandlordByPostID(int postID) {
        PostService pdao = new PostService();
        PostRental post = pdao.getPostDetailsbyID(postID);
        int landlordID = post.getLandlord_id();
        LandlordDAO ldao = new LandlordDAO();
        Landlord landlord = ldao.getLandlordByUserID(landlordID);
        return landlord;
    }

    public String getEmailFromLandlordByPostID(int postID) {
        PostService pdao = new PostService();
        PostRental post = pdao.getPostDetailsbyID(postID);
        int landlordID = post.getLandlord_id();
        UserDAO udao = new UserDAO();
        Users user = udao.getUserByID(landlordID);
        String landlord_email = user.getEmail();
        return landlord_email;
    }
    public void deleteOrder(int id){
        OrdersDAO dao = new OrdersDAO();
        dao.deleteOrder(id);
    }
}
