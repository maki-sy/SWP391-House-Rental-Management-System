/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import model.Users.Role;
import service.UserService;

/**
 * Servlet class to handle change password
 *
 * @author TungDT
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changePassword"})
public class ChangePassword extends HttpServlet {

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
        String token = request.getParameter("token");
        request.setAttribute("token", token);
        
        request.getRequestDispatcher("new-password.jsp").forward(request, response);
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
//        String email = request.getParameter("email");
//        
//        HttpSession session = request.getSession();
//        UserService uService = new UserService();
//        UserDAO dao = new UserDAO();
//        
//        Users user = (Users) session.getAttribute("user");
//        int user_id = user.getId();
//        
//        int check = dao.checkEmail(email);
//        if (check > 0){
//            uService.changePassword(user_id, email);
//        }

        String email = request.getParameter("email");

        HttpSession session = request.getSession();
        UserService uService = new UserService();
        UserDAO dao = new UserDAO();

        Users user = (Users) session.getAttribute("user");
        int user_id = user.getId();

        boolean check = dao.checkEmail(email);
        if (check == true) {
            uService.changePassword(user_id, email);
        } else {
            // uService.changePassword(user_id, email);
        }

    }
}
