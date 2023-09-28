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
import model.Users;
import service.L_ViewPendingRequest;

@WebServlet(name = "landlordServices", urlPatterns = {"/landlordServices"})
public class LandlordServices extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("users");
            String service = (String) request.getAttribute("service");
            if (service == null || service.equals("view-pending-request")) {
                L_ViewPendingRequest handleService = new L_ViewPendingRequest();
                ArrayList<Orders> ordersList = handleService.getOrdersByLandlordId(user.getId());
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } else if (service.equals("view-request-processed")) {
                // do something
            } else if (service.equals("accept-request")) {
                // do something
            } else if (service.equals("deny-request")) {
                // do something
            } else if (service.equals("contact-tenant")) {
                // do  something
            } else if (service.equals("view-request-post")) {
                // do  something
            } else if (service.equals("view-all-post")) {
                // do  something
            } else if (service.equals("remove-post")) {
                // do  something
            } else if (service.equals("edit-post")) {
                // do  something
            } else if (service.equals("add-new-post")) {
                // do  something
            }
            response.sendRedirect("/index.jsp");
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
