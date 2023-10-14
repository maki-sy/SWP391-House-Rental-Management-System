<!-- JSP Import -->
<%@page import="model.Users" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.PostRental" %>
<% Users user=session.getAttribute("user")==null ? null : (Users)session.getAttribute("user"); %>


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


    </head>

    <body>
        <!-- ======= JSP ======= -->
        <% String role=session.getAttribute("role")==null ? null : (String) session.getAttribute("role");
            Object loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user");
            ArrayList<PostRental>
            postList = (ArrayList<PostRental>)request.getAttribute("postList");
        %>


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
                                <input type="text"
                                       class="form-control form-control-lg form-control-a"
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
                                <select class="form-control form-select form-control-a"
                                        id="bedrooms">
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
                                <select class="form-control form-select form-control-a"
                                        id="bathrooms">
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
        <!-- End Property Search Section -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->

        <!-- Main content -->
        <main id="main">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0 mt-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">User</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">User
                                        Profile</li>
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
                                            aria-current="true">Manage pending requests</li>
                                        <li class="list-group-item"><span
                                                class="text-bg-primary">--View--</span><span>
                                                View detailed post information</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-danger">--Draft--</span>
                                            <span>
                                                Move to the post Draft, you can edit and pay at any time, but return the post to unpaid status</span></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- SIDE BAR HERE -->
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark "> Manage rental
                                                    requests</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=pending-requests">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Pending
                                                        requests
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a
                                                    href="landlordServicesPage?service=requests-processed">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Requests
                                                        processed
                                                    </button>
                                                </a>
                                            </div>

                                        </li>
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark "> Manage My
                                                    Post</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=published-posts">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Published
                                                        posts
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a
                                                    href="landlordServicesPage?service=add-new-post">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Add new post
                                                    </button>
                                                </a>
                                            </div>

                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=edit-posts">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Edit
                                                        posts and drafts
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark ">Manage my
                                                    wallet points</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a href="#!">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Request
                                                        deposit
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a href="#!">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Transaction
                                                        history
                                                    </button>
                                                </a>
                                            </div>
                                        </li>

                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark ">Promotions</button></a>
                                        </li>

                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a href="PromotionManage">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Manage
                                                        Promotions
                                                    </button>
                                                </a>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <!-- END SIDE BAR -->

                        </div>

                        <div class="card col-lg-8">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1" scope="col">#</th>
                                        <th class="col-lg-1" scope="col">ID</th>
                                        <th class="col-lg-1" scope="col">Name</th>
                                        <th class="col-lg-1" scope="col">Price</th>
                                        <th class="col-lg-1" scope="col">Status</th>
                                        <th class="col-lg-2" scope="col">Start date</th>
                                        <th class="col-lg-2" scope="col">End date</th>
                                        <th class="col-lg-1" scope="col">View</th>
                                        <th class="col-lg-1" scope="col">Draft</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%int count=0; for(PostRental post : postList) {%>
                                    <tr>
                                        <th scope="row">
                                            <%=++count%>
                                        </th>
                                        <td>
                                            <%=post.getId()%>
                                        </td>
                                        <td>
                                            <%=post.getName()%>
                                        </td>
                                        <td>
                                            <%=post.getPrice()%>
                                        </td>
                                        <td>
                                            <%=post.getStatus()%>
                                        </td>
                                        <td>
                                            <%=post.getPost_start()%>
                                        </td>
                                        <td>
                                            <%=post.getPost_end()%>
                                        </td>
                                        <td>
                                            <form action="landlordServicesPage"
                                                  method="POST">
                                                <input type="hidden" name="service"
                                                       value="view-request-post">
                                                <input type="hidden" name="post-id"
                                                       value="<%=post.getId()%>">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-primary">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);"
                                               onclick="confirmRemoveToDraft(<%=post.getId()%>)">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-danger">
                                                    <ion-icon name="albums-outline"></ion-icon>
                                                </button>
                                            </a>
                                        </td>


                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
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
                                                    Enim minim veniam quis nostrud exercitation ullamco laboris
                                                    nisi ut
                                                    aliquip exea
                                                    commodo consequat duis
                                                    sed aute irure.
                                                </p>
                                            </div>
                                            <div class="w-footer-a">
                                                <ul class="list-unstyled">
                                                    <li class="color-a">
                                                        <span class="color-text-a">Phone .</span>
                                                        contact@example.com
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
                                                            <i class="bi bi-chevron-right"></i> <a href="#">Site
                                                                Map</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Legal</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Agent Admin</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Careers</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Affiliate</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Privacy
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
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Venezuela</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">China</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a href="#">Hong
                                                            Kong</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Argentina</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Singapore</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Philippines</a>
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

                                            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </footer><!-- End  Footer -->

                        <div id="preloader"></div>
                        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                                class="bi bi-arrow-up-short"></i></a>

                        <!-- Handle Javascript -->
                        <script>
                            var mess = '<%= request.getAttribute("mess") %>'
                            if (mess !== 'null' && mess !== null) {
                                setTimeout(function () {
                                    alert(mess)
                                }, 500);
                            }
                        </script>
                        <script src="assets/js/published_posts.js"></script>

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