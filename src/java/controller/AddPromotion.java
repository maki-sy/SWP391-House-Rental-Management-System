/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostDAO;
import DAO.PromotionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import model.PostRental;
import model.Promotion;
import model.Users;
import service.PromotionService;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AddPromotion", urlPatterns = {"/AddPromotion"})
public class AddPromotion extends HttpServlet {
    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
    PromotionService pservice=new PromotionService();

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
        String service = request.getParameter("service");
         HttpSession session = request.getSession();
         Users user = (Users) session.getAttribute("user");
        List<PostRental> listp = pservice.GetPostByLandlordId(user.getId());
        request.setAttribute("listp", listp);
        if (service == null) {
            service = "form";
        }
        if (service.equals("form")) {
            request.getRequestDispatcher("AddPromotionForm.jsp").forward(request, response);
        } else if (service.equals("add")) {
            String[] p = request.getParameterValues("p");
            if (p == null) {//user doesnt choose
                request.setAttribute("mess", "Chose your property");
                request.getRequestDispatcher("AddPromotionForm.jsp").forward(request, response);
            } else {
                //get promotion's infor
                String temp_discount = request.getParameter("discount");
                String des = request.getParameter("desciptions");
                Date promotion_start_date = Date.valueOf(request.getParameter("start_date"));
                Date promotion_end_date = Date.valueOf(request.getParameter("end_date"));
                Date local = Date.valueOf(LocalDate.now());
                int discount = 0;
                try {//user enter text instead of number
                    discount = Integer.parseInt(temp_discount);
                } catch (NumberFormatException e) {
                    request.setAttribute("mess", "Discount must be an integer");
                request.getRequestDispatcher("AddPromotionForm.jsp").forward(request, response);                 
                }
                if (promotion_start_date.after(promotion_end_date)) {    //start date occurs after end date
                    request.setAttribute("mess", "Start date must occurs before end date");
                    request.getRequestDispatcher("AddPromotionForm.jsp").forward(request, response);
                } else if (local.after(promotion_end_date)) {    //end date occurs before local date
                    request.setAttribute("mess", "Local date must occurs before end date");
                    request.getRequestDispatcher("AddPromotionForm.jsp").forward(request, response);
                } else {
                    Promotion promotion = new Promotion(-1, discount, des, promotion_start_date, promotion_end_date);
                    int creId=pservice.createReturnId(promotion);
                    //set property promotion_id
                    for (String pro : p) {
                        int a = Integer.parseInt(pro);
                        pservice.UpdatePostPromotionID(a, creId);
                    }
                    response.sendRedirect("PromotionManage");
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
