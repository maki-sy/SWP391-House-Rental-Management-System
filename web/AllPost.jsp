<%-- 
    Document   : AllPost
    Created on : Sep 22, 2023, 11:23:35 PM
    Author     : Tuấn Anh
--%>
<%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
<%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- ======= Header/Navbar ======= -->

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
                                <label class="pb-2" for="price">Price</label>
                                <select class="form-control form-select form-control-a" id="price" name="priceTo">
                                    <option>Unlimite</option>
                                    <option value="800"><800$</option>
                                    <option value="1000"><1000$</option>
                                    <option value="1500"><1500$</option>
                                    <option value="2000"><2000$</option>
                                    <option value="2100"><3000$</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="areaTo">Area</label>
                                <select class="form-control form-select form-control-a" id="areas" name="areaTo">
                                    <option>Any</option>
                                    <option value="10"><10m2</option>
                                    <option value="14"><14m2</option>
                                    <option value="15"><15m2</option>
                                    <option value="18"><18m2</option>
                                    <option value="20"><20m2</option>
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
                        <input type="text" name="index" value="1" style="display: none;">        
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-b">Search Property</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- End Property Search Section -->>


        <!-- End Header/Navbar -->
        <%
                  List<PostRental> list = (List<PostRental>) request.getAttribute("listOfPost");
                  ArrayList<String> thumbnailList = (ArrayList<String>) request.getAttribute("thumbnailList");
                  ArrayList<Integer> saleList = (ArrayList<Integer>) request.getAttribute("saleList");
                  
        %>
        <main id="main">

            <!-- ======= Intro Single ======= -->
            <section class="intro-single">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="title-single-box">
                                <h1 class="title-single">Our Amazing Properties</h1>
                                <span class="color-text-a">Houses Properties</span>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-8">
                            <h1 class="color-text-a">Result: <%=list.size()%></h1>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item ">
                                        <a href="trang-chu">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Properties Grid
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section><!-- End Intro Single-->

            <!-- ======= Property Grid ======= -->
            <section class="property-grid grid">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <!--                  <div class="grid-option">
                                                <form>
                                                  <select class="custom-select">
                                                    <option selected>All</option>
                                                    <option value="1">New to Old</option>
                                                    <option value="2">For Rent</option>
                                                    <option value="3">For Sale</option>
                                                  </select>
                                                </form>
                                              </div>-->

                        </div>
                        <div class="row">
                            <%
                                for(int i = 0; i < list.size(); i++){
                            %>  
                            <div class="col-md-4">
                                <div class="card-box-a card-shadow  h-100">
                                    <div class="img-box-a" style="position: relative;">
                                        <img src="<%=thumbnailList.get(i)%>" alt="" class="img-a img-fluid img-thumbnail" style="overflow-clip-margin: content-box; overflow: clip;">
                                        <% if (saleList.get(i) > 0) {%>
                                        <div style="position: absolute; top: 10px; left: 10px; background-color: red; color: white; padding: 5px;">
                                            Sale Off <%= saleList.get(i) %>% 
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="card-overlay ">
                                        <div class="card-overlay-a-content">
                                            <div class="card-header-a">
                                                <h2 class="card-title-a">
                                                    <a href="housedetail?id=<%=list.get(i).getId()%>">
                                                        <% String name = list.get(i).getName();
                                                        int maxCharacters = 15;
                                                        if (name.length() > maxCharacters) {
                                                        name = name.substring(0, maxCharacters) + "..."
                                                        ;}%>
                                                        <%= name %>
                                                    </a>
                                                </h2>
                                            </div>
                                            <div class="card-body-a ">
                                                <% if (saleList.get(i) == 0) { %>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">rent | $ <%=String.format("%.1f", list.get(i).getPrice())%></span>
                                                </div>
                                                <% } else if (saleList.get(i) < 100) { %>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">
                                                        <span>rent | $</span>
                                                        <span class="text-decoration-line-through"><%=String.format("%.1f", list.get(i).getPrice())%></span>
                                                    </span>
                                                </div>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">For Sale | $ <%=String.format("%.1f", list.get(i).getPrice() - (list.get(i).getPrice() * saleList.get(i) / 100))%></span>
                                                </div>
                                                <% } else { %>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">
                                                        <span>rent | $</span>
                                                        <span class="text-decoration-line-through"><%=String.format("%.1f", list.get(i).getPrice())%></span>
                                                    </span>
                                                </div>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">For Sale | $ Free</span>
                                                </div>
                                                <% } %>
                                                <a href="housedetail?id=<%=list.get(i).getId()%>" class="link-a">Click here to view
                                                    <span class="bi bi-chevron-right"></span>
                                                </a>
                                            </div>
                                            <div class="card-footer-a">
                                                <ul class="card-info d-flex justify-content-around">
                                                    <li>
                                                        <h4 class="card-info-title">Area</h4>
                                                        <span><%=list.get(i).getArea()%>m
                                                            <sup>2</sup>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <h4 class="card-info-title">Beds</h4>
                                                        <span><%=list.get(i).getNumOfBeds()%></span>
                                                    </li>
                                                    <li>
                                                        <h4 class="card-info-title">Status</h4>
                                                        <span><%=list.get(i).getStatus()%></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%
int pageIndex = (Integer) request.getAttribute("pageIndex");
int numOfPost = (Integer) request.getAttribute("numOfPost");
                    %>

                    <div class="row" style="margin-top: 3rem">
                        <div class="col-sm-12">
                            <nav class="pagination-a">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item <%= (pageIndex == 1) ? "disabled" : "" %>">
                                        <a class="page-link" href="<%= (pageIndex > 1) ? "Post?index=" + (pageIndex - 1) : "#" %>">
                                            <span class="bi bi-chevron-left"></span>
                                        </a>
                                    </li>
                                    <% for (int i = 1; i <= numOfPost; i++) { %>
                                    <li class="page-item <%= (i == pageIndex) ? "active" : "" %>">
                                        <a class="page-link" href="Post?index=<%=i%>"><%=i%></a>
                                    </li>
                                    <% } %>
                                    <li class="page-item <%= (pageIndex == numOfPost) ? "disabled" : "" %>">
                                        <a class="page-link" href="<%= (pageIndex < numOfPost) ? "Post?index=" + (pageIndex + 1) : "#" %>">
                                            <span class="bi bi-chevron-right"></span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>





                </div>
            </section><!-- End Property Grid Single-->

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
