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
            LandlordService handleService = new LandlordService();
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String service = request.getParameter("service");

            // xem order chua xu ly
            if (service == null || service.equals("pending-requests") || service.equals("")) {
                ArrayList<Orders> ordersList = handleService.getOrdersProcessing(user.getId());
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
            } // xem order da xu ly
            else if (service.equals("requests-processed")) {
                ArrayList<Orders> ordersList = handleService.getOrdersNotProcessing(user.getId());
                request.setAttribute("ordersList", ordersList);
                request.getRequestDispatcher("L-requests-processed.jsp").forward(request, response);
            } // xem post da chon
            else if (service.equals("view-request-post")) {
                int postId = Integer.parseInt(request.getParameter("post-id"));
                request.getRequestDispatcher("/housedetail?id=" + postId).forward(request, response);
                // do something
            } // xem trang ca nhan tennant
            else if (service.equals("contact")) {
                int tenantId = Integer.parseInt(request.getParameter("tenant-id"));
                String serviceResponse = "displayProfile";
                int roleId = 1;
//                out.print(tenantId);
                request.getRequestDispatcher("/Profile?service=" + serviceResponse + "&id=" + tenantId + "&roleid=" + roleId).forward(request, response);
            } else if (service.equals("approve-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                boolean isUpdated = handleService.isApproveStatusUpdated(orderId);
                request.getRequestDispatcher("/landlordServicesPage?service=pending-requests").forward(request, response);
            } else if (service.equals("reject-request")) {
                int orderId = Integer.parseInt(request.getParameter("order-id"));
                boolean isUpdated = handleService.isRejectStatusUpdated(orderId);
                request.getRequestDispatcher("/landlordServicesPage?service=pending-requests").forward(request, response);
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
