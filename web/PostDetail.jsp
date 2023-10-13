<%-- 
    Document   : PostDetail
    Created on : Sep 23, 2023, 6:54:48 AM
    Author     : Tuấn Anh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
<%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>
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
                            ArrayList<PropertyType> type = (ArrayList<PropertyType>) request.getAttribute("type");
                            ResultSet bedroom = (ResultSet) request.getAttribute("bedroom");
                            ResultSet priceFrom = (ResultSet) request.getAttribute("priceFrom");
                            ResultSet priceTo = (ResultSet) request.getAttribute("priceTo");
                            ResultSet areaFrom = (ResultSet) request.getAttribute("areaFrom");
                            ResultSet areaTo = (ResultSet) request.getAttribute("areaTo");
                            ArrayList<PropertyLocation> location = (ArrayList<PropertyLocation>) request.getAttribute("location");
                        %>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="Type">Type</label>
                                <select class="form-control form-select form-control-a" id="Type" name="type">
                                    <option>All Type</option>
                                    <%for(PropertyType tp:type){%>
                                    <option value="<%=tp.getTypeId()%>"><%=tp.getTypeName()%></option>
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
                                    <%for(PropertyLocation pl:location){ %>
                                    <option value="<%=pl.getId()%>"><%=pl.getLocation_name()%></option>
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
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->
        <%
                  PostRental post = (PostRental) request.getAttribute("PostDetail");
                  int postID = post.getId();
                  List<PostImage> image_url = dao.getPostImages(postID);
                  
        %>
        <main id="main">
            <!-- ======= Intro Single ======= -->
            <section class="intro-single">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="title-single-box">
                                <h1 class="title-single"><%=post.getName()%></h1>
                                <span class="color-text-a"><%=post.getAddress()%></span>
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
                                        <%=post.getName()%>
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
                                                <h5 class="title-c"><%=post.getPrice()%></h5>
                                            </div>
                                        </div>
                                    </div>
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
                                                    <strong>Location:</strong>
                                                    <span><%=post.getAddress()%></span>
                                                </li>

                                                <li class="d-flex justify-content-between">
                                                    <strong>Status:</strong>
                                                    <span><%=post.getStatus()%></span>
                                                </li>
                                                <li class="d-flex justify-content-between">
                                                    <strong>Area:</strong>
                                                    <span><%=post.getArea()%>m
                                                        <sup>2</sup>
                                                    </span>
                                                </li>
                                                <li class="d-flex justify-content-between">
                                                    <strong>Beds:</strong>
                                                    <span><%=post.getNumOfBeds()%></span>
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
                                            <%=post.getDesscription()%>
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