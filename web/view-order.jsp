<%-- 
    Document   : T-view-order
    Created on : Oct 13, 2023, 10:23:37 AM
    Author     : Sy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Orders, DAO.OrdersDAO" %>
<%@page import="java.util.ArrayList, java.sql.ResultSet"%>
<%@ page import="model.Users" %>
<%@ page import="service.OrderService"%>
<%@ page import="service.PostService"%>
<%@page import="model.PostRental, model.Landlord, model.PostImage, DAO.PostDAO"%>
<!DOCTYPE html>
<html>
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
    <link href="assets/css/customer-card.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
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
            OrderService service = new OrderService();
                ArrayList<Orders> listOfOrders = (ArrayList<Orders>)request.getAttribute("TenantOrders");
    %>
    <%@include file="header.jsp" %>
    <section class="ftco-section" style="margin-top:140px">
        <div class="container">
            <div class="row justify-content-center">    
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">My Order</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card col-lg-12" style="margin-top:40px">

                        <table class="table table-hover text-center">
                            <thead>
                                <tr>

                                    <th class="col-lg-2" scope="col">Image</th>
                                    <th class="col-lg-2" scope="col">Property</th>
                                    <th class="col-lg-2" scope="col">Landlord</th>
                                    <th class="col-lg-2" scope="col">Date ordered</th>
                                    <th class="col-lg-2" scope="col">Status</th>
                                    <th class="col-lg-1" scope="col"style="padding-right: 1px">Cancel</th>
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
                Landlord landlord = service.getLandlordByID(landlordID);
                String landlordName = service.getLandlordFullName(landlordID);
                String landlordEmail = service.getEmailFromLandlordByPostID(postID);
                int order_id=order.getOrderId();
                PostService po = new PostService();
                String thumbnail = po.getImageThumbailsByPostID(postID);
                                %>
                                <tr>

                                    <td>
                                        <div>
                                            <img src="<%=thumbnail%>" alt="" class="img-a img-fluid img-thumbnail" style="overflow-clip-margin: content-box; overflow: clip;">
                                        </div>
                                    </td>
                                    <td style="padding-top:80px">
                                        <div>
                                            <span><%=postName%></span>
                                            <div>
                                                <a href="housedetail?id=<%=postID%>">
                                                    <button class="w-25 btn btn-sm btn-primary">
                                                        <ion-icon name="eye-outline"></ion-icon>
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding-top:80px;padding-bottom: 80px;">
                                        <div>
                                            <span><%=landlordName%></span>
                                            <%if(status.equals("approved")){%>
                                            <form action="order" method="post">
                                                <input type="hidden" name="id" value="<%=landlordID%>">
                                                <input type="hidden" name="email" value="<%=landlordEmail%>">
                                                <input type="hidden" name="service" value="viewLandlord">
                                                <button type="submit" class="w-25 btn btn-sm btn-primary" name="submit" value="View landlord details">
                                                    <ion-icon name="eye-outline"></ion-icon></button>
                                            </form>
                                            <%}else{%>
                                            <span>&nbsp;</span>
                                            <%}%>
                                        </div>
                                    </td>

                                    <td style="padding-top:80px;padding-bottom: 80px;">
                                        <%=order_date%>
                                    </td>
                                    <td style="padding-top:80px;padding-bottom: 80px;">
                                        <%=status%>
                                    </td>
                                    <td style="padding-top:80px;padding-bottom: 80px;">
                                        <%if(status.equals("processing")){%>
                                        <a href="order?service=cancelOrder&id=<%=order_id%>" onclick="return confirmAction()">
                                            <button type="button" class="w-100 btn btn-sm btn-primary">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </button>
                                        </a>
                                        <%}%>  
                                    </td>
                                </tr>
                                <%
    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        function confirmAction() {
            return confirm("Are you sure you want to cancel this order?");
        }
    </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</html>
</div>
