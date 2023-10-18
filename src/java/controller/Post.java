/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostImageDAO;
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
import model.PostImage;
import model.PostRental;
import model.PropertyLocation;
import model.PropertyType;
import service.PostService;
import service.SearchService;

/**
 *
 * @author Tuấn Anh
 */
@WebServlet(name = "Post", urlPatterns = {"/Post"})
public class Post extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            PostService po = new PostService();
            SearchService handle = new SearchService();
            List<PostRental> post = po.getPublishedPosts();
            request.setAttribute("listOfPost", post);
            ArrayList<String> thumbnailList = new ArrayList<>();
            for (int i = 0; i < post.size(); i++) {
                String url = po.getImageThumbailsByPostID(post.get(i).getId());
                thumbnailList.add(url);
            }

            ArrayList<PropertyType> type = handle.getAllType();

            ResultSet bedrooms = po.getData("select distinct NumOfBedrooms from Post;");
            ResultSet priceFrom = po.getData("select distinct price from Post;");
            ResultSet priceTo = po.getData("select distinct price from Post;");
            ResultSet areaFrom = po.getData("select distinct area from Post;");
            ResultSet areaTo = po.getData("select distinct area from Post;");
            ResultSet address = po.getData("select distinct address from Post;");
            ArrayList<PropertyLocation> location = handle.getAllLocation();

            request.setAttribute("thumbnailList", thumbnailList);

            request.setAttribute("type", type);
            request.setAttribute("bedroom", bedrooms);
            request.setAttribute("priceFrom", priceFrom);
            request.setAttribute("priceTo", priceTo);
            request.setAttribute("areaFrom", areaFrom);
            request.setAttribute("areaTo", areaTo);
            request.setAttribute("address", address);
            request.setAttribute("location", location);
//            request.setAttribute("PostImage", postimage);
            request.getRequestDispatcher("AllPost.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
