<!-- JSP Import -->
<%@page import="model.Users" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Orders" %>
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
            ArrayList<Orders>
            ordersList = (ArrayList<Orders>)request.getAttribute("ordersList");
                Integer balance = (Integer)session.getAttribute("accountBalance");
                Integer postId = (Integer)request.getAttribute("postId");
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
                                    <li class="breadcrumb-item"><a href="#">Add New Post</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Pay For Post</li>
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
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Basic--</span><span>
                                                The premium plan combines post
                                                editing capabilities, information
                                                security, and paid post cost savings to give you
                                                flexibility, reliability, and
                                                efficiency.</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Standard--</span><span>
                                                The standard package with post
                                                editing capabilities for paid posts
                                                gives you the flexibility to update information
                                                and create continuous appeal for your
                                                posts.</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Premium--</span><span>
                                                The premium plan combines post
                                                editing capabilities, information
                                                security, and paid post cost savings to give you
                                                flexibility, reliability, and
                                                efficiency.</span></li>

                                    </ul>
                                </div>
                            </div>
                            <%@include file="L-service-sidebar.jsp" %>
                        </div>

                        <div class=" col-lg-8">
                            <div class="row">
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <div class="card h-100 shadow-lg">
                                        <div class="card-body">
                                            <div class="text-center p-3">
                                                <h5 class="card-title">Basic</h5>
                                                <small>You are a minimalist?</small>
                                                <br><br>
                                                <span class="h2">$13</span>/month
                                                <br><br>
                                            </div>

                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Personal information security</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> N/A</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> N/A</li>

                                        </ul>
                                        <div class="card-body text-center">
                                            <a href="javascript:void(0);"
                                               onclick="confirmBasic(<%=balance%>, <%=postId%>)">
                                                <button class="btn btn-outline-primary btn-lg"
                                                        style="border-radius:30px">Select</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <div class="card h-100 shadow-lg">
                                        <div class="card-body">
                                            <div class="text-center p-3">
                                                <h5 class="card-title">Standard</h5>
                                                <small>Edit as you like!</small>
                                                <br><br>
                                                <span class="h2">$32</span>/ 3 months
                                                <br><br>
                                            </div>

                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Personal information security</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Edit the article after posting</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Save up to 20% costs</li>
                                        </ul>
                                        <div class="card-body text-center">
                                            <a href="javascript:void(0);"
                                               onclick="confirmStandard(<%=balance%>, <%=postId%>)">
                                                <button class="btn btn-outline-primary btn-lg"
                                                        style="border-radius:30px">Select</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <div class="card h-100 shadow-lg">
                                        <div class="card-body">
                                            <div class="text-center p-3">
                                                <h5 class="card-title">Premium</h5>
                                                <small>Are you a smart consumer?</small>
                                                <br><br>
                                                <span class="h2">$48</span>/ 6 months
                                                <br><br>
                                            </div>

                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Personal information security</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Edit the article after posting</li>
                                            <li class="list-group-item"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-check" viewBox="0 0 16 16">
                                                <path
                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
                                                </svg> Save up to 40% costs</li>
                                        </ul>
                                        <div class="card-body text-center">
                                            <a href="javascript:void(0);"
                                               onclick="confirmPremium(<%=balance%>, <%=postId%>)">
                                                <button class="btn btn-outline-primary btn-lg"
                                                        style="border-radius:30px">Select</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="balanceProblem alert alert-danger text-center"
                                 style="display: none" role="alert">
                                Your account balance is currently insufficient, please choose
                                another package, or contact us to add more points.
                            </div>
                            <a href="landlordServicesPage?service=edit-posts"><button
                                    type="button" class="w-100 btn btn-warning">Cancel and pay
                                    later</button></a>
                        </div>
                        </section>
                        </main>

                        <!-- ======= Footer ======= -->
                        <%@include file="footer.jsp" %>
                        <!-- End  Footer -->

                        <div id="preloader"></div>
                        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                                class="bi bi-arrow-up-short"></i></a>

                        <!-- Handle Javascript -->
                        <script src="assets/js/pay_for_post.js"></script>

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