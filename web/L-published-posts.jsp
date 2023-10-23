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

        <title>Published posts | RentalHouse</title>
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
            ArrayList<PostRental>
            postList = (ArrayList<PostRental>)request.getAttribute("postList");
        %>
        <!-- End JSP Code -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>
        <!-- End Header/Navbar -->

        <!-- Main content -->
        <main id="main" style="margin-top: 3rem">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Manage Service</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Published Posts</li>
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
                                            aria-current="true">Manage published post</li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=session.getAttribute("accountBalance")%>
                                        </span>
                                        </li>
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
                            <%@include file="L-service-sidebar.jsp" %>
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
                                            <%=post.getName().substring(0,10)%>...
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
                         <%@include file="footer.jsp" %>
                        <!-- End  Footer -->

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