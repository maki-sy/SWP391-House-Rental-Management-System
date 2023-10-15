/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import service.UserService;

/**
 *
 * @author DTS
 */
@WebServlet(name = "AdminLoginController", urlPatterns = {"/admin-login"})
public class AdminLoginController extends HttpServlet {

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
        // TODO: Check HttpSession for logged in user, if user already logged in, redirect to admin dashboard
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        if (service == null) {
            service = "login";
        }

        switch (service) {
            case "login":
                request.getRequestDispatcher("admin-login.jsp").forward(request, response);
                return;
            case "logout":
                session.invalidate();
                response.sendRedirect("admin-login?service=login");
                return;
        }
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
        UserService uService = new UserService();
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Users loggedUser = uService.login(email, password);
        if (loggedUser == null || loggedUser.getRoleID() != 3) { // admin login fail
            request.setAttribute("msg", "Login failed, username or password incorrect");
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);
            return;
        } else {
            // TODO: Set session on login success
            session.setAttribute("user", loggedUser);
            response.sendRedirect("admin-dashboard");
            return;
        }
    }

}
