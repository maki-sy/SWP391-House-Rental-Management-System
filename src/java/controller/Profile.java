/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.LandlordDAO;
import DAO.TenantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Landlord;
import model.Tenant;
import model.Users;

/**
 *
 * @author Sy
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            TenantDAO daotn = new TenantDAO();
            LandlordDAO daoll = new LandlordDAO();
            String service = request.getParameter("service");
            if (service.equals("displayProfile")) {
                String id = request.getParameter("id");
                int role_id = Integer.parseInt(request.getParameter("roleid"));
                switch (role_id) {
                    case 1: {
                        Tenant tn = daotn.getTenantByUserID(Integer.parseInt(id));
                        request.setAttribute("tn", tn);
                        request.setAttribute("role_name", "Tenant");
                        break;
                    }
                    case 2: {
                        Landlord ll = daoll.getLandlordByUserID(Integer.parseInt(id));
                        request.setAttribute("ll", ll);
                        request.setAttribute("role_name", "Landlord");
                        break;
                    }
                    case 3: {
                        request.setAttribute("role_name", "Admin");
                        break;
                    }
                    default:
                        break;
                }
                request.getRequestDispatcher("/profile-personal.jsp").forward(request, response);
            }
            if (service.equals("updateProfile")) {
                String submit = request.getParameter("submit");

                if (submit == null) {
                    int id = Integer.parseInt(request.getParameter("id"));

                    int role_id = Integer.parseInt(request.getParameter("roleid"));
                    switch (role_id) {
                        case 1:
                            request.setAttribute("role_name", "Tenant");
                            Tenant tn = daotn.getTenantByUserID(id);
                            request.setAttribute("tn", tn);
                            break;
                        case 2:
                            request.setAttribute("role_name", "Landlord");
                            Landlord ll = daoll.getLandlordByUserID(id);
                            request.setAttribute("ll", ll);
                            break;
                        case 3:
                            request.setAttribute("role_name", "Admin");
                            break;
                        default:
                            break;
                    }
                    request.getRequestDispatcher("/UpdateProfile.jsp").forward(request, response);
                } else {// da submit --> update
                    String tnid = request.getParameter("tnid");
                    String llid = request.getParameter("llid");
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    if (tnid != null) {
                        System.out.println(daotn.updateProfileByID(Integer.parseInt(tnid), fname, lname, address, phone));
                    }
                    if (llid != null) {
                        System.out.println(daoll.updateProfileByID(Integer.parseInt(llid), fname, lname, address, phone));
                    }
                    response.sendRedirect("trang-chu");
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
