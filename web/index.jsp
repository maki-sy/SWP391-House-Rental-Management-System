<!-- ======= JSP ======= -->
<%@ page import="model.Users" %>
<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
    DAO.PostDAO dao = new PostDAO();
%>  
<!-- End JSP Code -->


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
        <%@page import="model.PostRental, model.PostImage, DAO.PostDAO" %>
        <%@page import="java.util.List, java.sql.ResultSet"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        </div><!-- End Property Search Section -->

        <!-- ======= Header/Navbar ======= -->
        <!-- Header cho khach -->
        <% if(user == null) { %>
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
                            <a class="nav-link " href="Post">Houses</a>

                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="agents-grid.jsp">Landlords</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="PromotionManage">Promotion</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="property-single.jsp">House Detail</a>
                                <a class="dropdown-item " href="agent-single.jsp">Landlord Detail</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="contact.jsp">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="nav-item btn" style="padding: 0.35rem 1rem;">
                    <a href="login?type=login">Login/Register</a>
                </div>

                <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
                        data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
                    <i class="bi bi-search"></i>
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item " href="/ManageServicesPage">Manage services</a>
                    <a class="dropdown-item " href="./profile-personal.jsp">Manage account</a>
                    <a class="dropdown-item " href="login?type=logout">Logout</a>
                </div>
                </li>

                </ul>
            </div>
        </nav>
        <!-- Header cho nguoi dung da dang nhap -->
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
                            <a class="nav-link active" href="trang-chu">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="Post">Houses</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link " href="agents-grid.jsp">Landlords</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="PromotionManage">Promotion</a>
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
                               data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My profile</a>

                            <div class="dropdown-menu">
                                <a class="dropdown-item " href="ManageServicesPage">Manage services</a>
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
        List<PostRental> highest = (List<PostRental>) request.getAttribute("highestPost");
        %>
        <!-- ======= Intro Section ======= -->
        <div class="intro intro-carousel swiper position-relative">

            <div class="swiper-wrapper">
                <%for(PostRental pr:highest){
                int pID = pr.getId();
                List<PostImage> image = dao.getPostImages(pID);
                %>
                <%for(PostImage po:image){%>
                <%if(po.getImg_type().equals("thumbails")){%>
                <div class="swiper-slide carousel-item-a intro-item bg-image"
                     style="background-image: url(<%=po.getImg_url()%>)">
                    <div class="overlay overlay-a"></div>
                    <div class="intro-content display-table">
                        <div class="table-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="intro-body">
                                            <p class="intro-title-top"><%=pr.getName()%>
                                                <br>
                                            </p>
                                            <h1 class="intro-title mb-4 ">
                                                <br> <%=pr.getAddress()%>
                                            </h1>
                                            <p class="intro-subtitle intro-price">
                                                <a href="#"><span class="price-a">rent | $ <%=pr.getPrice()%></span></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%break;}else{%>
                <div class="img-box-a">
                    <img src="https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg" alt="" class="img-a img-fluid">
                </div>
                <%continue;}}%>
                <%}%>
            </div>
            <div class="swiper-pagination"></div>
        </div><!-- End Intro Section -->


        <main id="main">

            <!-- ======= Services Section ======= -->
            <section class="section-services section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Our Services</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="bi bi-cart"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Lifestyle</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Praesent sapien
                                        massa,
                                        convallis a pellentesque
                                        nec, egestas non nisi.
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <a href="#" class="link-c link-icon">Read more
                                        <span class="bi bi-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="bi bi-calendar4-week"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Loans</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Nulla porttitor accumsan tincidunt. Curabitur aliquet quam id dui posuere blandit. Mauris
                                        blandit
                                        aliquet elit, eget tincidunt
                                        nibh pulvinar a.
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <a href="#" class="link-c link-icon">Read more
                                        <span class="bi bi-calendar4-week"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="bi bi-card-checklist"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Sell</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Praesent sapien
                                        massa,
                                        convallis a pellentesque
                                        nec, egestas non nisi.
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <a href="#" class="link-c link-icon">Read more
                                        <span class="bi bi-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End Services Section -->

            <%
            List<PostRental> list = (List<PostRental>) request.getAttribute("lastestPost");
            
            %>
            <!-- ======= Latest Properties Section ======= -->
            <section class="section-property section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Lastest Properties</h2>
                                </div>
                                <div class="title-link">
                                    <a href="Post">All Property
                                        <span class="bi bi-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="property-carousel" class="swiper">
                        <div class="swiper-wrapper">
                            <%for(PostRental po:list){
                            int postID = po.getId();
                            List<PostImage> image_url = dao.getPostImages(postID);
                            %>
                            <div class="carousel-item-b swiper-slide">
                                <div class="card-box-a card-shadow">
                                    <%for(PostImage p:image_url){%>
                                    <%if(p.getImg_type().equals("thumbails")){%>
                                    <div class="img-box-a">
                                        <img src="<%=p.getImg_url()%>" alt="" class="img-a img-fluid">
                                    </div>
                                    <%break;}else{%>
                                    <div class="img-box-a">
                                        <img src="https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg" alt="" class="img-a img-fluid">
                                    </div>
                                    <%continue;}}%>

                                    <div class="card-overlay">
                                        <div class="card-overlay-a-content">
                                            <div class="card-header-a">
                                                <h2 class="card-title-a">
                                                    <a href="housedetail?id=<%=po.getId()%>"><%=po.getName()%>
                                                    </a>
                                                </h2>
                                            </div>
                                            <div class="card-body-a">
                                                <div class="price-box d-flex">
                                                    <span class="price-a">rent | $ <%=po.getPrice()%></span>
                                                </div>
                                                <a href="housedetail?id=<%=po.getId()%>" class="link-a">Click here to view
                                                    <span class="bi bi-chevron-right"></span>
                                                </a>
                                            </div>
                                            <div class="card-footer-a">
                                                <ul class="card-info d-flex justify-content-around">
                                                    <li>
                                                        <h4 class="card-info-title">Area</h4>
                                                        <span><%=po.getArea()%>m
                                                            <sup>2</sup>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <h4 class="card-info-title">Beds</h4>
                                                        <span><%=po.getNumOfBeds()%></span>
                                                    </li>
                                                    <li>
                                                        <h4 class="card-info-title">Status</h4>
                                                        <span><%=po.getStatus()%></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->
                            <%}%>
                        </div>
                    </div>
                    <div class="propery-carousel-pagination carousel-pagination"></div>

                </div>
            </section><!-- End Latest Properties Section -->


            <!-- ======= Agents Section ======= -->
            <section class="section-agents section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Best Agents</h2>
                                </div>
                                <div class="title-link">
                                    <a href="agents-grid.jsp">All Agents
                                        <span class="bi bi-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="assets/img/agent-4.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="agent-single.jsp" class="link-two">Margaret Sotillo
                                                    <br> Escala</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Phone: </strong> +54 356 945234
                                            </p>
                                            <p>
                                                <strong>Email: </strong> agents@example.com
                                            </p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
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
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="assets/img/agent-1.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="agent-single.jsp" class="link-two">Stiven Spilver
                                                    <br> Darw</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Phone: </strong> +54 356 945234
                                            </p>
                                            <p>
                                                <strong>Email: </strong> agents@example.com
                                            </p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
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
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="assets/img/agent-5.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="agent-single.jsp" class="link-two">Emma Toledo
                                                    <br> Cascada</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Phone: </strong> +54 356 945234
                                            </p>
                                            <p>
                                                <strong>Email: </strong> agents@example.com
                                            </p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
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
            </section><!-- End Agents Section -->

            <!-- ======= Latest News Section ======= -->
            <section class="section-news section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Latest News</h2>
                                </div>
                                <div class="title-link">
                                    <a href="blog-grid.jsp">All News
                                        <span class="bi bi-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="news-carousel" class="swiper">
                        <div class="swiper-wrapper">

                            <div class="carousel-item-c swiper-slide">
                                <div class="card-box-b card-shadow news-box">
                                    <div class="img-box-b">
                                        <img src="assets/img/post-2.jpg" alt="" class="img-b img-fluid">
                                    </div>
                                    <div class="card-overlay">
                                        <div class="card-header-b">
                                            <div class="card-category-b">
                                                <a href="#" class="category-b">House</a>
                                            </div>
                                            <div class="card-title-b">
                                                <h2 class="title-2">
                                                    <a href="blog-single.jsp">House is comming
                                                        <br> new</a>
                                                </h2>
                                            </div>
                                            <div class="card-date">
                                                <span class="date-b">18 Sep. 2017</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                            <div class="carousel-item-c swiper-slide">
                                <div class="card-box-b card-shadow news-box">
                                    <div class="img-box-b">
                                        <img src="assets/img/post-5.jpg" alt="" class="img-b img-fluid">
                                    </div>
                                    <div class="card-overlay">
                                        <div class="card-header-b">
                                            <div class="card-category-b">
                                                <a href="#" class="category-b">Travel</a>
                                            </div>
                                            <div class="card-title-b">
                                                <h2 class="title-2">
                                                    <a href="blog-single.jsp">Travel is comming
                                                        <br> new</a>
                                                </h2>
                                            </div>
                                            <div class="card-date">
                                                <span class="date-b">18 Sep. 2017</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                            <div class="carousel-item-c swiper-slide">
                                <div class="card-box-b card-shadow news-box">
                                    <div class="img-box-b">
                                        <img src="assets/img/post-7.jpg" alt="" class="img-b img-fluid">
                                    </div>
                                    <div class="card-overlay">
                                        <div class="card-header-b">
                                            <div class="card-category-b">
                                                <a href="#" class="category-b">Park</a>
                                            </div>
                                            <div class="card-title-b">
                                                <h2 class="title-2">
                                                    <a href="blog-single.jsp">Park is comming
                                                        <br> new</a>
                                                </h2>
                                            </div>
                                            <div class="card-date">
                                                <span class="date-b">18 Sep. 2017</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                            <div class="carousel-item-c swiper-slide">
                                <div class="card-box-b card-shadow news-box">
                                    <div class="img-box-b">
                                        <img src="assets/img/post-3.jpg" alt="" class="img-b img-fluid">
                                    </div>
                                    <div class="card-overlay">
                                        <div class="card-header-b">
                                            <div class="card-category-b">
                                                <a href="#" class="category-b">Travel</a>
                                            </div>
                                            <div class="card-title-b">
                                                <h2 class="title-2">
                                                    <a href="#">Travel is comming
                                                        <br> new</a>
                                                </h2>
                                            </div>
                                            <div class="card-date">
                                                <span class="date-b">18 Sep. 2017</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                        </div>
                    </div>

                    <div class="news-carousel-pagination carousel-pagination"></div>
                </div>
            </section><!-- End Latest News Section -->

            <!-- ======= Testimonials Section ======= -->
            <section class="section-testimonials section-t8 nav-arrow-a">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Testimonials</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="testimonial-carousel" class="swiper">
                        <div class="swiper-wrapper">

                            <div class="carousel-item-a swiper-slide">
                                <div class="testimonials-box">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="testimonial-img">
                                                <img src="assets/img/testimonial-1.jpg" alt="" class="img-fluid">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="testimonial-ico">
                                                <i class="bi bi-chat-quote-fill"></i>
                                            </div>
                                            <div class="testimonials-content">
                                                <p class="testimonial-text">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, cupiditate ea nam
                                                    praesentium
                                                    debitis hic ber quibusdam
                                                    voluptatibus officia expedita corpori.
                                                </p>
                                            </div>
                                            <div class="testimonial-author-box">
                                                <img src="assets/img/mini-testimonial-1.jpg" alt="" class="testimonial-avatar">
                                                <h5 class="testimonial-author">Albert & Erika</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                            <div class="carousel-item-a swiper-slide">
                                <div class="testimonials-box">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="testimonial-img">
                                                <img src="assets/img/testimonial-2.jpg" alt="" class="img-fluid">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="testimonial-ico">
                                                <i class="bi bi-chat-quote-fill"></i>
                                            </div>
                                            <div class="testimonials-content">
                                                <p class="testimonial-text">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, cupiditate ea nam
                                                    praesentium
                                                    debitis hic ber quibusdam
                                                    voluptatibus officia expedita corpori.
                                                </p>
                                            </div>
                                            <div class="testimonial-author-box">
                                                <img src="assets/img/mini-testimonial-2.jpg" alt="" class="testimonial-avatar">
                                                <h5 class="testimonial-author">Pablo & Emma</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End carousel item -->

                        </div>
                    </div>
                    <div class="testimonial-carousel-pagination carousel-pagination"></div>

                </div>
            </section><!-- End Testimonials Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <section class="section-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-4">
                        <div class="widget-a">
                            <div class="w-header-a">
                                <h3 class="w-title-a text-brand">Rental House Group 1</h3>
                            </div>
                            <div class="w-body-a">
                                <p class="w-text-a color-text-a">
                                    Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo
                                    consequat
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
                                    <a href="#">Property</a>
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
                                <span class="color-a">Rental House Group 1</span> All Rights Reserved.
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