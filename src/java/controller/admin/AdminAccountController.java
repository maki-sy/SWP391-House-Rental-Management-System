/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.AdminDAO;
import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import model.Users.Status;
import service.UserService;

/**
 *
 * @author nagis
 */
@WebServlet(name = "AdminAccountController", urlPatterns = {"/admin-account"})
public class AdminAccountController extends HttpServlet {

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
        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();

        if (action.equals("add")) {
            request.getRequestDispatcher("Admin/view/project-add.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int userid = Integer.parseInt(request.getParameter("userid"));
            Users user = dao.getUserByID(userid);
            Status status[] = Users.Status.values();

            request.setAttribute("user", user);
            request.setAttribute("status", status);
            request.getRequestDispatcher("Admin/view/project-edit.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int userid = Integer.parseInt(request.getParameter("userid"));
            dao.deleteUser(userid);
            response.sendRedirect("admin-dashboard?service=manageAccount");
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
        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();
        UserService uService = new UserService();

        if (action.equals("add")) {
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            uService.addUser(email, fname, lname, phone, password);
            response.sendRedirect("admin-dashboard?service=manageAccount");
        } else if (action.equals("edit")) {
            int userid = Integer.parseInt(request.getParameter("userid"));
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String civilid = request.getParameter("civilid");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            //Update information on User table
            dao.updateUserInfo(userid, email, status);

            //Update information based on user's role
            switch (role) {
                case "Admin":
                    AdminDAO dao_a = new AdminDAO();
                    dao_a.updateAdminInfo(userid, fname, lname, phone);
                    return;
                case "Tenant":
                    TenantDAO dao_t = new TenantDAO();
                    dao_t.updateTenantInfo(userid, fname, lname, civilid, address, phone);
                    return;
                case "Landlord":
                    LandlordDAO dao_l = new LandlordDAO();
                    dao_l.updateLandlordInfo(userid, fname, lname, civilid, address, phone);
                    return;
            }
            response.sendRedirect("admin-dashboard?service=manageAccount");
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
