<%-- 
    Document   : ViewWishlist
    Created on : Oct 16, 2023, 9:44:27 AM
    Author     : DTS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Users, model.Wishlist, java.util.List, service.UserService, service.PostService"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wishlist</title>

        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="<%= request.getContextPath() %>/assets/img/favicon.png" rel="icon">
        <link href="<%= request.getContextPath() %>/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="<%= request.getContextPath() %>/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="<%= request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- ======= JSP ======= -->
        <% 
            Users user = (Users)session.getAttribute("user");
            List<Wishlist> wishes = (List<Wishlist>) request.getAttribute("wishes");
            PostService pService = new PostService();
        %>


        <!-- End JSP Code -->

        <!-- ======= Property Search Section ======= -->
        
        <!-- End Property Search Section -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="/header.jsp" %>
        <!-- ======= Header/Navbar ======= -->

        <main id="main">
            <section class="section-news section-t3" style="margin-top:50px">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">My wishlist</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <% if(user != null){ %>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="<%=session.getAttribute("userAvatar")%>" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <!--<h5 class="my-3"><%--=tenant.getFirstName()--%>&nbsp;<%--=tenant.getLastName()--%></h5>-->
                                    <p class="text-muted mb-1"><%=user.getEmail()%></p>
                                    <p class="text-muted mb-4">*******</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="button" class="btn btn-primary"
                                                disabled><%--=role_name--%>Tenant</button>
                                        <button type="button" class="btn btn-outline-primary ms-1"
                                                disabled><%=user.getStatus()%></button>
                                    </div>
                                    
                                    <form action="uploadavt" method="post" enctype="multipart/form-data">
                                        <div class="input-group mb-3">
                                            <input type="file" name="avatar" class="form-control" accept="image/*">
                                        </div>
                                        <button class="btn btn-primary" type="submit">Upload/Update Avatar</button>
                                    </form>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">

                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=updateProfile">
                                                <button type="button" class="btn btn-primary">Edit public information</button>
                                            </a>
                                        </li>
                                        <li
                                            class="list-group-item justify-content-between align-items-center">
                                            <a href="Profile?service=changePassword">
                                                <button type="button" class="btn btn-primary">Change password</button>
                                            </a>
                                        </li>


                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1" scope="col">#</th>
                                        <th class="col-lg-auto" scope="col">Post title</th>
                                        <th class="col-lg-1" scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%int count=0; for(Wishlist w : wishes) {%>
                                    <tr>
                                        <th scope="row">
                                            <%= ++count %>
                                        </th>
                                        <td>
                                            <a href="housedetail?id=<%= w.getPostId() %>"><%= pService.getPostName(w.getPostId()) %></a>
                                        </td>
                                        <td>
                                            <form action="wishlist?service=delete" method="POST">
                                                <input type="hidden" name="wishId" value="<%= w.getId() %>">
                                                <button type="submit" class="w-100 btn btn-sm btn-primary">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>



                        </div>
                    </div>
                    <%}%> <!-- End if check logged user -->

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
        <script src="<%= request.getContextPath() %>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<%= request.getContextPath() %>/assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="<%= request.getContextPath() %>/assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="<%= request.getContextPath() %>/assets/js/main.js"></script>

    </body>
</html>
