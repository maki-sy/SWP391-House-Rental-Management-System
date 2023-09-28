package service;

import DAO.OrdersDAO;
import java.util.ArrayList;
import model.Landlord;
import model.Orders;

public class L_ViewPendingRequest {
    public ArrayList<Orders> getOrdersByLandlordId(int id) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.getOrdersByLandlordIdWithConditions(id, "status = 'Done'");
    }
}

