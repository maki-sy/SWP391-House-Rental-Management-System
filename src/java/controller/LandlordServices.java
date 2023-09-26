package controller;

import DAO.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Landlord;
import model.Orders;

@WebServlet(name = "landlordServices", urlPatterns = {"/landlord-quan-ly-dich-vu"})
public class LandlordServices extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String service = (String) session.getAttribute("service");
            if (service == null || service.equals("view-orders")) {
                response.sendRedirect("/LandlordViewOrders");
            } else if (service.equals("view-post")) {
                // do something
            } else if (service.equals("accept-request")) {
                // do something
            } else if (service.equals("deny-request")) {
                // do something
            } else if (service.equals("contact-tenant")) {
                // do  something
            }
            response.sendRedirect("/LandlordViewOrders");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
