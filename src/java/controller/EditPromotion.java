/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import model.Promotion;
import service.PromotionService;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "EditPromotion", urlPatterns = {"/EditPromotion"})
public class EditPromotion extends HttpServlet {

    PromotionService pservice = new PromotionService();

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
        String now = request.getParameter("now");
        int promotion_id = Integer.parseInt(request.getParameter("id"));
        Promotion promo = pservice.GetPromotionById(promotion_id);
        request.setAttribute("now", now);
        request.setAttribute("promo", promo);
        if (service == null) {
            response.sendRedirect("trang-chu");
        }
        if (service.equals("form")) {
            request.getRequestDispatcher("EditPromotion.jsp").forward(request, response);
        } else if (service.equals("edit")) {
            String des = request.getParameter("desciptions");
            String temp_discount = request.getParameter("discount");
            int discount = 0;
            if (pservice.validateDiscount(temp_discount)) {//valiadte ok
                discount = Integer.parseInt(temp_discount);
                pservice.UpdatePromotionDiscountDes(discount, des, promotion_id);
                request.getRequestDispatcher("PromotionManage").forward(request, response);
            } else {
                request.setAttribute("mess", "Wrong discount");
                request.getRequestDispatcher("EditPromotion.jsp").forward(request, response);

            }

        } else if (service.equals("duration")) {
            Date promotion_start_date = null;
            Date promotion_end_date = null;
            Date local = Date.valueOf(LocalDate.now());
            try {
                promotion_start_date = Date.valueOf(request.getParameter("start_date"));
                promotion_end_date = Date.valueOf(request.getParameter("end_date"));
            } catch (Exception ex) {
                request.setAttribute("mess", "Wrong date format");
                    request.getRequestDispatcher("EditPromotion.jsp").forward(request, response);
            }
            if (promotion_start_date.after(promotion_end_date)) {    //start date occurs after end date
                request.setAttribute("mess", "Start date must occurs before end date");
                request.getRequestDispatcher("EditPromotion.jsp").forward(request, response);
            } else if (local.after(promotion_end_date)) {    //end date occurs before local date
                request.setAttribute("mess", "Local date must occurs before end date");
                request.getRequestDispatcher("EditPromotion.jsp").forward(request, response);
            } else {
                pservice.UpdatePromotionDuration(promotion_start_date, promotion_end_date, promotion_id);
                response.sendRedirect("PromotionManage");
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
