package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Orders;

public class OrdersDAO extends DBContext {

    public ArrayList<Orders> getAllOrders() {
        ArrayList<Orders> Orders = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Orders;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int orderId = rs.getInt(1);
                int tenantId = rs.getInt(2);
                int landlordId = rs.getInt(3);
                int postId = rs.getInt(4);
                String status = rs.getString(5);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, status);
                Orders.add(order);
            }
        } catch (SQLException ex) {
        }
        return Orders;
    }

    public ArrayList<Orders> getOrdersByLandlordId(int targetLandlord) {
        ArrayList<Orders> Orders = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Orders WHERE landlord_id =" + targetLandlord;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int orderId = rs.getInt(1);
                int tenantId = rs.getInt(2);
                int landlordId = rs.getInt(3);
                int postId = rs.getInt(4);
                String status = rs.getString(5);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, status);
                Orders.add(order);
            }
        } catch (SQLException ex) {
        }
        return Orders;
    }

    public ArrayList<Orders> getOrdersByLandlordIdWithConditions(int targetLandlordId, String conditions) {
        ArrayList<Orders> Orders = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Orders WHERE landlord_id =" + targetLandlordId + " AND " + conditions;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int orderId = rs.getInt(1);
                int tenantId = rs.getInt(2);
                int landlordId = rs.getInt(3);
                int postId = rs.getInt(4);
                String status = rs.getString(5);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, status);
                Orders.add(order);
            }
        } catch (SQLException ex) {
        }
        return Orders;
    }

    public boolean updateStatus(String statusValue, int OrderId) {
        int rowsUpdated = 0;
        try {
            String sqlCommand = "UPDATE Orders\n"
                    + "SET status = ?\n"
                    + "WHERE order_id = ?;";
            PreparedStatement preparedStatement = connect.prepareStatement(sqlCommand);
            preparedStatement.setString(1, statusValue);
            preparedStatement.setInt(2, OrderId);
            rowsUpdated = preparedStatement.executeUpdate();
        } catch (SQLException ex) {
        }
        return rowsUpdated != 0;
    }

    public static void main(String[] args) {
        OrdersDAO dao = new OrdersDAO();
        ArrayList<Orders> list = dao.getAllOrders();
        for (int i = 0; i < list.size(); i++) {
            System.out.println("NOTE NOTE NOTE" + list.get(i));
        }
    }
}