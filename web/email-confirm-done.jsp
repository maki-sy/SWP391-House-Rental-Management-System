<%@ page import="model.Users" %>

<%
    boolean verified = request.getAttribute("verified") == null ? false : (boolean)request.getAttribute("verified");
    Users user = (Users)session.getAttribute("user");
%>
<!<!-- Email verification page. User navigate to this page when click the Confirmation link with token in the email -->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Login | Rental House</title>
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
        <link rel="stylesheet" href="./assets/css/login-style.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
              integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
              integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="./assets/css/register-style.css">
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
                <form class="form-a">
                    <div class="row">
                        <div class="col-md-12 mb-2">
                            <div class="form-group">
                                <label class="pb-2" for="Type">Keyword</label>
                                <input type="text" class="form-control form-control-lg form-control-a"
                                       placeholder="Keyword">
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="Type">Type</label>
                                <select class="form-control form-select form-control-a" id="Type">
                                    <option>All Type</option>
                                    <option>For Rent</option>
                                    <option>For Sale</option>
                                    <option>Open House</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="city">City</label>
                                <select class="form-control form-select form-control-a" id="city">
                                    <option>All City</option>
                                    <option>Alabama</option>
                                    <option>Arizona</option>
                                    <option>California</option>
                                    <option>Colorado</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="bedrooms">Bedrooms</label>
                                <select class="form-control form-select form-control-a" id="bedrooms">
                                    <option>Any</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="bathrooms">Bathrooms</label>
                                <select class="form-control form-select form-control-a" id="bathrooms">
                                    <option>Any</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Min Price</label>
                                <select class="form-control form-select form-control-a" id="price">
                                    <option>Unlimited</option>
                                    <option>$50,000</option>
                                    <option>$100,000</option>
                                    <option>$150,000</option>
                                    <option>$200,000</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Max price</label>
                                <select class="form-control form-select form-control-a" id="price">
                                    <option>Unlimited</option>
                                    <option>$50,000</option>
                                    <option>$100,000</option>
                                    <option>$150,000</option>
                                    <option>$200,000</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-b">Search Property</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Property Search Section -->>

        <%@include file="header.jsp" %>


        <!-- End Header/Navbar -->
        <main id="main">
            <div class="vh-100 d-flex justify-content-center align-items-center">
                <div class="card col-md-4 bg-white shadow-md p-5">
                    <div class="mb-4 text-center">
                        <% if(verified) { %>
                        <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                             fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                        <path
                            d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                        </svg>
                        <% } else { %>
                        <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                        </svg>
                        <% } %>
                    </div>
                    <% if(verified) { %>
                    <div class="text-center">
                        <h1>Welcome to us!</h1>
                        <p>Your email has been confirmed. Wish you have the best time on the journey</p>
                        <a href="trang-chu"><button class="btn btn-outline-success">Back Home</button></a>
                    </div>
                    <% } else { %>
                    <div class="text-center">
                        <h1>Sorry are you lost the way?</h1>
                        <p>The link you followed has been wrong, or the token has been expired</p>
                        <a href="trang-chu"><button class="btn btn-outline-success">Back Home</button></a>
                    </div>
                    <% } %>
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

                    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                    </body>

                    </html>