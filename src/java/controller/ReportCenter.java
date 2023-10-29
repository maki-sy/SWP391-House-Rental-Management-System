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
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Report;
import model.Users;
import service.ReportService;
import service.UserService;

/**
 *
 * @author Sy
 */
@WebServlet(name = "ReportCenter", urlPatterns = {"/ReportCenter"})
public class ReportCenter extends HttpServlet {

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

        ReportService reportservice = new ReportService();
        UserService userservice = new UserService();
        HttpSession session = request.getSession();
        Users loggedUser = (Users) session.getAttribute("user");

        if (loggedUser == null) {
            response.sendRedirect("trang-chu");
            return;
        } else {
            String reporter_email = request.getParameter("reporter_email");
            String categories = request.getParameter("categories");
            String post_link = request.getParameter("post_link");
            String reported_email = request.getParameter("reported_email");
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formatDateTime = now.format(formatter);
            String description = request.getParameter("description");
            String status = "Sent";

            Users reporter = userservice.getUserByEmail(reporter_email);
            int reporter_id = reporter.getId();
            //DEBUG
//            out.println("cate="+categories);
//            out.println("reporter="+reporter_id);
            //DEBUG
            Integer reported_id = null;
            Integer post_id = null;

            if ("User Complaint".equals(categories)) {
                Users reported = userservice.getUserByEmail(reported_email);
                if (reported != null) {
                    reported_id = reported.getId();
                }
                // out.println("reported="+reported_id);
            }

            if ("Fraudulent Post".equals(categories)) {
                String id = post_link.replaceAll(".*id=", "");
                try {
                    post_id = Integer.parseInt(id);
                } catch (NumberFormatException e) {
                    post_id = null;
                }
                // out.print("postid="+post_id);
            }

            String submit = request.getParameter("Submit");
            if (submit != null) {
//                out.println("reported="+reported_id);
//                out.println("postid="+post_id);
                Report rp = new Report(0, reporter_id, post_id, reported_id, formatDateTime, categories, description, status);
                reportservice.addReport(rp);
                response.sendRedirect("trang-chu");
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        Users loggedUser = (Users) session.getAttribute("user");
        ReportService reportservice = new ReportService();
        String type = request.getParameter("type");
        if (loggedUser == null) {
            response.sendRedirect("trang-chu");
            return;
        } else {
            if (type.equals("post")) {
                request.setAttribute("report_type", type);
                request.setAttribute("category", "Fraudulent Post");
                int postid = Integer.parseInt(request.getParameter("postid"));
                String url = "http://localhost:8080/SWP391-House-Rental-Management/housedetail?id=" + postid;
                request.setAttribute("url_ref", url);
                request.getRequestDispatcher("report-page.jsp").forward(request, response);
            }
            if (type.equals("general")) {
                request.setAttribute("report_type", type);
                request.getRequestDispatcher("report-page.jsp").forward(request, response);
            }
            //            if(type.equals("user")){
//                request.setAttribute("category", "User Complaint");
//                int userid=Integer.parseInt(request.getParameter("userid"));
//                String email=userservice.getUserByID(userid).getEmail();
//                request.setAttribute("type", "2");
//                request.setAttribute("email", email);
//                request.getRequestDispatcher("/report-page.jsp").forward(request, response);
//            }
            if (type.equals("viewreport")) {
                List<Report> reports = reportservice.getReportByUserID(loggedUser.getId());
                request.setAttribute("reports", reports);
                request.getRequestDispatcher("view-report.jsp").forward(request, response);
            }
            if (type.equals("cancel")) {
                int report_id = Integer.parseInt(request.getParameter("id"));
                reportservice.deleteReport(report_id);
                request.getRequestDispatcher("ReportCenter?type=viewreport").forward(request, response);
            }
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
