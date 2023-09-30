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
import model.Orders;
import model.Users;
import service.LandlordService;

@WebServlet(name = "landlordServicesPage", urlPatterns = {"/landlordServicesPage"})
public class LandlordServicesPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String service = request.getParameter("service");
            if (service == null || service.equals("pending-requests") || service.equals("")) {
                LandlordService handleService = new LandlordService();
                ArrayList<Orders> ordersList = handleService.getOrdersProcessing(user.getId());
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } else if (service.equals("requests-processed")) {
                LandlordService handleService = new LandlordService();
                ArrayList<Orders> ordersList = handleService.getOrdersNotProcessing(user.getId());
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } else if (service.equals("view-request-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do something
            } else if (service.equals("contact-tenant")) {
                int tenantId = Integer.parseInt(request.getParameter("tenant-id"));
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do something
            } else if (service.equals("approve-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                LandlordService handleService = new LandlordService();
                boolean isUpdated = handleService.isApproveStatusUpdated(orderId);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } else if (service.equals("reject-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                LandlordService handleService = new LandlordService();
                boolean isUpdated = handleService.isRejectStatusUpdated(orderId);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } else if (service.equals("published-posts")) {
                 request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do  something
            } else if (service.equals("remove-post")) {
                 request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do  something
            } else if (service.equals("edit-post")) {
                 request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do  something
            } else if (service.equals("add-new-post")) {
                 request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                // do  something
            }
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
