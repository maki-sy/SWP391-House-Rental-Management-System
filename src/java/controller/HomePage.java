/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PostRental;
import model.PropertyLocation;
import model.PropertyType;
import model.Users;
import service.PostService;
import service.PromotionService;
import service.SearchService;
import service.UserService;

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
        UserService handleUser = new UserService();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        PromotionService pros = new PromotionService();
        if (user != null) {
            int id = user.getId();
            String urlAvt = handleUser.getAvatarByUserID(id).getAvatar_url();
            session.setAttribute("userAvatar", urlAvt);
        }

        PostService post = new PostService();
        List<PostRental> last = post.getLastestHouse();
        ArrayList<Integer> saleListLastest = new ArrayList<>();
        for (int i = 0; i < last.size(); i++) {
            int proID = pros.getPostPromotion(last.get(i).getPromotion());
            saleListLastest.add(proID);
        }
        request.setAttribute("saleListLastest", saleListLastest);
        

        List<PostRental> highest = post.getHighestHousePrice();
        ArrayList<Integer> saleListHighest = new ArrayList<>();
        for (int i = 0; i < highest.size(); i++) {
            int proID = pros.getPostPromotion(highest.get(i).getPromotion());
            saleListHighest.add(proID);
        }
        request.setAttribute("saleListHighest", saleListHighest);
        List<String> thumbnailsLast = new ArrayList<>();
        List<String> thumbnailsHighest = new ArrayList<>();
        for (PostRental pr : last) {
            int postId = pr.getId();
            String url = post.getImageThumbailsByPostID(postId);
            thumbnailsLast.add(url);
        }
        for (PostRental pr : highest) {
            int postId = pr.getId();
            String url = post.getImageThumbailsByPostID(postId);
            thumbnailsHighest.add(url);
        }

        SearchService search = new SearchService();
        search.loadSearchData(request);

        request.setAttribute("lastestPost", last);
        request.setAttribute("highestPost", highest);
        request.setAttribute("thumbnailsLast", thumbnailsLast);
        request.setAttribute("thumbnailsHighest", thumbnailsHighest);
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
