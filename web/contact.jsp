<!DOCTYPE html>
<html lang="en">

    <head>
        <%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
        <%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@ page import="model.Users" %>
    </head>

    <body>

        <%
            Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
            DAO.PostDAO dao = new PostDAO();
        %>  
        <!-- End JSP Code -->

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
        </div><!-- End Property Search Section -->

        <!-- ======= Header/Navbar ======= -->
        <!-- Header cho khach -->
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->

        <main id="main">

            <!-- ======= Intro Single ======= -->
            <section class="intro-single">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="title-single-box">
                                <h1 class="title-single">Contact US</h1>
                                <span class="color-text-a">Hệ thống cho thuê trọ uy tín nhất Việt Nam</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="trang-chu">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Contact
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section><!-- End Intro Single-->

            <!-- ======= Contact Single ======= -->
            <section class="contact">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="contact-map box">
                                <div id="map" class="contact-map">
                                    <iframe
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14899.039341096059!2d105.53571425!3d21.0022621!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1696817823484!5m2!1svi!2s"

                                        width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 section-t8">
                            <div class="row">
                                <div class="col-md-7">
                                    <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <input type="text" name="name" class="form-control form-control-lg form-control-a"
                                                           placeholder="Your Name" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <div class="form-group">
                                                    <input name="email" type="email" class="form-control form-control-lg form-control-a"
                                                           placeholder="Your Email" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <div class="form-group">
                                                    <input type="text" name="subject" class="form-control form-control-lg form-control-a"
                                                           placeholder="Subject" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <textarea name="message" class="form-control" name="message" cols="45" rows="8"
                                                              placeholder="Message" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12 my-3">
                                                <div class="mb-3">
                                                    <div class="loading">Loading</div>
                                                    <div class="error-message"></div>
                                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 text-center">
                                                <button type="submit" class="btn btn-a">Send Message</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-5 section-md-t3">
                                    <div class="icon-box section-b2">
                                        <div class="icon-box-icon">
                                            <span class="bi bi-envelope"></span>
                                        </div>
                                        <div class="icon-box-content table-cell">
                                            <div class="icon-box-title">
                                                <h4 class="icon-title">Say Hello</h4>
                                            </div>
                                            <div class="icon-box-content">
                                                <p class="mb-1">Email.
                                                    <span class="color-a">contact@example.com</span>
                                                </p>
                                                <p class="mb-1">Phone.
                                                    <span class="color-a">+54 356 945234</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="icon-box section-b2">
                                        <div class="icon-box-icon">
                                            <span class="bi bi-geo-alt"></span>
                                        </div>
                                        <div class="icon-box-content table-cell">
                                            <div class="icon-box-title">
                                                <h4 class="icon-title">Find us in</h4>
                                            </div>
                                            <div class="icon-box-content">
                                                <p class="mb-1">
                                                    Manhattan, Nueva York 10036,
                                                    <br> EE. UU.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="icon-box">
                                        <div class="icon-box-icon">
                                            <span class="bi bi-share"></span>
                                        </div>
                                        <div class="icon-box-content table-cell">
                                            <div class="icon-box-title">
                                                <h4 class="icon-title">Social networks</h4>
                                            </div>
                                            <div class="icon-box-content">
                                                <div class="socials-footer">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item">
                                                            <a href="#" class="link-one">
                                                                <i class="bi bi-facebook" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li class="list-inline-item">
                                                            <a href="#" class="link-one">
                                                                <i class="bi bi-twitter" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li class="list-inline-item">
                                                            <a href="#" class="link-one">
                                                                <i class="bi bi-instagram" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                        <li class="list-inline-item">
                                                            <a href="#" class="link-one">
                                                                <i class="bi bi-linkedin" aria-hidden="true"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End Contact Single-->

        </main><!-- End #main -->

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