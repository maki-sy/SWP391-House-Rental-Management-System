
package service;

import DAO.OrdersDAO;
import DAO.PropertyLocationDAO;
import DAO.PropertyTypeDAO;
import java.util.ArrayList;
import model.Orders;
import model.PropertyLocation;
import model.PropertyType;


public class SearchService {
    
    public ArrayList<PropertyType> getAllType() {
        PropertyTypeDAO dao = new PropertyTypeDAO();
        ArrayList<PropertyType> result = dao.getAllType();
        return result;
    }
    
    public ArrayList<PropertyLocation> getAllLocation(){
        PropertyLocationDAO dao = new PropertyLocationDAO();
        ArrayList<PropertyLocation> location = dao.getAllLocation();
        return location;
    }
            
      
      
}
