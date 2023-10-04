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
import service.UserService;

/**
 * Servlet class to handle change password
 *
 * @author TungDT
 */
@WebServlet(name = "NewPassword", urlPatterns = {"/newPassword"})
public class NewPassword extends HttpServlet {

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
        String password = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        //password and confirm password does not match
        if (!password.equals(confPassword)) {
            request.setAttribute("message", "Your confirm password does not match. Please try again.");
            request.getRequestDispatcher("new-password.jsp").forward(request, response);
        } else {
            //change the password and get value for variable "verified" based on the result
            UserService uService = new UserService();
            UserDAO dao = new UserDAO();
            String token = request.getParameter("token");
            String verified = "";

            verified = uService.verifyChangePassword(password, token);
            //set attribute for verified and forward to change-password-done
            request.setAttribute("verified", verified);
            request.getRequestDispatcher("change-password-done.jsp").forward(request, response);
        }
    }
}
