/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ReviewDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import model.Review;
import model.Users;
import service.ReviewService;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "ReviewManage", urlPatterns = {"/ReviewManage"})
public class ReviewManage extends HttpServlet {

    

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
        ReviewService Rservice = new ReviewService();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String temp_star = request.getParameter("rate");
        ServletContext servletContext = getServletContext();
        String filePath = servletContext.getRealPath("\\assets\\badWord.txt");
        int star = 0;
        if (temp_star == null) {
            star = 0;
        } else {
            star = Integer.parseInt(temp_star);
        }
        int pid = Integer.parseInt(request.getParameter("id"));
        String temp_comment = request.getParameter("comment");
        if (star == 0 && "".equals(temp_comment)) {
            request.setAttribute("mess", "Vote star or Write comment");
            request.getRequestDispatcher("housedetail?id=" + pid).forward(request, response);
        } else {
            Users user = (Users) session.getAttribute("user");
            int uid = user.getId();
            Date local = Date.valueOf(LocalDate.now());
            String comment = Rservice.filter(temp_comment,filePath);
            //System.out.println(".................................");
            System.out.println(comment);
            Review re = new Review(-1, uid, pid, local, star, comment);
            Rservice.addReview(re);

            request.getRequestDispatcher("housedetail?id=" + pid).forward(request, response);
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
