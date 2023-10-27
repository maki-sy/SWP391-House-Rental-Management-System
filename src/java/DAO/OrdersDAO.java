package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
                String order_date = rs.getString(6);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, order_date, status);
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
                String order_date = rs.getString(6);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, order_date, status);
                Orders.add(order);
            }
        } catch (SQLException ex) {
        }
        return Orders;
    }

    public ArrayList<Orders> getOrdersByTenantId(int targetTenant) {
        ArrayList<Orders> Orders = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Orders WHERE tenant_id =" + targetTenant;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int orderId = rs.getInt(1);
                int tenantId = rs.getInt(2);
                int landlordId = rs.getInt(3);
                int postId = rs.getInt(4);
                String status = rs.getString(5);
                String order_date = rs.getString(6);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, order_date, status);
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
                String order_date = rs.getString(6);
                Orders order = new Orders(orderId, tenantId, landlordId, postId, order_date, status);
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

    public boolean addOrder(Orders order) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([tenant_id]\n"
                + "           ,[landlord_id]\n"
                + "           ,[post_id]\n"
                + "           ,[order_date]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "		(?, ?, ?, ?, ?)";

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, order.getTenantId());
            preparedStatement.setInt(2, order.getLandlordId());
            preparedStatement.setInt(3, order.getPostId());
            preparedStatement.setString(4, order.getOrder_date());
            preparedStatement.setString(5, order.getStatus());
            int rowsInserted = preparedStatement.executeUpdate();
            return (rowsInserted > 0);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void deleteOrder(int id) {
        String sql = "DELETE FROM [dbo].[Orders]\n"
                + "      WHERE order_id=" + id;
        try{
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.executeUpdate();
        }catch(SQLException ex){
            System.err.println("deleteOrder() reports: " + ex.getMessage());
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        OrdersDAO dao = new OrdersDAO();
//        ArrayList<Orders> list = dao.getAllOrders();
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println("NOTE NOTE NOTE" + list.get(i));
//        }
        Orders order = new Orders(0, 15, 6, 1, "06/06/2023", "Sent");
        dao.addOrder(order);
        //dao.deleteOrder(1);
    }
}
