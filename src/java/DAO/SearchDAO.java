/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostRental;

/**
 *
 * @author Tuấn Anh
 */
public class SearchDAO extends DBContext {

    public List<PostRental> searchPostByKeyword(String key) {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Post WHERE name LIKE '%" + key + "%'";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public List<PostRental> searchPostByAttributes(String keyword, String type, String bedroom, String priceFrom, String priceTo, String areaFrom, String areaTo, String location) {
        List<PostRental> postList = new ArrayList<>();
        String sqlCommand = "SELECT a.*"
                + "FROM Post a "
                + "JOIN Property_Location b ON a.location_id = b.id "
                + "WHERE 1=1 and status != 'draft'";

        if (!keyword.isEmpty()) {
            sqlCommand += " AND a.name LIKE ?";
        }
        if (!"All Type".equals(type)) {
            sqlCommand += " AND a.type = ?";
        }
        if (!"Any".equals(bedroom)) {
            sqlCommand += " AND a.NumOfBedrooms = ?";
        }
        if (!"Unlimite".equals(priceFrom)) {
            sqlCommand += " AND a.price >= ?";
        }
        if (!"Unlimite".equals(priceTo)) {
            sqlCommand += " AND a.price <= ?";
        }

        if (!"Any".equals(areaFrom)) {
            sqlCommand += " AND a.area >= ?";
        }
        if (!"Any".equals(areaTo)) {
            sqlCommand += " AND a.area <= ?";
        }
        if (!"Any".equals(location)) {
            sqlCommand += " AND b.id = ?";
        }

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sqlCommand)) {
            int parameterIndex = 1;
            if (!keyword.isEmpty()) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (!"All Type".equals(type)) {
                preparedStatement.setString(parameterIndex++, type);
            }
            if (!"Any".equals(bedroom)) {
                preparedStatement.setString(parameterIndex++, bedroom);
            }
            if (!"Unlimite".equals(priceFrom) && isInteger(priceFrom)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(priceFrom));
            }
            if (!"Unlimite".equals(priceTo) && isInteger(priceTo)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(priceTo));
            }
            if (!"Any".equals(areaFrom) && isInteger(areaFrom)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(areaFrom));
            }
            if (!"Any".equals(areaTo) && isInteger(areaTo)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(areaTo));
            }

            if (!"Any".equals(location)) {
                preparedStatement.setString(parameterIndex++, location);
            }
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int typee = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, typee, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                postList.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return postList;
    }

    private boolean isInteger(String s) {
        try {
            Integer.parseInt(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
