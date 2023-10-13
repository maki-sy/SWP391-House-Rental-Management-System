/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PostRental;
import model.PropertyLocation;
import model.PropertyType;
import service.SearchService;

/**
 *
 * @author DTS
 */
@WebServlet(name = "HomePage", urlPatterns = {"/trang-chu"})
public class HomePage extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        DAO.PostDAO dao = new PostDAO();
        List<PostRental> list = dao.getLastestPost();
        List<PostRental> highest = dao.getHighestHousePrice();
        SearchService handle = new SearchService();
        ArrayList<PropertyType> type = handle.getAllType();

        ResultSet bedrooms = dao.getData("select distinct NumOfBedrooms from Post;");
        ResultSet priceFrom = dao.getData("select distinct price from Post;");
        ResultSet priceTo = dao.getData("select distinct price from Post;");
        ResultSet areaFrom = dao.getData("select distinct area from Post;");
        ResultSet areaTo = dao.getData("select distinct area from Post;");
        ResultSet address = dao.getData("select distinct address from Post;");
        ArrayList<PropertyLocation> location = handle.getAllLocation();

        request.setAttribute("type", type);
        request.setAttribute("bedroom", bedrooms);
        request.setAttribute("priceFrom", priceFrom);
        request.setAttribute("priceTo", priceTo);
        request.setAttribute("areaFrom", areaFrom);
        request.setAttribute("areaTo", areaTo);
        request.setAttribute("address", address);
        request.setAttribute("location", location);

        request.setAttribute("lastestPost", list);
        request.setAttribute("highestPost", highest);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
