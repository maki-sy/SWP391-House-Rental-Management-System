<%-- 
    Document   : PostDetail
    Created on : Sep 23, 2023, 6:54:48 AM
    Author     : Tuấn Anh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PostRental, model.PostImage, DAO.PostDAO" %>

<%@page import="java.util.List, java.sql.ResultSet"%>
<%@ page import="model.Users" %>
<%
Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
    DAO.PostDAO dao = new PostDAO();
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>House Detail</title>
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

        <!-- ======= Property Search Section ======= -->
        <div class="click-closed"></div>
        <!--/ Form Search Star /-->
        <div class="box-collapse">
            <div class="title-box-d">
                <h3 class="title-d">Search Property</h3>
            </div>
            <span class="close-box-collapse right-boxed bi bi-x"></span>
            <div class="box-collapse-wrap form">
                <form action="search" method="GET" class="form-a">
                    <div class="row">
                        <div class="col-md-12 mb-2">
                            <div class="form-group">
                                <label class="pb-2" for="Type">Keyword</label>
                                <input name="txt" type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
                            </div>
                        </div>
                        <%
                            ResultSet type = (ResultSet) request.getAttribute("type");
                            ResultSet bedroom = (ResultSet) request.getAttribute("bedroom");
                            ResultSet priceFrom = (ResultSet) request.getAttribute("priceFrom");
                            ResultSet priceTo = (ResultSet) request.getAttribute("priceTo");
                            ResultSet areaFrom = (ResultSet) request.getAttribute("areaFrom");
                            ResultSet areaTo = (ResultSet) request.getAttribute("areaTo");
                            ResultSet location = (ResultSet) request.getAttribute("location");
                        %>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="Type">Type</label>
                                <select class="form-control form-select form-control-a" id="Type" name="type">
                                    <option>All Type</option>
                                    <% while (type.next()) { %>
                                    <%
                                        int typeValue = type.getInt("type");
                                        String displayValue = "";
                                        if (typeValue == 1) {
                                            displayValue = "Nhà Trọ";
                                        } else if (typeValue == 2) {
                                            displayValue = "Chung Cư";
                                        }
                                    %>
                                    <option value="<%= typeValue %>"><%= displayValue %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="bedrooms">Bedrooms</label>
                                <select class="form-control form-select form-control-a" id="bedrooms" name="bed">
                                    <option>Any</option>
                                    <% while (bedroom.next()) { %>
                                    <option><%= bedroom.getString("NumOfBedrooms") %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>


                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Price From</label>
                                <select class="form-control form-select form-control-a" id="price" name="priceFrom">
                                    <option>0</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Price To</label>
                                <select class="form-control form-select form-control-a" id="price" name="priceTo">
                                    <option>Unlimite</option>
                                    <option value="800">800$</option>
                                    <option value="900">900$</option>
                                    <option value="1000">1000$</option>
                                    <option value="1200">1200$</option>
                                    <option value="1500">1500$</option>
                                    <option value="1800">1800$</option>
                                    <option value="2000">2000$</option>
                                    <option value="2100">2100$</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="areaFrom">Area From</label>
                                <select class="form-control form-select form-control-a" id="areas" name="areaFrom">
                                    <option>0</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="areaTo">Area To</label>
                                <select class="form-control form-select form-control-a" id="areas" name="areaTo">
                                    <option>Any</option>
                                    <option value="10">10m2</option>
                                    <option value="14">14m2</option>
                                    <option value="15">15m2</option>
                                    <option value="18">18m2</option>
                                    <option value="20">20m2</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="location">Location</label>
                                <select class="form-control form-select form-control-a" id="location" name="location">
                                    <option>Any</option>
                                    <% while (location.next()) { %>
                                    <option><%= location.getString("location_name")%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-b">Search Property</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- End Property Search Section -->>

        <!-- ======= Header/Navbar ======= -->
        <!-- Header cho khách (guest) -->
        <% if(user == null) { %>

        <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
            <div class="container">
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDefault"
                        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <a class="navbar-brand text-brand" href="trang-chu">Rental<span class="color-b">House</span></a>

                <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link " href="trang-chu">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active " href="Post">Houses</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="agents-grid.html">Landlords</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="property-single.html">House Detail</a>
                                <a class="dropdown-item " href="agent-single.html">Landlord Detail</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="nav-item btn" style="padding: 0.35rem 1rem;">
                    <a href="login">Login/Register</a>
                </div>

                <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse" data-bs-toggle="collapse"
                        data-bs-target="#navbarTogglerDemo01">
                    <i class="bi bi-search"></i>
                </button>

            </div>
        </nav>

        <!-- Header cho người dùng đã đăng nhập -->
        <%} else {%>
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
                            <a class="nav-link " href="trang-chu">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Post">Houses</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="agents-grid.html">Landlords</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="property-single.html">House Detail</a>
                                <a class="dropdown-item " href="agent-single.html">Landlord Detail</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="contact.html">Contact</a>
                        </li>

                        <li class="nav-item">
                            <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                                 style="width: 3rem; margin-left: 6rem" alt="Avatar" />
                        </li>
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My profile</a>

                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="./profile-personal.html">Manage rental house</a>
                                <a class="dropdown-item " href="Profile?service=displayProfile&id=<%=user.getId()%>&roleid=<%=user.getRoleID()%>">Manage account</a>
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
        <%}%>
        <!-- End Header/Navbar -->
        <%
                  List<PostRental> list = (List<PostRental>) request.getAttribute("PostDetail");
                  
        %>
        <main id="main">
            <%for(PostRental pr:list){
            int postID = pr.getId();
            List<PostImage> image_url = dao.getPostImages(postID);
            %>

            <!-- ======= Intro Single ======= -->
            <section class="intro-single">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="title-single-box">
                                <h1 class="title-single"><%=pr.getName()%></h1>
                                <span class="color-text-a"><%=pr.getAddress()%></span>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="trang-chu">Home</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="property-grid.html">Properties</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <%=pr.getName()%>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section><!-- End Intro Single-->

            <!-- ======= Property Single ======= -->
            <section class="property-single nav-arrow-b">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div id="property-single-carousel" class="swiper">
                                <div class="swiper-wrapper">
                                    <%for(PostImage po:image_url){%>
                                    <%if(po.getImg_type().equals("main")){%>
                                    <div class="carousel-item-b swiper-slide">
                                        <img src="<%=po.getImg_url()%>" alt="" class="img-fluid">
                                    </div>
                                    <%}}%>
                                </div>
                            </div>
                            <div class="property-single-carousel-pagination carousel-pagination"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="row justify-content-between">
                                <div class="col-md-5 col-lg-4">
                                    <div class="property-price d-flex justify-content-center foo">
                                        <div class="card-header-c d-flex">
                                            <div class="card-box-ico">
                                                <span class="bi bi-cash">$</span>
                                            </div>
                                            <div class="card-title-c align-self-center">
                                                <h5 class="title-c"><%=pr.getPrice()%></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <% if(user!=null){ %>
                                    <!--<a href="order?postid=//postID"><button type="button" class="btn btn-primary">Create an Order</button>-->
                                    <button class="btn btn-primary" onclick="openForm()">Order</button>

                                    <div id="myForm" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4);">
                                        <div style="background-color: #fefefe; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 80%;">
                                            <form action="order">
                                                <h1>Order</h1>
                                                <input type="hidden" name="postid" value="<%=postID%>">
                                                <button class="btn btn-primary" type="submit" onclick="closeForm()">Send Order</button>
                                                <input type="hidden" name="service" value="createOrder">
                                                <button class="btn btn-primary"type="button" onclick="closeForm()">Close</button>
                                            </form>
                                        </div>
                                    </div>

                                    <%} else {%>
                                    <a href="login"><button type="button" class="btn btn-primary">Create an Order</button>
                                        <%}%>
                                        <script>
                                            function openForm() {
                                                document.getElementById("myForm").style.display = "block";
                                            }

// Function to close the form
                                            function closeForm() {
                                                document.getElementById("myForm").style.display = "none";
                                            }
                                        </script>
                                        <div class="property-summary">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="title-box-d section-t4">
                                                        <h3 class="title-d">Quick Summary</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="summary-list">
                                                <ul class="list">
                                                    <li class="d-flex justify-content-between">
                                                        <strong>Property ID:</strong>
                                                        <span><%=pr.getId()%></span>
                                                    </li>
                                                    <li class="d-flex justify-content-between">
                                                        <strong>Location:</strong>
                                                        <span><%=pr.getAddress()%></span>
                                                    </li>

                                                    <li class="d-flex justify-content-between">
                                                        <strong>Status:</strong>
                                                        <span><%=pr.getStatus()%></span>
                                                    </li>
                                                    <li class="d-flex justify-content-between">
                                                        <strong>Area:</strong>
                                                        <span><%=pr.getArea()%>m
                                                            <sup>2</sup>
                                                        </span>
                                                    </li>
                                                    <li class="d-flex justify-content-between">
                                                        <strong>Beds:</strong>
                                                        <span><%=pr.getNumOfBeds()%></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                </div>
                                <div class="col-md-7 col-lg-7 section-md-t3">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="title-box-d">
                                                <h3 class="title-d">Property Description</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="property-description">
                                        <p class="description color-text-a">
                                            <%=pr.getDesscription()%>
                                        </p>
                                        <p class="description color-text-a no-margin">
                                            Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget
                                            malesuada. Quisque velit nisi,
                                            pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.
                                        </p>
                                    </div>
                                    <!--                      <div class="row section-t3">
                                                            <div class="col-sm-12">
                                                              <div class="title-box-d">
                                                                <h3 class="title-d">Amenities</h3>
                                                              </div>
                                                            </div>
                                                          </div>
                                                          <div class="amenities-list color-text-a">
                                                            <ul class="list-a no-margin">
                                                              <li>Balcony</li>
                                                              <li>Outdoor Kitchen</li>
                                                              <li>Cable Tv</li>
                                                              <li>Deck</li>
                                                              <li>Tennis Courts</li>
                                                              <li>Internet</li>
                                                              <li>Parking</li>
                                                              <li>Sun Room</li>
                                                              <li>Concrete Flooring</li>
                                                            </ul>
                                                          </div>-->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section><!-- End Property Single-->
            <%}%>
        </main><!-- End #main -->

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
                                    Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat
                                    duis
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