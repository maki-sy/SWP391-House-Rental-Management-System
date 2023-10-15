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
import java.util.List;
import model.Transaction;
import service.TransactionService;
import model.Users;

/**
 *
 * @author DTS
 */
@WebServlet(name = "TransactionController", urlPatterns = {"/transaction"})
public class TransactionController extends HttpServlet {

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
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            if (user.getRoleID() != 2) {
                request.setAttribute("msg", "Are you lost the way? You don't have permission to access this page");
                request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("msg", "Sorry, you cannot view this page");
            request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
            return;
        }

        String service = request.getParameter("service");
        if (service == null) {
            service = "history";
        }

        switch (service) {
            case "history": // view all transaction history related to this landlord account
                TransactionService tService = new TransactionService();
                List<Transaction> transactions = tService.getTransactionsPersonID(user.getId());
                request.setAttribute("transactions", transactions);
                request.getRequestDispatcher("Landlord/view/transaction-history.jsp").forward(request, response);
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

    }
}
