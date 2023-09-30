package service;

import DAO.OrdersDAO;
import java.util.ArrayList;
import model.Orders;

public class LandlordService {
    public boolean isApproveStatusUpdated(int OrderId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.updateStatus("approved", OrderId);
    }
    
    public boolean isRejectStatusUpdated(int OrderId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.updateStatus("rejected", OrderId);
    }
    
    public ArrayList<Orders> getOrdersProcessing(int landlordId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        ArrayList<Orders> result = ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status = 'processing'");
        return result;
    }
    
    public ArrayList<Orders> getOrdersNotProcessing(int landlordId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status != 'processing'");
    }
    
}
