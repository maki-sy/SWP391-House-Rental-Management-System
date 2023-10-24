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
import model.Token;
import org.passay.RuleResult;
import service.UserService;
import utils.Validator;

/**
 * Servlet class to handle forgot password related actions: display form to
 * enter email address to get recovery link; display reset password form; reset
 * password
 *
 * @author DTS
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/recover"})
public class ForgotPassword extends HttpServlet {

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
        UserService uService = new UserService();
        String service = request.getParameter("service");

        if (service == null) {
            service = "forgotForm";
        }
        // display form to let enter email to receive reset password link
        if (service.equals("forgotForm")) {
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
            return;
        }

        // display form to let user set the new password
        if (service.equals("resetPwd")) {

            String token = request.getParameter("token");

            boolean validToken = uService.checkValidToken(token, Token.TokenType.FORGOTPWD);
            System.out.println(validToken);
            if (validToken) {
                request.setAttribute("verified", true);
                request.setAttribute("token", token);

            } else {
                request.setAttribute("verified", false);
            }
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            return;
        }

        // if service does not match any predefined value
        request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
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
        String service = request.getParameter("service");
        if (service == null || service.equals("emailForgot")) { // handle login when user submit form contains email to send reset password link
            String email = request.getParameter("email");
            uService.sendForgotPwdEmail(email);
            response.sendRedirect("trang-chu");
            return;
        }

        if (service.equals("resetPwd")) { // handle logic when user submit reset password form
            String token = request.getParameter("token");
            String password = request.getParameter("password");
            String rePwd = request.getParameter("confPassword");

            // TODO: Add a more specific error page, e.g error-page.jsp instead of 404 error page
            boolean validToken = uService.checkValidToken(token, Token.TokenType.FORGOTPWD);
            if (!validToken) {
                request.setAttribute("errorMsg", "Token invalid, or it has been expired");
                request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                return;
            }
            if (!password.equals(rePwd)) {
                request.setAttribute("errorMsg", "Password does not match");
                request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                return;
            }

            // Password validate
            Validator validator = new Validator();
            RuleResult result = validator.validatePassword(password);
            if (result.isValid()) {
                System.out.println("Password is valid");
            } else {
                System.out.println("Reset password: Invalid password");
                request.setAttribute("msg", "Password does not valid");
                request.getRequestDispatcher("/404-error-page.jsp").forward(request, response);
                return;
            }

            // valid token and same password for both field
            uService.resetUserPassword(token, password);
            response.sendRedirect("trang-chu");
            return;
        }
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
