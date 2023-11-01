<%-- 
    Document   : AddPromotionForm
    Created on : Sep 26, 2023, 9:11:16 AM
    Author     : Administrator
--%>
<%@ page import="model.Users" %>
<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Promotion Creation | RentalHouse</title>
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
        <link href="assets/css/customer-card.css" rel="stylesheet">

    </head>
    <body>
        <%@include file="header.jsp" %>
        <main id="main" style="margin-top: 3rem">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Manage Service</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Add new Promotion</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="./assets/img/setting.png" alt="avatar"
                                         class="img-fluid" style="width: 150px;">
                                    <div class="mb-3"></div>
                                    <ul class="list-group text-start">
                                        <li class="text-start list-group-item active list-group-item-action"
                                            aria-current="true">Add new promotion</li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=session.getAttribute("accountBalance")%>
                                        </span>
                                        </li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Property
                                                --</span><span>
                                                The property will be applied promotion</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Discount
                                                price--</span><span>
                                                The percent discount on promotion</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Descriptions
                                                --</span><span>
                                                Information for the promotion</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Start date/ End date--</span><span>
                                                The date of the promotion</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- SIDE BAR HERE -->
                            <%@include file="L-service-sidebar.jsp" %>
                            <!-- END SIDE BAR -->

                        </div>
                        <div class="card col-lg-8">
                            <form id='form-1' method="post" action="AddPromotion?service=add">
                                <div class="form-group">
                                    <label >Chose property</label>
                                    <p class="text-danger">${mess}</p>
                                    <div class="form-check form-check-inline">
                                        <c:forEach items="${listp}" var="o">
                                            <div>
                                                <input type="checkbox" name="p" value="${o.id}" class="form-check-input"/>
                                                <label class="form-check-label">${o.name} </label><br>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label >Discount</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="discount" type="number" class="form-control" name="discount" placeholder="Enter your discount" required>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label >Descriptions</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                        <input id="des" type="text" class="form-control" name="desciptions" placeholder="Enter your descriptions"required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label >Promotion start date</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <input type="date" class="form-control" name="start_date"  placeholder="Enter your start date"required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label >Promotion end date</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <input type="date" class="form-control" name="end_date" placeholder="Enter your end date"required>
                                    </div>

                                </div>
                                <br>
                                <button type="submit" class="btn btn-success w-1 float-lg-end">SUBMIT</button>                           
                                <button type="reset" class="btn btn-warning w-1 float-lg-none" style="margin-left: 10px">RESET </button>
                                <a href="PromotionManage"><button type="button" class="float-lg-start btn btn-warning w-1" >CANCEL</button></a>
                            </form>
                        </div>
                    </div>
            </section>
        </main>

        <!-- ======= Footer ======= -->
        <%@include file="footer.jsp" %>
    </body>
</html>
