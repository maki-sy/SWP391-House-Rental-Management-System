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

        <title>Pending requests | RentalHouse</title>
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
            ArrayList<String>
            tenantsName = (ArrayList<String>)request.getAttribute("tenantsName");
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
                                    <li class="breadcrumb-item active" aria-current="page">Pending Request</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                 
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="./assets/img/setting.png"
                                         alt="avatar" class="img-fluid"
                                         style="width: 150px;">
                                    <div class="mb-3"></div>
                                    <ul class="list-group text-start">
                                        <li class="text-start list-group-item active list-group-item-action" aria-current="true">Manage pending requests</li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=session.getAttribute("accountBalance")%>
                                        </span>
                                        </li>
                                        <li class="list-group-item"><span class="text-bg-primary">--View--</span><span> View detailed post information</span></li>
                                        <li class="list-group-item"><span class="text-bg-warning">--Contact--</span><span> Go to the customer's personal page</span></li>
                                        <li class="list-group-item"><span class="text-bg-success">--Approve--</span><span> Customers can view your personal information</span></li>
                                        <li class="list-group-item"><span class="text-bg-danger">--Reject--</span><span> Customers can't see your contact information</span></li>
                                    </ul>
                                </div>
                            </div>


                            <!-- MINI SIDE BAR HERE -->
                            <%@include file="L-service-sidebar.jsp" %>
                            <!-- END MINI SIDE BAR -->
                        </div>


                        <!-- Main content here -->
                        <div class="card col-lg-8">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1" scope="col">#</th>
                                        <th class="col-lg-auto" scope="col">Order ID</th>
                                        <th class="col-lg-auto" scope="col">Tennant Name</th>
                                        <th class="col-lg-auto" scope="col">Status</th>
                                        <th class="col-lg-auto" scope="col">Order date</th>
                                        <th class="col-lg-1" scope="col">View</th>
                                        <th class="col-lg-1" scope="col">Contact</th>
                                        <th class="col-lg-1" scope="col">Approve</th>
                                        <th class="col-lg-1" scope="col">Reject</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for(int i = 0; i < ordersList.size(); i++) {%>
                                    <tr>
                                        <th scope="row">
                                            <%=i+1%>
                                        </th>
                                        <td>
                                            <%=ordersList.get(i).getOrderId()%>
                                        </td>
                                        <td>
                                            <%=tenantsName.get(i)%>
                                        </td>
                                        <td>
                                            <%=ordersList.get(i).getStatus()%>
                                        </td>
                                        <td>
                                            <%=ordersList.get(i).getOrder_date()%>
                                        </td>
                                        <td>
                                            <form action="landlordServicesPage"
                                                  method="POST">
                                                <input type="hidden" name="service"
                                                       value="view-request-post">
                                                <input type="hidden" name="post-id"
                                                       value="<%=ordersList.get(i).getPostId()%>">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-primary">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="landlordServicesPage"
                                                  method="POST">
                                                <input type="hidden" name="service"
                                                       value="contact">
                                                <input type="hidden" name="tenant-id"
                                                       value="<%=ordersList.get(i).getTenantId()%>">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-warning">
                                                    <ion-icon
                                                        name="call-outline"></ion-icon>
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);"
                                               onclick="confirmApprove(<%=ordersList.get(i).getOrderId()%>)">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-success">
                                                    <ion-icon
                                                        name="checkbox-outline"></ion-icon>
                                                </button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);"
                                               onclick="confirmReject(<%=ordersList.get(i).getOrderId()%>)">
                                                <button type="submit"
                                                        class="w-100 btn btn-sm btn-danger">
                                                    <ion-icon
                                                        name="trash-outline"></ion-icon>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
            <!-- code here -->
        </main>

        <!-- ======= Footer ======= -->
        <%@include file="footer.jsp" %>
        <!-- End  Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Handle Javascript -->
        <script>
            var mess = '<%= request.getAttribute("mess") %>';
            if (mess !== 'null' && mess !== null) {
                setTimeout(function () {
                    alert(mess);
                }, 500);
            }
        </script>
        <script src="assets/js/pending_requests.js"></script>

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