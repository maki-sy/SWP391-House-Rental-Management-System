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
        <style>
            .intro-title a {
                color: white; /* Thay đổi màu chữ thành đỏ (#ff0000) */
                text-decoration: none; /* Loại bỏ gạch chân dưới văn bản */
            }
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
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->

        <%
        List<PostRental> highest = (List<PostRental>) request.getAttribute("highestPost");
        List<String> thumbnailsHighest = (List<String>) request.getAttribute("thumbnailsHighest");
        
        ArrayList<Integer> saleListHighest = (ArrayList<Integer>) request.getAttribute("saleListHighest");
        %>
        <!-- ======= Intro Section ======= -->
        <div class="intro intro-carousel swiper position-relative">

            <div class="swiper-wrapper">
                <%for(int i =0; i< highest.size();i++){%>
                <div class="swiper-slide carousel-item-a intro-item bg-image"
                     style="background-image: url('<%=thumbnailsHighest.get(i)%>')">
                    <div class="overlay overlay-a"></div>
                    <div class="intro-content display-table">
                        <div class="table-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="intro-body">
                                            <h1 class="intro-title mb-4">
                                                <a href="housedetail?id=<%=highest.get(i).getId()%>"><%=highest.get(i).getName()%></a>
                                                <br>
                                            </h1>
                                            <h1 class="intro-title mb-4" style="font-size: 50px;">
                                                <br> <%=highest.get(i).getAddress()%>
                                            </h1>
                                            <% if (saleListHighest.get(i) == 0) { %>
                                                <p class="intro-subtitle intro-price">
                                                    <span class="price-a">rent | $ <%=String.format("%.1f", highest.get(i).getPrice())%></span>
                                                </p>
                                                <% } else if (saleListHighest.get(i) < 100) { %>
                                                <p class="intro-subtitle intro-price">
                                                    <span class="price-a">
                                                        <span>rent | $</span>
                                                        <span class="text-decoration-line-through"><%=String.format("%.1f", highest.get(i).getPrice())%></span>
                                                    </span>
                                                </p>
                                                <p class="intro-subtitle intro-price">
                                                    <span class="price-a">For Sale | $ <%=String.format("%.1f", highest.get(i).getPrice() - (highest.get(i).getPrice() * saleListHighest.get(i) / 100))%></span>
                                                </p>
                                                <% } else { %>
                                                <p class="intro-subtitle intro-price">
                                                    <span class="price-a">
                                                        <span>rent | $</span>
                                                        <span class="text-decoration-line-through"><%=String.format("%.1f", highest.get(i).getPrice())%></span>
                                                    </span>
                                                </p>
                                                <p class="intro-subtitle intro-price">
                                                    <span class="price-a">For Sale | $ Free</span>
                                                </p>
                                                <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
                <%
                    if (thumbnailsHighest.isEmpty()) { 
                %>
                <div class="img-box-a">
                    <img src="https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg" alt="" class="img-a img-fluid">
                </div>
                <% } %>
            </div>
        </div><!-- End Intro Section -->
        <div class="swiper-pagination"></div>



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
                                        Hệ thống chúng tôi kết nối người thuê nhà với các lựa chọn trọ đa dạng và thuận tiện. Tạo cuộc sống trọn vẹn cho bạn.
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
                                        Chúng tôi cung cấp các dịch vụ thuê nhà linh hoạt để đáp ứng nhu cầu của bạn.
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
                                        Kết nối chủ nhà và người thuê một cách hiệu quả. Đảm bảo giao dịch cho thuê suôn sẻ.
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
List<String> thumbnailsLast = (List<String>) request.getAttribute("thumbnailsLast");
ArrayList<Integer> saleListLastest = (ArrayList<Integer>) request.getAttribute("saleListLastest");
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
                            <% for (int i = 0; i < list.size(); i++) { %>
                            <div class="carousel-item-b swiper-slide">
                                <div class="card-box-a card-shadow">
                                    <div class="img-box-a">
                                        <img src="<%=thumbnailsLast.get(i)%>" alt="" class="img-a img-fluid">
                                    </div>

                                    <div class="card-overlay">
                                        <div class="card-overlay-a-content">
                                            <div class="card-header-a">
                                                <h2 class="card-title-a">
                                                    <a href="housedetail?id=<%=list.get(i).getId()%>"><% String name = list.get(i).getName();
                                                int maxCharacters = 15;
                                                if (name.length() > maxCharacters) {
                                                name = name.substring(0, maxCharacters) + "..."
                                                ;}%>
                                                        <%= name %></a>
                                                </h2>
                                            </div>
                                            <div class="card-body-a">
                                                <% if (saleListLastest.get(i) == 0) { %>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">rent | $ <%=String.format("%.1f", list.get(i).getPrice())%></span>
                                                </div>
                                                <% } else if (saleListLastest.get(i) < 100) { %>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">
                                                        <span>rent | $</span>
                                                        <span class="text-decoration-line-through"><%=String.format("%.1f", list.get(i).getPrice())%></span>
                                                    </span>
                                                </div>
                                                <div class="price-box d-flex">
                                                    <span class="price-a">For Sale | $ <%=String.format("%.1f", list.get(i).getPrice() - (list.get(i).getPrice() * saleListLastest.get(i) / 100))%></span>
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
                            </div><!-- End carousel item -->
                            <% } %>
                        </div>
                    </div>
                    <div class="propery-carousel-pagination carousel-pagination"></div>
                </div>
            </section><!-- End Latest Properties Section -->


            <!-- ======= Testimonials Section ======= -->
            <section class="section-testimonials section-t8 nav-arrow-a">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Comment</h2>
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
                                                <img src="https://binhminhdigital.com/StoreData/PageData/2372/nhung-loi-co-ban-khi-chup-anh-phong-canh%20(5).jpg" alt="" class="img-fluid">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="testimonial-ico">
                                                <i class="bi bi-chat-quote-fill"></i>
                                            </div>
                                            <div class="testimonials-content">
                                                <p class="testimonial-text">
                                                    "Hệ thống cho thuê trọ là người bạn đồng hành tin cậy khi bạn tìm kiếm ngôi nhà trọ lý tưởng. Với sự đa dạng và thuận tiện, bạn có thể tìm được căn nhà trọ hoàn hảo cho nhu cầu của mình. Hãy khám phá ngay!"
                                                </p>
                                            </div>
                                            <div class="testimonial-author-box">
                                                <img src="https://cdn4.iconfinder.com/data/icons/diversity-v2-0-volume-03/64/superhero-deadpool-comics-512.png" alt="" class="testimonial-avatar">
                                                <h5 class="testimonial-author">Tuấn Anh</h5>
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