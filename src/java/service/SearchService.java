package service;

import DAO.DBContext;
import DAO.OrdersDAO;
import DAO.PropertyLocationDAO;
import DAO.PropertyTypeDAO;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Orders;
import model.PropertyLocation;
import model.PropertyType;

public class SearchService extends DBContext {

    public ArrayList<PropertyType> getAllType() {
        PropertyTypeDAO dao = new PropertyTypeDAO();
        ArrayList<PropertyType> result = dao.getAllType();
        return result;
    }

    public ArrayList<PropertyLocation> getAllLocation() {
        PropertyLocationDAO dao = new PropertyLocationDAO();
        ArrayList<PropertyLocation> location = dao.getAllLocation();
        return location;
    }

    public void loadSearchData(HttpServletRequest request) {
        PostService post = new PostService();
        SearchService handle = new SearchService();
        ArrayList<PropertyType> type = handle.getAllType();
        ResultSet bedrooms = post.getData("select distinct NumOfBedrooms from Post;");
        ResultSet priceFrom = post.getData("select distinct price from Post;");
        ResultSet priceTo = post.getData("select distinct price from Post;");
        ResultSet areaFrom = post.getData("select distinct area from Post;");
        ResultSet areaTo = post.getData("select distinct area from Post;");
        ResultSet address = post.getData("select distinct address from Post;");
        ArrayList<PropertyLocation> location = handle.getAllLocation();

        request.setAttribute("type", type);
        request.setAttribute("bedroom", bedrooms);
        request.setAttribute("priceFrom", priceFrom);
        request.setAttribute("priceTo", priceTo);
        request.setAttribute("areaFrom", areaFrom);
        request.setAttribute("areaTo", areaTo);
        request.setAttribute("address", address);
        request.setAttribute("location", location);
    }

    


}
