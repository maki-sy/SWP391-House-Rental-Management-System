<%@ page import="model.Users" %>
<%
    Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
%> 

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
                                    <option>Unlimite</option>
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
                                    <option>Unlimite</option>
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

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>

        <!-- End Header/Navbar -->
        <main id="main">
            <section class="section-news section-t3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="wrapper">
                                <div class="logo">
                                    <img src="./assets/img/login.png"></img>
                                </div>
                                <div class="text-center mt-4 name">
                                    Log in
                                </div>
                                <%if(request.getAttribute("errorMsg") !=null) { %>
                                <br>
                                <div class="alert alert-danger" role="alert">
                                    <%= (String)request.getAttribute("errorMsg") %>
                                </div>
                                <% } %>
                                <form class="p-3 mt-3 login-form" action="login" method="POST">
                                    <div class="form-field d-flex align-items-center">
                                        <span class="far fa-user"></span>
                                        <input type="email" name="email" id="email" placeholder="Email" required>
                                    </div>
                                    <div class="form-field d-flex align-items-center">
                                        <span class="fas fa-key"></span>
                                        <input type="password" name="password" id="pwd" placeholder="Password" required minlength="6">
                                    </div>
                                    <!-- Them phan chon role -->
                                    <div class="role form-group">
                                        <select class="form-field d-flex align-items-center form-control" id="role" name="role" required>
                                            <span class="fas fa-user"></span>
                                            <option value="" disabled selected>Select role</option>
                                            <option value="1">Tenant</option>
                                            <option value="2">Landlord</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="type" value="login">
                                    <button class="btn mt-3" id="loginBtn">Login</button>
                                </form>
                                <div class="text-center fs-6">
                                    <a href="recover?service=forgotForm">Forget password?</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 wrapper">
                            <div class="logo">
                                <img src="./assets/img/register.png" alt="">
                            </div>
                            <div class="text-center mt-4 name">
                                Create new account
                            </div>

                            <%if(request.getAttribute("registerError") != null) { %>
                            <br>
                            <div class="alert alert-danger" role="alert">
                                <%= (String)request.getAttribute("registerError") %>
                            </div>
                            <% } %>

                            <form class="p-3 mt-3 register-form" method="POST" action="login">
                                <div class="form-field d-flex align-items-center">
                                    <span class="far fa-user"></span>
                                    <input type="text" name="first-name" id="first-name" placeholder="First name" required>
                                </div>
                                <div class="form-field d-flex align-items-center">
                                    <span class="far fa-user"></span>
                                    <input type="text" name="last-name" id="last-name" placeholder="Last name" required>
                                </div>
                                <div class="form-field d-flex align-items-center">
                                    <span class="far fa-user"></span>
                                    <input type="email" name="email" id="email" placeholder="Email" required>
                                </div>
                                <div class="form-field d-flex align-items-center">
                                    <span class="fas fa-key"></span>
                                    <input type="number" name="phone-number" id="phone-number" placeholder="Phone number" required>
                                </div>
                                <div class="form-field d-flex align-items-center">
                                    <span class="far fa-user"></span>
                                    <input type="password" name="password" id="password" placeholder="Password" required>
                                </div>
                                <div class="form-field d-flex align-items-center">
                                    <span class="far fa-user"></span>
                                    <input type="password" name="re-password" id="re-password" placeholder="Re-Password" required>
                                </div>
                                <!-- Them phan chon role -->
                                <div class="role form-group">
                                    <select class="form-field d-flex align-items-center form-control" id="role" name="role" required>
                                        <span class="far fa-user"></span>
                                        <option value="" disabled selected>Select the role you are interested in...
                                        </option>
                                        <option value="Tenant">Tenant</option>
                                        <option value="Landlord">Landlord</option>
                                    </select>
                                </div>

                                <button class="btn mt-3" id="registerBtn">Register</button>

                                <input type="hidden" name="type" value="register">
                            </form>

                        </div>
                    </div>
                </div>
                </div>
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

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Validator.js for validating password -->
        <script type="text/javascript" src="https://unpkg.com/validator@latest/validator.min.js"></script>

        <!-- Validate password -->
        <script type="text/javascript">

            let password = document.getElementById("pwd"); // password input field in login form
            let registerPwd = document.getElementById("password"); // password input field in register form
            let retypePwd = document.getElementById("re-password");

            let options = {
                minLength: 6,
                minLowercase: 1,
                minUppercase: 1,
                minSymbols: 1
            }

            // add eventHandler
            password.addEventListener("input", checkValidPassword);
            registerPwd.addEventListener("input", checkRegisterPassword)
            retypePwd.addEventListener("input", checkRetypeMatch);

            // check login password
            function checkValidPassword() {

                let loginValidPwd = validator.isStrongPassword(password.value, options);
                if (!loginValidPwd) { // password does not valid
                    password.setCustomValidity("Password does not valid. It must at least 6 characters long, 1 lowercase, 1 uppercase and 1 special symbols");
                    password.reportValidity();
                } else {
                    password.setCustomValidity(""); // set validity to empty so that form can be submitted
                }
            }

            function checkRegisterPassword() {
                let registerValidPwd = validator.isStrongPassword(registerPwd.value, options);
                if (registerValidPwd) {
                    registerPwd.setCustomValidity("");
                } else {
                    registerPwd.setCustomValidity("Password does not valid. It must at least 6 characters long, 1 lowercase, 1 uppercase and 1 special symbols");
                    registerPwd.reportValidity();
                }
            }

            function checkRetypeMatch() {
                if (registerPwd.value !== retypePwd.value) {
                    retypePwd.setCustomValidity("Password does not match");
                    retypePwd.reportValidity();
                } else {
                    retypePwd.setCustomValidity("");
                }
            }

        </script>
    </body>

</html>