<!DOCTYPE html>
<%@page import="DAO.TenantDAO"%>
<%@page import="DAO.LandlordDAO"%>
<%@page import="model.Tenant"%>
<%@page import="model.Landlord"%>
<%@ page import="model.Users"%>
<html lang="en">
    <head>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
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
        <style>

        </style>
        <!-- =======================================================
      * Template Name: EstateAgency
      * Updated: Jul 27 2023 with Bootstrap v5.3.1
      * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
        <%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
        <%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>

    </head>

    <body>

        <!-- ======= JSP ======= -->
        <% 
        Users user = session.getAttribute("user")==null ? null : (Users)session.getAttribute("user"); 
        Tenant tenant=(Tenant)request.getAttribute("tn");
        Landlord landlord=(Landlord)request.getAttribute("ll");
//        Users account=(Users)loggedUser;
        String role_name=(String)request.getAttribute("role_name");
        DAO.PostDAO dao = new PostDAO();
        %>


        <!-- End JSP Code -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>
        <main id="main" style="margin-top: 3rem">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <%if(user!=null){%>
                    <%if(tenant!=null){%>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="<%=session.getAttribute("userAvatar")%>" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <h5 class="my-3"><%=tenant.getFirstName()%>&nbsp;<%=tenant.getLastName()%></h5>
                                    <p class="text-muted mb-1"><%=user.getEmail()%></p>
                                    <p class="text-muted mb-4">*******</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn btn-primary"
                                                disabled><%=role_name%></button>
                                        <button type="button" class="btn btn-outline-primary ms-1"
                                                disabled><%=user.getStatus()%></button>
                                    </div>

                                    <form action="uploadavt" method="post" enctype="multipart/form-data">
                                        <div class="input-group mb-3">
                                            <input type="file" name="avatar" class="form-control" accept="image/*">
                                        </div>
                                        <button class="btn btn-primary" type="submit">Upload/Update Avatar</button>
                                    </form>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">

                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=updateProfile"><button type="button" class="btn btn-primary">Edit public information</button></a>
                                        </li>
                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=changePassword">
                                                <button type="button" class="btn btn-primary">Change password</button>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">First Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=tenant.getFirstName()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Last Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=tenant.getLastName()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=tenant.getAddress()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=tenant.getPhone()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Civil ID</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <%if(tenant.getCivilID() == null){%>
                                            <p class="text-muted mb-0">N/A</p>
                                            <%}else{%>
                                            <p class="text-muted mb-0"><%=tenant.getCivilID()%></p>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%}%>
                    <%if(landlord!=null){%>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="<%=session.getAttribute("userAvatar")%>" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <h5 class="my-3"><%=landlord.getFirstName()%>&nbsp;<%=landlord.getLastName()%></h5>
                                    <p class="text-muted mb-1"><%=user.getEmail()%></p>
                                    <p class="text-muted mb-4">*******</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn btn-primary"
                                                disabled><%=role_name%></button>
                                        <button type="button" class="btn btn-outline-primary ms-1"
                                                disabled><%=user.getStatus()%></button>
                                    </div>

                                    <form action="uploadavt" method="post" enctype="multipart/form-data">
                                        <div class="input-group mb-3">
                                            <input type="file" name="avatar" class="form-control" accept="image/*">
                                        </div>
                                        <button class="btn btn-primary" type="submit">Upload/Update Avatar</button>
                                    </form>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">

                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=updateProfile"><button type="button" class="btn btn-primary">Edit
                                                    public
                                                    information</button></a>
                                        </li>
                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=changePassword"><button type="button"
                                                                                             class="btn btn-primary">Change
                                                    password</button></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">First Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=landlord.getFirstName()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Last Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=landlord.getLastName()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=landlord.getAddress()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%=landlord.getPhone()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Civil ID</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <%if(landlord.getCivilID()==null){%>
                                            <p class="text-muted mb-0">N/A</p>
                                            <%}else{%>
                                            <p class="text-muted mb-0"><%=landlord.getCivilID()%></p>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%}%>
                    <%}%>
                </div>
            </section>
        </main>

        <%@include file="footer.jsp" %>

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>