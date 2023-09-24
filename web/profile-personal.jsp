<!DOCTYPE html>
<html lang="en">

<head>
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
</head>

<body>
    <!-- ======= JSP ======= -->
    <% String role=session.getAttribute("role")==null ? null : (String) session.getAttribute("role"); Object
        loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user"); %>
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
        <!-- Header cho khach -->
        <% if(role==null) { %>
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
                                <a class="nav-link " href="property-grid.jsp">Houses</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="agents-grid.jsp">Landlords</a>
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
                        </ul>
                    </div>
                    <div class="nav-item btn" style="padding: 0.35rem 1rem;">
                        <a href="login?type=login">Login/Register</a>
                    </div>

                    <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
                        data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
                        <i class="bi bi-search"></i>
                    </button>

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
                                    <a class="nav-link " href="property-grid.jsp">Houses</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " href="agents-grid.jsp">Landlords</a>
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
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My
                                        profile</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item " href="./profile-personal.jsp">Manage services</a>
                                        <a class="dropdown-item " href="./profile-personal.jsp">Manage account</a>
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



                    <main id="main">
                        <section class="section-news section-t3">
                            <div class="container py-5">
                                <div class="row">
                                    <div class="col">
                                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">User</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card mb-4">
                                            <div class="card-body text-center">
                                                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" alt="avatar"
                                                    class="rounded-circle img-fluid" style="width: 150px;">
                                                <h5 class="my-3">John Smith</h5>
                                                <p class="text-muted mb-1">Full Stack Developer</p>
                                                <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                                <div class="d-flex justify-content-center mb-2">
                                                    <button type="button" class="btn btn-primary"
                                                        disabled>Landlord</button>
                                                    <button type="button" class="btn btn-outline-primary ms-1"
                                                        disabled>Very
                                                        possitive</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card mb-4 mb-lg-0">
                                            <div class="card-body p-0">
                                                <ul class="list-group list-group-flush rounded-3">
                                                    <li
                                                        class="list-group-item justify-content-between align-items-center">
                                                        <a href="#!"><button type="button" class="btn btn-primary">Edit
                                                                public
                                                                information</button></a>
                                                    </li>
                                                    <li
                                                        class="list-group-item justify-content-between align-items-center">
                                                        <a href="#!"><button type="button"
                                                                class="btn btn-primary">Change
                                                                password</button></a>
                                                    </li>
                                                    <li
                                                        class="list-group-item justify-content-between align-items-center">
                                                        <a href="#!"><button type="button" class="btn btn-primary">Top
                                                                up your
                                                                account</button></a>
                                                    </li>
                                                    <li
                                                        class="list-group-item justify-content-between align-items-center">
                                                        <a href="#!"><button type="button"
                                                                class="btn btn-primary">Transaction
                                                                history</button></a>
                                                    </li>
                                                    <li
                                                        class="list-group-item justify-content-between align-items-center">
                                                        <a href="#!"><button type="button" class="btn btn-primary">Send
                                                                Report</button></a>
                                                    </li>


                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Full Name</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">Johnatan Smith</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Email</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">example@example.com</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Phone</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">(097) 234-5678</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Mobile</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">(098) 765-4321</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Address</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="card mb-4 mb-md-0">
                                                    <div class="card-body">
                                                        <p class="mb-4"><span
                                                                class="text-primary font-italic me-1">assigment</span>
                                                            Project Status
                                                        </p>
                                                        <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 80%" aria-valuenow="80" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup
                                                        </p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 72%" aria-valuenow="72" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 89%" aria-valuenow="89" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template
                                                        </p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 55%" aria-valuenow="55" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                                        <div class="progress rounded mb-2" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 66%" aria-valuenow="66" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card mb-4 mb-md-0">
                                                    <div class="card-body">
                                                        <p class="mb-4"><span
                                                                class="text-primary font-italic me-1">assigment</span>
                                                            Project Status
                                                        </p>
                                                        <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 80%" aria-valuenow="80" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup
                                                        </p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 72%" aria-valuenow="72" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 89%" aria-valuenow="89" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template
                                                        </p>
                                                        <div class="progress rounded" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 55%" aria-valuenow="55" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
                                                        </div>
                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                                        <div class="progress rounded mb-2" style="height: 5px;">
                                                            <div class="progress-bar" role="progressbar"
                                                                style="width: 66%" aria-valuenow="66" aria-valuemin="0"
                                                                aria-valuemax="100"></div>
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
                                                Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut
                                                aliquip exea
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
                                                        <i class="bi bi-chevron-right"></i> <a href="#">Privacy
                                                            Policy</a>
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

</body>

</html>