<%-- 
    Document   : UpdateProfile
    Created on : Sep 28, 2023, 9:24:24 PM
    Author     : Sy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.TenantDAO"%>
<%@page import="DAO.LandlordDAO"%>
<%@page import="model.Tenant"%>
<%@page import="model.Landlord"%>
<%@ page import="model.Users" %>

<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
%> 

<!DOCTYPE html>
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

        <!-- =======================================================
      * Template Name: EstateAgency
      * Updated: Jul 27 2023 with Bootstrap v5.3.1
      * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
    </head>

    <body>
        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>

        <!-- End Header/Navbar -->



        <main id="main">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                    <li class="breadcrumb-item"><a href="Profile?service=displayProfile">User Profile</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Edit public information</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <%
                        Tenant tenant=(Tenant)request.getAttribute("tn");
                        Landlord landlord=(Landlord)request.getAttribute("ll");
                        Object loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user"); ;
                        Users account=(Users)loggedUser;
                        String role_name=(String)request.getAttribute("role_name");
                    %>
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
                                    <button type="button" class="btn btn-outline-primary ms-1"
                                            >Upload/Update Avatar</button>
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
                                        <li class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=updateProfile"><button type="button" class="btn btn-primary">Edit public
                                                    information</button></a>
                                        </li>
                                        <li class="list-group-item justify-content-between align-items-center">
                                            <a href="#!"><button type="button" class="btn btn-primary">Change
                                                    password</button></a>
                                        </li>
                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="wishlist?service=view">
                                                <button type="button" class="btn btn-primary">View my wish list</button>
                                            </a>
                                        </li>
                                        <li class="list-group-item justify-content-between align-items-center">
                                            <a href="order?service=viewOrder"><button type="button" class="btn btn-primary">My Order</button></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <form action="Profile" method="post">
                                    <div class="card-body">
                                        <div class="row">
                                            <input type="hidden" name="tnid" value="<%=tenant.getId()%>">
                                            <div class="col-sm-3">
                                                <p class="mb-0">First Name</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="fname" value="<%=tenant.getFirstName()%>" pattern="^[a-zA-Z ]*$" required></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Last Name</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="lname" value="<%=tenant.getLastName()%>" pattern="^[a-zA-Z ]*$" required></p>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Address</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="address" value="<%=tenant.getAddress()%>" maxlength="80"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Phone</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="phone" value="<%=tenant.getPhone()%>" maxlength="10" pattern="[0-9]{10}" required></p>
                                            </div>
                                        </div>

                                        <input class="btn btn-primary" type="submit" value="update" name="submit">
                                        <input class="btn btn-primary" type="reset" value="reset">
                                        <input type="hidden" name="service" value="updateProfile">
                                    </div>
                                </form>
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
                                        <li class="list-group-item justify-content-between align-items-center">
                                            <!--                                        <a href="Profile?service=updateProfile&id=//account.getId()"><button type="button" class="btn btn-primary">Edit public
                                                                                            information</button></a>-->
                                        </li>
                                        <li class="list-group-item justify-content-between align-items-center">
                                            <a href="#!"><button type="button" class="btn btn-primary">Change
                                                    password</button></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <form action="Profile" method="post">
                                    <div class="card-body">
                                        <div class="row">
                                            <input type="hidden" name="llid" value="<%=landlord.getId()%>">
                                            <div class="col-sm-3">
                                                <p class="mb-0">First Name</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="fname" value="<%=landlord.getFirstName()%>" pattern="^[a-zA-Z ]*$" required></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Last Name</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="lname" value="<%=landlord.getLastName()%>" pattern="^[a-zA-Z ]*$" required></p>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Address</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="address" value="<%=landlord.getAddress()%>" maxlength="80"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Phone</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><input type="text" name="phone" value="<%=landlord.getPhone()%>" maxlength="10" pattern="[0-9]{10}" required></p>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="update" name="submit">
                                        <input class="btn btn-primary" type="reset" value="reset">
                                        <input type="hidden" name="service" value="updateProfile">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </section>
        </main>

        <!-- ======= Footer ======= -->
        <section class="section-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-4">
                        <div class="widget-a">
                            <div class="w-header-a">
                                <h3 class="w-title-a text-brand">EstateAgency</h3>
                            </div>
                            <div class="w-body-a">
                                <p class="w-text-a color-text-a">
                                    Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea
                                    commodo consequat duis
                                    sed aute irure.
                                </p>
                            </div>
                            <div class="w-footer-a">
                                <ul class="list-unstyled">
                                    <li class="color-a">
                                        <span class="color-text-a">Phone .</span> contact@example.com
                                    </li>
                                    <li class="color-a">
                                        <span class="color-text-a">Email .</span> +54 356 945234
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 section-md-t3">
                        <div class="widget-a">
                            <div class="w-header-a">
                                <h3 class="w-title-a text-brand">The Company</h3>
                            </div>
                            <div class="w-body-a">
                                <div class="w-body-a">
                                    <ul class="list-unstyled">
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Site Map</a>
                                        </li>
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Legal</a>
                                        </li>
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Agent Admin</a>
                                        </li>
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Careers</a>
                                        </li>
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Affiliate</a>
                                        </li>
                                        <li class="item-list-a">
                                            <i class="bi bi-chevron-right"></i> <a href="#">Privacy Policy</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 section-md-t3">
                        <div class="widget-a">
                            <div class="w-header-a">
                                <h3 class="w-title-a text-brand">International sites</h3>
                            </div>
                            <div class="w-body-a">
                                <ul class="list-unstyled">
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">Venezuela</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">China</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">Hong Kong</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">Argentina</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">Singapore</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="bi bi-chevron-right"></i> <a href="#">Philippines</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="nav-footer">
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <a href="#">Home</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">About</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">Property</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">Blog</a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">Contact</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="socials-a">
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="bi bi-facebook" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="bi bi-twitter" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="bi bi-instagram" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="bi bi-linkedin" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="copyright-footer">
                            <p class="copyright color-text-a">
                                &copy; Copyright
                                <span class="color-a">EstateAgency</span> All Rights Reserved.
                            </p>
                        </div>
                        <div class="credits">
                            <!--
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
                            -->
                            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer><!-- End  Footer -->

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