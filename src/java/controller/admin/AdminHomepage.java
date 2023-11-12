/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.PostRental;
import model.Report;
import model.Users;
import service.AdminService;
import service.UserService;

/**
 *
 * @author DTS
 */
@WebServlet(name = "AdminHomepage", urlPatterns = {"/admin-dashboard"})
public class AdminHomepage extends HttpServlet {

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
        String ser = request.getParameter("service");
        AdminService service = new AdminService();
        UserService handleUser = new UserService();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            int id = user.getId();
            String urlAvt = handleUser.getAvatarByUserID(id).getAvatar_url();
            session.setAttribute("userAvatar", urlAvt);
        }

        if (ser == null) {
            request.getRequestDispatcher("Admin/view/admin-view.jsp").forward(request, response);
            return;
        }
        if (ser.equals("managePost")) {
            List<PostRental> list = service.getAllPost();
            request.setAttribute("listOfPost", list);
            request.getRequestDispatcher("Admin/view/post-list.jsp").forward(request, response);
        } else if (ser.equals("manageAccount")) {
            List<Users> list = service.getAllUsers();
            request.setAttribute("listOfUsers", list);
            request.getRequestDispatcher("Admin/view/account-list.jsp").forward(request, response);
        } else if (ser.equals("deletePost")) {  // ???
            int id = Integer.parseInt(request.getParameter("id"));
            service.updatePostStatus(id);
            request.getRequestDispatcher("admin-dashboard?service=managePost").forward(request, response);
        } else if (ser.equals("account-utils")) {
            List<Users> users = service.getAllUsers();
            request.setAttribute("listOfUsers", users);
            request.getRequestDispatcher("Admin/view/account-utilities.jsp").forward(request, response);
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
