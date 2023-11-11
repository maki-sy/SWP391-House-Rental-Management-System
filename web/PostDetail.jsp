<%-- 
    Document   : PostDetail
    Created on : Sep 23, 2023, 6:54:48 AM
    Author     : Tuấn Anh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
<%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>

<%@ page import="model.Users, service.PostService, service.WishlistService, service.OrderService,service.UserService" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
    PostService pService = new PostService();
    WishlistService wService = new WishlistService();
    OrderService oService = new OrderService();
    UserService uService = new UserService();
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>House Details</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
            *{
                margin: 0;
                padding: 0;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;

            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;

            }
            .checked {
                color: orange;
            }
            .form-control-borderless {
                border: none;
            }

            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }

            .heart-button {
                background: none;
                border: none;
                padding: 0;
                cursor: pointer;
            }
            .inputtag{
                width: 100%; /* Full width */
                padding: 12px; /* Some padding */
                border: 1px solid #ccc; /* Gray border */
                border-radius: 4px; /* Rounded borders */
                box-sizing: border-box; /* Make sure that padding and width stays in place */
                margin-top: 6px; /* Add a top margin */
                margin-bottom: 16px; /* Bottom margin */
                resize: vertical; /* Allow the user to vertically resize the textarea (not horizontally) */
                color: green;
                font-size: larger;
            }
            .inputtaghalf{
                width: 30%; /* Full width */
                padding: 12px; /* Some padding */
                border: 1px solid #ccc; /* Gray border */
                border-radius: 4px; /* Rounded borders */
                box-sizing: border-box; /* Make sure that padding and width stays in place */
                margin-top: 6px; /* Add a top margin */
                margin-bottom: 16px; /* Bottom margin */
                resize: vertical; /* Allow the user to vertically resize the textarea (not horizontally) */
                color: green;
                font-size: larger;
            }
        </style>
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
        </div><!-- End Property Search Section -->>

        <!-- ======= Header/Navbar ======= -->
        <!-- Header cho khách (guest) -->
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->
        <%
            PostRental post = (PostRental) request.getAttribute("PostDetail");
            ArrayList<String> thumbnailList = (ArrayList<String>) request.getAttribute("thumbnailList");
            String location_name = (String) request.getAttribute("location_name"); 
            String postSale = (String) request.getAttribute("postSale"); 
            String thumbnail = pService.getImageThumbailsByPostID(post.getId());
            
        %>


        <main id="main">
            <!-- ======= Intro Single ======= -->
            <section class="intro-single">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="title-single-box">
                                <!--Wishlist-->

                                <div style="display: flex; gap: 20px">
                                    <h1 class="title-single"><%=post.getName()%></h1>
                                    <%if(user != null && user.getRoleID()==1){
                                          if(wService.checkExist(user.getId(),post.getId())){
                                    %>
                                    <form action="wishlist?service=deleteheart" method="POST">
                                        <input type="hidden" name="postId" value="<%= post.getId() %>">
                                        <input type="hidden" name="userId" value="<%= user.getId() %>">
                                        <button type="submit" class="heart-button">
                                            <i class="fa fa-heart" onclick="submitWishlist()" style="color:pink;font-size:35px;padding-top: 6px" aria-hidden="true"></i>
                                        </button>
                                    </form>

                                    <%} else{%>
                                    <a href="wishlist?service=add&id=<%= post.getId() %>"><i class="far fa-heart"  onclick="submitWishlist()" style="color:pink;font-size:35px;padding-top: 6px"></i></a>
                                        <%}
                            }%>
                                </div>
                                <!--Wishlist-->
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
                                        <a href="Post">Properties</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <%=post.getName()%>
                                    </li>
                                </ol>
                            </nav>                          
                        </div>
                        <%if(user != null && user.getRoleID()==1){%>
                        <a href="ReportCenter?type=post&postid=<%=post.getId()%>"><i class='fas fa-exclamation-triangle' style='font-size:28px;color:yellow'></i></a>
                            <%}%>
                    </div>
                </div>
            </section><!-- End Intro Single-->

            <!-- ======= Property Single ======= -->
            <section class="property-single nav-arrow-b">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div id="property-single-carousel" class="swiper">
                                <div class="swiper-wrapper">
                                    <%for(String imageUrl : thumbnailList){%>
                                    <div class="carousel-item-b swiper-slide">
                                        <img src="<%=imageUrl%>" alt="" class="img-fluid">
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <div class="property-single-carousel-pagination carousel-pagination"></div>
                        </div>
                        <div class="col-md-6">
                            <div class="property-price foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico"style="border-radius:20px">
                                        <span class="bi bi-cash" style="color: green"></span>
                                        <span style="font-size:50px">$<%= (postSale.equals("Free")) ? postSale : String.format("%.1f", Double.parseDouble(postSale)) %></span>
                                    </div>
                                    <!--ORDER FORM    !!!-->
                                    <div style="margin-top:8%;">
                                        <% if(user != null && user.getRoleID() == 1){ %>
                                        <%if(oService.isOrdered(user.getId(), post.getId())==1){%>
                                        <button class="btn btn-primary" style="padding:20px;background: gray; margin-left: 100px" readonly>Ordered <i class="fas fa-home"></i></button>
                                            <%} else if(oService.isOrdered(user.getId(), post.getId())==2){%>
                                        <button class="btn btn-primary" style="padding:20px;background: gray; margin-left: 100px" readonly>Pending... <i class="fas fa-home"></i></button>
                                            <%}else{%>                                    
                                        <a><button style="padding:20px;margin-left: 100px" class="btn btn-primary" onclick="openForm()">Order <i class="fas fa-home"></i></button></a>
                                                <%}%>
                                    </div>
                                    <div id="myForm" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4);">
                                        <div style="background-color: #fefefe; margin: 15% auto; padding: 20px; border: 3px solid #888; width: 65%;">
                                            <form action="order" method="POST" style="display: flex; flex-direction: column; align-items: center;">                                               
                                                <h1 style="text-align: center; font-family: cursive; margin-bottom: 40px">Order for: <%=post.getName()%></h1>    
                                                <div style="display:flex">
                                                    <div style="margin-right: 100px">
                                                        <img src="<%=thumbnail%>" alt="" class="img-a img-fluid img-thumbnail" style="overflow-clip-margin: content-box; overflow: clip;">
                                                    </div>
                                                    <div style="display: block; font-size: 20px;">
                                                        <div>
                                                            <label>First Name:</label>
                                                            <input class="inputtaghalf" value="<%=uService.getFirstName(user.getId())%>" readonly disabled>
                                                            <label>Last Name:</label>
                                                            <input class="inputtaghalf" value="<%=uService.getLastName(user.getId())%>" readonly disabled>
                                                        </div>
                                                        <div>
                                                            <label for="email">Email:</label>
                                                            <input class="inputtag" value="<%=user.getEmail()%>" readonly disabled>
                                                        </div>
                                                        <div>
                                                            <label>Sent:</label>
                                                        </div>
                                                        <p style="display: none" id="datetime"></p>
                                                        <input class="inputtag" type="text" id="datetimeInput" readonly>


                                                        <script>
                                                            var dt = new Date();
                                                            document.getElementById("datetime").innerHTML = dt.toLocaleString();
                                                            document.getElementById("datetimeInput").value = dt.toLocaleString();
                                                        </script>
                                                        <div>
                                                            <label for="rentcost">Rent: $</label>
                                                            <input class="inputtag" type="number" value="<%= (postSale.equals("Free")) ? postSale : String.format("%.1f", Double.parseDouble(postSale)) %>" readonly disabled>
                                                        </div>
                                                        <div>
                                                            <label for="landlordname">Landlord:</label>
                                                            <input class="inputtag" type="text" value="<%=oService.getLandlordFullName(post.getLandlord_id())%>" readonly disabled>
                                                        </div>
                                                        <div>
                                                            <i class='fas fa-exclamation-triangle' style="color: yellow"></i>
                                                        </div>
                                                        <div>
                                                            <p style="font-size:smaller;color:green">By submitting this form, the landlord can get access to your personal information. You can contact the landlord only when your order has been approved.</p>
                                                        </div>
                                                            
                                                        <input type="hidden" name="postid" value="<%=post.getId()%>">
                                                    </div>
                                                </div>
                                                <div style="margin-top:20px">
                                                    <button class="btn btn-primary" type="submit" onclick="submitOrder(); closeForm()">Send Order</button>
                                                    <input type="hidden" name="service" value="createOrder">
                                                    <button class="btn btn-primary"type="button" onclick="closeForm()">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <%} else if(user == null){%>
                                    <div style="">                                        
                                        <a href="login"><button style="margin-left: 120px;padding: 20px" class="btn btn-primary">Order <i class="fas fa-home"></i></button></a>    
                                    </div>
                                    <%}%>
                                </div>


                            </div>
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
                                        <strong>Address:</strong>
                                        <span><%=post.getAddress()%></span>
                                    </li>
                                    <li class="d-flex justify-content-between">
                                        <strong>Location:</strong>
                                        <span><%=location_name%></span>
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


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row justify-content-between" style="margin-top:5%">
                                <div class="col-md-12 col-lg-12 section-md-t3 text-center">
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
                                    </div>
                                </div>
                                <div class="col-md-5 col-lg-4">






                                    <div class="property-summary">                                      
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="title-box-d section-t4">
                                                    <h3 class="title-d">Comment</h3>
                                                </div>
                                            </div>
                                            <c:if test="${sessionScope.user!=null&&sessionScope.user.roleID==1}">
                                                <form action="ReviewManage?id=<%=post.getId()%>" method="Post"> 
                                                    <!--                                                Chi cho tenant review-->
                                                    <div class="rate">  
                                                        <input type="radio" id="star5" name="rate" value="5"style="visibility: hidden" />
                                                        <label for="star5" title="text">5 stars</label>
                                                        <input type="radio" id="star4" name="rate" value="4"style="visibility: hidden" />
                                                        <label for="star4" title="text">4 stars</label>
                                                        <input type="radio" id="star3" name="rate" value="3"style="visibility: hidden" />
                                                        <label for="star3" title="text">3 stars</label>
                                                        <input type="radio" id="star2" name="rate" value="2"style="visibility: hidden" />
                                                        <label for="star2" title="text">2 stars</label>
                                                        <input type="radio" id="star1" name="rate" value="1" style="visibility: hidden" />
                                                        <label for="star1" title="text">1 star</label>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div style="border: solid;border-radius:10px ">
                                                        <input name="comment" type="text" placeholder="Add your thought" class="text-center form-control-borderless"
                                                               style="width: 250px;height: 50px;border-radius:15px ">
                                                        <button type="submit" class="btn btn-primary" style="background-color: #2eca6a">Submit</button>
                                                    </div>
                                                </c:if>
                                                <p class="text-danger">${mess}</p>
                                                <div class="row">
                                                    <c:forEach items="${listr}" var="o">
                                                        <div class="col-sm-12">
                                                            <div class="testimonials-content">
                                                                <p class="testimonial-text" style="width: 1000px">
                                                                    ${o.address}
                                                                </p>
                                                            </div>
                                                            <div class="testimonial-author-box">
                                                                <h5 class="testimonial-author"> ${o.id} ⭐ by ${o.lastName} ${o.firstName}  on ${o.civilID}</h5>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </section><!-- End Property Single-->

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
        <script>
                                                        function openForm() {
                                                            document.getElementById("myForm").style.display = "block";
                                                        }
                                                        function closeForm() {
                                                            document.getElementById("myForm").style.display = "none";
                                                        }
                                                        function submitOrder() {
                                                            alert("Order has been successfully submitted to the landlord.");
                                                        }
                                                        function submitWishlist() {
                                                            alert("The post is now in your wishlist.");
                                                        }
        </script>

    </body>

</html>
