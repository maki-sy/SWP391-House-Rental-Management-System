<%-- 
    Document   : PromotionManage
    Created on : Sep 27, 2023, 6:34:07 PM
    Author     : Administrator
--%>
<!-- ======= JSP ======= -->
<%@ page import="model.Users" %>
<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
%>  
<!-- End JSP Code -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>EstateAgency Bootstrap Template - Index</title>
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

        <!-- =======================================================
      * Template Name: EstateAgency
      * Updated: Jul 27 2023 with Bootstrap v5.3.1
      * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
    </head>
    <body>
        <!--Header-->
        <%@include file="header.jsp" %>
        <!--End header-->

        <!--        <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
                    <div class="container">
                        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <a class="navbar-brand text-brand" href="trang-chu">Rental<span class="color-b">House</span></a>
        
                        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
                            <ul class="navbar-nav">
        
                                <li class="nav-item">
                                    <a class="nav-link active" href="trang-chu">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="property-grid.jsp">Houses</a>
                                </li>
        
                                <li class="nav-item">
                                    <a class="nav-link " href="agents-grid.jsp">Landlords</a>
                                </li>
        
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item " href="property-single.jsp">House Detail</a>
                                        <a class="dropdown-item " href="agent-single.jsp">Landlord Detail</a>
                                    </div>
                                </li>
        
                                <li class="nav-item">
                                    <a class="nav-link " href="contact.jsp">Contact</a>
                                </li>
        
                                <li class="nav-item">
                                    <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                                         style="width: 3rem; margin-left: 6rem" alt="Avatar" />
                                </li>
                                <li class="nav-item dropdown">
        
                                    <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown" role="button"
                                       data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My
                                        profile</a>
        
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item " href="./profile-personal.jsp">Manage services</a>
                                        <a class="dropdown-item " href="./profile-personal.jsp">Manage account</a>
                                        <a class="dropdown-item " href="login?type=logout">Logout</a>
                                    </div>
                                </li>
        
                            </ul>
                        </div>
                        <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
                                data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
                            <i class="bi bi-search"></i>
                        </button>
        
                    </div>
                </nav>-->
        <br>
        <main id="main">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">User</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Promotion Manage</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="./assets/img/setting.png"
                                         alt="avatar" class="img-fluid"
                                         style="width: 150px;">
                                    <div class="mb-3"></div>
                                    <ul class="list-group text-start">
                                        <li class="text-start list-group-item active list-group-item-action" aria-current="true">Manage promotion</li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=session.getAttribute("accountBalance")%>
                                        </span>
                                        </li>
                                        <li class="list-group-item"><span class="text-bg-primary">--Edit --</span><span> Change Promotion information</span></li>
                                        <li class="list-group-item"><span class="text-bg-warning">--Duration--</span><span> Set promotion date</span></li>
                                        <li class="list-group-item"><span class="text-bg-danger">--Delete--</span><span> Remove personal promotion</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <%@include file="L-service-sidebar.jsp" %>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <c:if test="${empty listPromotion}">
                                    <h1>There are no promotions</h1>
                                </c:if>
                                <c:if test="${not empty listPromotion}">
                                    <h1>Promotion Manage</h1>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Discount</th>
                                                <th>Description</th>
                                                <th>Promotion start date</th>
                                                <th>Promotion end Date</th>
                                                <th class="col-lg-1">Edit</th>
                                                <th>Duration</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listPromotion}" var="o">
                                                <tr>                                        
                                                    <td>${o.promotion_id}</td>
                                                    <td>${o.discount} %</td>
                                                    <td>
                                                        ${o.descriptions}
                                                    </td>
                                                    <td>${o.promotion_start_date}</td>
                                                    <td>${o.promotion_end_date}</td> 
                                                    <td>
                                                        <form action="EditPromotion" method="post">
                                                            <input type="hidden" name="now" value="edit">
                                                            <input type="hidden" name="service" value="form">
                                                            <input type="hidden" name="id"
                                                                   value="${o.promotion_id}">
                                                            <button type="submit"
                                                                    class="w-100 btn btn-sm btn-primary">
                                                                <ion-icon name="create-outline"></ion-icon>
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <form action="EditPromotion" method="post">
                                                            <input type="hidden" name="now" value="duration">
                                                            <input type="hidden" name="service" value="form">
                                                            <input type="hidden" name="id"
                                                                   value="${o.promotion_id}">
                                                            <button type="submit"
                                                                    class="w-100 btn btn-sm btn-warning">
                                                                <ion-icon name="calendar-outline"></ion-icon>
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <!--                                                    <td><a href="RemovePromotion?service=promotion&id=">Delete</a></td>-->
                                                    <td>
                                                        <form action="RemovePromotion" method="post">
                                                            <input type="hidden" name="service" value="promotion">
                                                            <input type="hidden" name="id"
                                                                   value="${o.promotion_id}">
                                                            <button type="submit"
                                                                    class="w-100 btn btn-sm btn-danger">
                                                                <ion-icon name="trash-outline"></ion-icon>                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> 
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Icon -->
                    <script type="module"
                    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
                    <script nomodule
                    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
                    </body>
                    </html>
