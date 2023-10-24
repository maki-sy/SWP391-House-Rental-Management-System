<%-- 
    Document   : T-view-order
    Created on : Oct 13, 2023, 10:23:37 AM
    Author     : Sy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Orders, DAO.OrdersDAO" %>
<%@page import="java.util.List, java.sql.ResultSet"%>
<%@ page import="model.Users" %>
<%@ page import="service.OrderService" %>
<%@page import="model.PostRental, model.Landlord, model.PostImage, DAO.PostDAO, DAO.LandlordDAO"%>
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
    <style>
        .intro-title a {
            color: white; /* Thay đổi màu chữ thành đỏ (#ff0000) */
            text-decoration: none; /* Loại bỏ gạch chân dưới văn bản */
        }
    </style>


    <%
            Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
            int roleID = user.getRoleID();
            PostDAO Pdao = new PostDAO();
            LandlordDAO LDao = new LandlordDAO();
            OrderService service = new OrderService();
            if(roleID==1){
                List<Orders> listOfOrders = (List<Orders>)request.getAttribute("TenantOrders");
    %>
    <a class="btn btn-primary" href="Profile?service=displayProfile">Back</a>
    <%@include file="header.jsp" %>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                <li class="breadcrumb-item"><a href="Profile?service=displayProfile">User Profile</a></li>
                                <li class="breadcrumb-item active" aria-current="page">My Order</li>
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

                                    <th>Image</th>
                                    <th>Property</th>
                                    <th>Landlord</th>
                                    <th>Date ordered</th>
                                    <th>Status</th>
                                    <th style="padding-right: 1px">Cancel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
            for(Orders order : listOfOrders){
                int tenantID = order.getTenantId();
                int landlordID = order.getLandlordId();
                int postID = order.getPostId();
                String order_date = order.getOrder_date();
                String status = order.getStatus();
                PostRental post = Pdao.getPostDetailsbyID(postID);
                String postName = post.getName();
                Landlord landlord = LDao.getLandlordByUserID(landlordID);
                String landlordName = landlord.getFirstName()+ " "+landlord.getLastName();
                String landlordEmail = service.getEmailFromLandlordByPostID(postID);
                                %>
                                <tr class="alert" role="alert">

                                    <td>
                                        <div class="img" style="background-image: url(images/product-1.png);"></div>
                                    </td>
                                    <td>
                                        <div class="email">
                                            <span><%=postName%></span>
                                            <a href="housedetail?id=<%=postID%>"><span style="color: blue; text-decoration: underline;">View details</span></a>
                                        </div>
                                    </td>
                            <style>
                                .text-button {
                                    background: none;
                                    border: none;
                                    padding: 0;
                                    font: inherit;
                                    cursor: pointer;
                                    outline: inherit;
                                }
                            </style>
                            <td>
                                <div class="email">
                                    <span><%=landlordName%></span>
                                    <%if(status.equals("approved")){%>
                                    <form action="order" method="post">
                                        <input type="hidden" name="id" value="<%=landlordID%>">
                                        <input type="hidden" name="email" value="<%=landlordEmail%>">
                                        <input type="hidden" name="service" value="viewLandlord">
                                        <span ><input style="color: blue; text-decoration: underline" type="submit" class="text-button" name="submit" value="View landlord details"></span>
                                    </form>

                                    <%}else{%>
                                    <span>&nbsp;</span>
                                    <%}%>
                                </div>
                            </td>

                            <td class="email">
                                <%=order_date%>
                            </td>
                            <td><%=status%></td>
                            <td>
                                <a href="order?service=cancelOrder">
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
