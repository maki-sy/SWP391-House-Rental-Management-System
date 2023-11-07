<%-- 
    Document   : view-report
    Created on : Oct 29, 2023, 12:42:16 AM
    Author     : Sy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Report, DAO.ReportDAO" %>
<%@page import="java.util.List, java.sql.ResultSet"%>
<%@ page import="model.Users" %>
<%@ page import="service.ReportService"%>
<!DOCTYPE html>
<html>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="assets/css/order-style.css">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Rental House - Index</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/login-style.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
              integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
              integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style>
        .intro-title a {
            color: white; /* Thay đổi màu chữ thành đỏ (#ff0000) */
            text-decoration: none; /* Loại bỏ gạch chân dưới văn bản */
        }
    </style>


    <%
            Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
            int roleID = user.getRoleID();
            ReportDAO Pdao = new ReportDAO();
            ReportService service = new ReportService();
            if(roleID==1){
                List<Report> listOfReports = (List<Report>)request.getAttribute("reports");
    %>
    <%@include file="header.jsp" %>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                <li class="breadcrumb-item"><a href="ReportCenter?type=general">Report Center</a></li>
                                <li class="breadcrumb-item active" aria-current="page">My Report</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table">
                            <thead class="thead-primary">
                                <tr>
                                    <th>Issue</th>
                                    <th>Description</th>
                                    <th>Date reported</th>
                                    <th>Status</th>
                                    <th style="padding-right: 1px">Cancel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
            for(Report report : listOfReports){
                String report_date = report.getReport_date();
                String status = report.getStatus();
                String category = report.getCategories();
                String description = report.getDescription();
                int report_id=report.getReport_id();
                                %>
                                    <td>
                                        <div>
                                            <span><%=category%></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <span><%=description%></span>
                                        </div>
                                    </td>


                                    <td class="email">
                                        <%=report_date%>
                                    </td>
                                    <td><%=status%></td>
                                    <td>
                                        <a href="ReportCenter?type=cancel&id=<%=report_id%>">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                            </button>
                                        </a>
                                    </td>
                                </tr>
                                <%
    }
    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</html>
