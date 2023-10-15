/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PropertyLocation;
import model.PropertyType;

/**
 *
 * @author Tuấn Anh
 */
public class PropertyLocationDAO extends DBContext{
        public ArrayList<PropertyLocation> getAllLocation() {
        ArrayList<PropertyLocation> location = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Property_Location";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String location_name = rs.getString(2);
                PropertyLocation po = new PropertyLocation(id, location_name);
                location.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PropertyTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return location;
    }
    
}
