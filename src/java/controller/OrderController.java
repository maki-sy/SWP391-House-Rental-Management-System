/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrdersDAO;
import DAO.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Orders;
import model.Users;
import service.OrderService;
import service.PostService;

/**
 *
 * @author Sy
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            OrderService Oservice = new OrderService();
            if (session.getAttribute("user") != null);
            {
                Users user = (Users) session.getAttribute("user");
                int user_id = user.getId();
                int role_id = user.getRoleID();
                String service = request.getParameter("service");
                if (service.equals("createOrder")) {
                    int postid = Integer.parseInt(request.getParameter("postid"));
                    PostService Pservice = new PostService();
                    int landlordid = Pservice.getLandlordIDbyPostID(postid);
                    Users tenant = (Users) session.getAttribute("user");
                    int tenantid = tenant.getId();
                    LocalDateTime now = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String formatDateTime = now.format(formatter);
                    String status = "processing";
                    Orders order = new Orders(0, tenantid, landlordid, postid, formatDateTime, status);
                    boolean isSpam = Oservice.isSpamOrders(order, user_id);
                    if (!isSpam) {
                        Oservice.addOrder(order);
                    }
                    response.sendRedirect("housedetail?id=" + postid);
                }
                if (service.equals("viewOrder")) {
                    if (role_id == 1) { // removable if
                        List<Orders> TenantOrders = Oservice.getOrdersOfTenant(user.getId());
                        request.setAttribute("TenantOrders", TenantOrders);
                        //response.sendRedirect("trang-chu");
                        request.getRequestDispatcher("view-order.jsp").forward(request, response);
                    }
                }
                if(service.equals("viewLandlord")){
                    int landlord_id = Integer.parseInt(request.getParameter("id"));
                    String landlord_email=request.getParameter("email");
                    request.setAttribute("landlord_id", landlord_id);
                    request.setAttribute("landlord_email", landlord_email);
                    request.getRequestDispatcher("T_ViewLandlordInfo.jsp").forward(request, response);
                }
                if(service.equals("cancelOrder")){
                    int order_id=Integer.parseInt(request.getParameter("id"));
                    Oservice.deleteOrder(order_id);
                    request.getRequestDispatcher("order?service=viewOrder").forward(request, response);
                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
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
