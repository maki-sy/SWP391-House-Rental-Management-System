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
import service.PromotionService;
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
            PromotionService pros = new PromotionService();
            SearchService handle = new SearchService();

            //lay index tu cai JSP
            String index = request.getParameter("index");
            int numOfPost = po.getNumberOfPost();
            int pageIndex;
            request.setAttribute("numOfPost", numOfPost);
            if (index == null) {
                index = "1";
            }
            pageIndex = Integer.parseInt(index);
            if (pageIndex > numOfPost || pageIndex < 1) {
                pageIndex = 1;
            }

            request.setAttribute("pageIndex", pageIndex);

            ArrayList<PostRental> post = po.getPagingList(pageIndex);

            request.setAttribute("listOfPost", post);

            ArrayList<String> thumbnailList = new ArrayList<>();
            for (int i = 0; i < post.size(); i++) {
                String url = po.getImageThumbailsByPostID(post.get(i).getId());
                thumbnailList.add(url);
            }
            request.setAttribute("thumbnailList", thumbnailList);

            ArrayList<Integer> saleList = new ArrayList<>();
            for (int i = 0; i < post.size(); i++) {
                int discount = pros.getPostPromotion(post.get(i).getPromotion());
                saleList.add(discount);
            }
            request.setAttribute("saleList", saleList);

            SearchService search = new SearchService();
            search.loadSearchData(request);
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
        List<PostRental> post = (List<PostRental>) request.getAttribute("listSearch");
        System.out.println(post + "xxyyzz");
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
