<%-- 
    Document   : PromotionManage
    Created on : Sep 27, 2023, 6:34:07 PM
    Author     : Administrator
--%>
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
        <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
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
        </nav>
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
                                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <h5 class="my-3">John Smith</h5>
                                    <p class="text-muted mb-1">Full Stack Developer</p>
                                    <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn btn-primary"
                                                disabled>Landlord</button>
                                        <button type="button" class="btn btn-outline-primary ms-1"
                                                disabled>Very
                                            positive</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="AddPromotion?service=form"><button type="button" class="btn btn-primary">Add
                                                Promotion Form</button></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <h1>Promotion Manage</h1>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Discount</th>
                                            <th>Description</th>
                                            <th>Promotion start date</th>
                                            <th>Promotion end Date</th>
                                            <th>Actions</th>
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
                                                <td><a href="#">Edit</a>/
                                                    <a href="RemovePromotion?service=promotion&id=${o.promotion_id}">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>
                        </div>
                    </div>
                    </body>
                    </html>
