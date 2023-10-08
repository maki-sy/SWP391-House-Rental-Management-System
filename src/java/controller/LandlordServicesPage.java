package controller;

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
import model.PostRental;
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
            if (user == null || user.getRoleID() != 2) {
                response.sendRedirect("trang-chu");
                return;
            }
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
                request.getRequestDispatcher("L-add-new-post.jsp").forward(request, response);
            } else if (service.equals("submit-add-new-post")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int NumOfBedrooms = Integer.parseInt(request.getParameter("NumOfBedrooms"));
                String address = request.getParameter("address");
                // file chua xu ly
                String description = request.getParameter("description");
                int type = Integer.parseInt(request.getParameter("type"));
                int location_id = Integer.parseInt(request.getParameter("location_id"));
                String typeOfAction = request.getParameter("typeOfAction");
                boolean isInsertSuccess = handleService.isInsertSuccess(name, price, type, area, NumOfBedrooms,
                        address, description, user.getId(), location_id);
                if (isInsertSuccess && typeOfAction.equals("upload")) {
                    PostRental post = handleService.getLastestPostByUserId(user.getId());
                    int accountBalance = handleService.getAccountPointsByUserId(user.getId());
                    request.setAttribute("accountBalance", accountBalance);
                    request.setAttribute("postId", post.getId());
                    request.getRequestDispatcher("L-pay-for-post.jsp").forward(request, response);
                    // them thanh cong -> tien hanh thanh toan
                } else if(isInsertSuccess && typeOfAction.equals("draft")){
                    // them thanh cong
                    request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("L-add-new-post.jsp").forward(request, response);
                    // them that bai
                }
            } 
            // Xu ly thanh toan hoan tat
            else if (service.equals("done-add-new-post")) {
                String status = (String)request.getParameter("status");
                int postId = Integer.parseInt(request.getParameter("postId"));
                handleService.isUpdatePostStatusByPostIdSuccess(postId, status);
                handleService.isMoneyDedutedByUserId(user.getId(), status);
                handleService.isUpdatedPostDate(postId, status);
                request.getRequestDispatcher("landlord-services.jsp").forward(request, response);
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
