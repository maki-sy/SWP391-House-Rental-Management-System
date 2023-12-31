/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Landlord;
import model.Tenant;
import model.Users;
import org.passay.RuleResult;
import service.UserService;
import utils.Validator;

/**
 *
 * @author DTS
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        String type = request.getParameter("type");
        if (type == null) {
            type = "login";
        }
        if (type.equals("login")) {
            Object loggedAccount = session.getAttribute("user");
            if (loggedAccount != null) {
//                System.out.println("Nguoi dung da login, chuyen huong ve trang-chu");
                response.sendRedirect("trang-chu");
                return;
            }
        }

        if (type.equals("logout")) { // user click on logout under profile picture

            session.invalidate();
            response.sendRedirect("trang-chu");
            return;
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        UserService userService = new UserService();

        String type = request.getParameter("type");
        if (type == null) {
            return;
        }

        // Handle register logic
        if (type.equals("register")) {
            String firstName = request.getParameter("first-name");
            String lastName = request.getParameter("last-name");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone-number");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re-password");
            String role = request.getParameter("role");

            // ------ DEBUG -----
            System.out.println("---- REGISTER PARAMETER RECEIVED");
            System.out.println(firstName);
            System.out.println(lastName);
            System.out.println(email);
            System.out.println(phoneNumber);
            System.out.println(password);
            System.out.println(rePassword);

            // ------ END DEBUG ----
            // if password and retype password does not match, return immediately
            if (!password.equals(rePassword)) {
                return;
            }

            // Password validate
            Validator validator = new Validator();
            RuleResult result = validator.validatePassword(password);
            if (result.isValid()) {
                System.out.println("Password is valid");
            } else {
                System.out.println("Invalid password when register");
                request.setAttribute("registerError", "Password does not valid");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            if (role.equals("Tenant")) {
                userService.registerTenant(firstName, lastName, email, phoneNumber, password);
            }
            if (role.equals("Landlord")) {
                userService.registerLandlord(firstName, lastName, email, phoneNumber, password);
            }

            response.sendRedirect("trang-chu");
            return;
        }

        // Handle login logic
        if (type.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            Users loggedUser = userService.login(email, password, Integer.valueOf(role));
            if (loggedUser == null) { // login fail
                System.out.println("LOGIN FAILED");
                // TODO: Create a more specific error message
                request.setAttribute("errorMsg", "Wrong email/password. Or email does not exist");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else { // login sucess
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedUser);
                response.sendRedirect("trang-chu");
            }
        }
    }
}
