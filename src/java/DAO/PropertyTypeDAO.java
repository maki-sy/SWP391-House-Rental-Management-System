/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostRental;
import model.PropertyType;

/**
 *
 * @author Tuấn Anh
 */
public class PropertyTypeDAO extends DBContext {

    public ArrayList<PropertyType> getAllType() {
        ArrayList<PropertyType> type = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Property_Type";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int type_id = rs.getInt(1);
                String type_name = rs.getString(2);
                PropertyType po = new PropertyType(type_id, type_name);
                type.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PropertyTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return type;
    }
}
