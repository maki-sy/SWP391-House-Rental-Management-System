<!-- JSP Import -->
<%@page import="model.Users" %>
<%@page import="model.Orders, model.Tenant" %>
<% Users user=session.getAttribute("user")==null ? null : (Users)session.getAttribute("user"); %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Payment | RentalHouse</title>
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
        <!-- ======= JSP ======= -->
        <% String role=session.getAttribute("role")==null ? null : (String) session.getAttribute("role");
            Object loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user");
                Integer balance = (Integer)session.getAttribute("accountBalance");
                Tenant tenant = (Tenant)request.getAttribute("tenant");
        %>
        <!-- End JSP Code -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>

        <!-- End Header/Navbar -->

        <main id="main" style="margin-top: 3rem">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Manage Service</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Contact</li>
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
                                            aria-current="true">Choose preferential packages
                                        </li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=balance%>
                                        </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <%@include file="L-service-sidebar.jsp" %>
                        </div>

                        <div class=" col-lg-8">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="card mb-4">
                                        <a href="ReportCenter?type=user&tenantid=<%=tenant.getId()%>">
                                            <i class='fas fa-exclamation-triangle' style='font-size:28px;color:yellow'></i>
                                        </a>
                                        <div class="card-body text-center">
                                            <img src=<%=request.getAttribute("tenantAvatarURL")%> alt="avatar"
                                                 class="rounded-circle img-fluid" style="width: 150px;">
                                            <h5 class="my-3"><%=tenant.getFirstName()%> <%=tenant.getLastName()%></h5>
                                            <p class="text-muted mb-1">Please contact me when you can</p>
                                            <div class="d-flex justify-content-center mb-2">
                                                <button type="button" class="w-100 btn btn-warning"><a href="tel:<%=tenant.getPhone()%>">
                                                        <ion-icon name="call-outline"></ion-icon>
                                                    </a></button>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-7">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <p class="mb-0">Full Name</p>
                                                </div>
                                                <div class="col-sm-9">
                                                    <p class="text-muted mb-0"><%=tenant.getFirstName()%> <%=tenant.getLastName()%></p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <p class="mb-0">Email</p>
                                                </div>
                                                <div class="col-sm-9">
                                                    <p class="text-muted mb-0"><%=request.getAttribute("tenantEmail")%> </p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <p class="mb-0">Phone</p>
                                                </div>
                                                <div class="col-sm-9">
                                                    <p class="text-muted mb-0"><%=tenant.getPhone()%></p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <p class="mb-0">Address</p>
                                                </div>
                                                <div class="col-sm-9">
                                                    <p class="text-muted mb-0"><%=tenant.getAddress()%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
            </section>
        </main>

        <!-- ======= Footer ======= -->
        <%@include file="footer.jsp" %>
        <!-- End  Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>


        <!-- Vendor JS Files -->

        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

        <!-- Icon -->
        <script type="module"
        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule
        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    </body>

</html>