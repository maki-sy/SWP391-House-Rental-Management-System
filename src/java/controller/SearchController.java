/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostDAO;
import DAO.PostImageDAO;
import DAO.SearchDAO;
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
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

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
            DAO.SearchDAO dao = new SearchDAO();
            PromotionService pros = new PromotionService();
            PostService po = new PostService();
            SearchService search = new SearchService();
            search.loadSearchData(request);

            String searchh = request.getParameter("txt").trim();
            String roomType = request.getParameter("type");
            String bedroom = request.getParameter("bed");
            String priceT = request.getParameter("priceTo");
            String areaT = request.getParameter("areaTo");
            String locationn = request.getParameter("location");

            String index = request.getParameter("index");
            int pageIndex = Integer.parseInt(index);
            request.setAttribute("pIndex", pageIndex);
            int numOfPost = po.getNumberOfPostSearch(searchh, roomType, bedroom, priceT, areaT, locationn);
            request.setAttribute("nPost", numOfPost);

            List<PostRental> list = dao.searchPostByAttributes(searchh, roomType, bedroom, priceT, areaT, locationn, pageIndex);
            request.setAttribute("listSearch", list);
            ArrayList<String> thumbnailList = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                String url = po.getImageThumbailsByPostID(list.get(i).getId());
                thumbnailList.add(url);
            }
            request.setAttribute("thumbnailList", thumbnailList);
            ArrayList<Integer> saleList = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                int discount = pros.getPostPromotion(list.get(i).getPromotion());
                saleList.add(discount);
            }
            request.setAttribute("saleList", saleList);
            request.setAttribute("thumbnailList", thumbnailList);

            request.getRequestDispatcher("PostSearch.jsp").forward(request, response);

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
