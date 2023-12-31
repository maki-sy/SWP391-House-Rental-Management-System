<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin | Post List</title>
        <%@page import="model.PostRental, model.PostImage, DAO.PostDAO, model.PropertyType, model.PropertyLocation" %>
        <%@page import="java.util.List, java.sql.ResultSet, java.util.ArrayList"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="assets/vendor/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="Admin/assets/css/adminlte.min.css">

    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="trang-chu" class="nav-link">Home</a>
                    </li>
<!--                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="contact.jsp" class="nav-link">Contact</a>
                    </li>-->
                </ul>

                
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="admin-dashboard" class="brand-link">
                    <img src="assets/img/admin-page-logo.png" alt="Admin Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">Admin Page</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="<%=session.getAttribute("userAvatar")%>" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block">Admin</a>
                        </div>
                    </div>
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="admin-dashboard?service=manageAccount" class="nav-link">
                                    <i class="nav-icon fas fa-cog"></i>
                                    <p>
                                        Manage Account

                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="admin-dashboard?service=managePost" class="nav-link active">
                                    <i class="nav-icon fas fa-cog"></i>
                                    <p>
                                        Manage Post
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="admin-report?service=manageReport" class="nav-link">
                                    <i class="nav-icon fas fa-cog"></i>
                                    <p>
                                        Process Report
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="admin-dashboard?service=account-utils" class="nav-link">
                                    <i class="nav-icon fas fa-cog"></i>
                                    <p>
                                        Account Utilities
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="login?type=logout" class="nav-link">
                                    <i class="nav-icon fas fa-cog"></i>
                                    <p>
                                        Logout
                                    </p>
                                </a>
                            </li>
                        </ul>                
                        <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Posts</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                                    <li class="breadcrumb-item active">Manage Account</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">View Posts list</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <%
                            List<PostRental> list = (List<PostRental>) request.getAttribute("listOfPost");
                        %>
                        <div class="card-body p-0">
                            <table class="table table-striped projects">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1 text-justify">
                                            ID
                                        </th>
                                        <th class="col-lg-1">
                                            Name
                                        </th>
                                        <th class="col-lg-1">
                                            Price
                                        </th>
                                        <th class="col-lg-1">
                                            Area
                                        </th>
                                        <th class="col-lg-1">
                                            Number Of Beds
                                        </th>
                                        <th class="col-lg-1 text-center" >
                                            Address
                                        </th>
                                        <th class="col-lg-1 text-center">
                                            Status
                                        </th>
                                        <th class="col-lg-1 text-center" > Tool
                                        </th>
                                    </tr>
                                </thead>
                                <%for(PostRental pr:list){%>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%=pr.getId()%>
                                        </td>
                                        <td>
                                            <a>
                                                <%=pr.getName()%>
                                            </a>
                                        </td>
                                        <td>
                                            <%=pr.getPrice()%>  $
                                        </td>
                                        <td>
                                            <%=pr.getArea()%>  m2
                                        </td>
                                        <td>
                                            <%=pr.getNumOfBeds()%>
                                        </td>
                                        <td>
                                            <%=pr.getAddress()%>
                                        </td>
                                        <%if("basic".equals(pr.getStatus())){%>
                                        <td class="project-state">
                                            <span class="badge badge-success">Basic</span>
                                        </td>
                                        <%}%>
                                        <%if("standard".equals(pr.getStatus())){%>
                                        <td class="project-state">
                                            <span class="badge badge-warning">Standard</span>
                                        </td>
                                        <%}%>
                                        <%if("premium".equals(pr.getStatus())){%>
                                        <td class="project-state">
                                            <span class="badge badge-primary">Premium</span>
                                        </td>
                                        <%}%>
                                        <%if("draft".equals(pr.getStatus())){%>
                                        <td class="project-state">
                                            <span class="badge badge-info">Draft</span>
                                        </td>
                                        <%}%>
                                        <%if("deleted".equals(pr.getStatus())){%>
                                        <td class="project-state">
                                            <span class="badge badge-danger">Deleted</span>
                                        </td>
                                        <%}%>
                                        <td class="project-actions">
                                            <% if (!"deleted".equals(pr.getStatus())) { %>
                                            <a class="btn btn-danger btn-sm text-center" href="javascript:void(0);" onclick="confirmDelete(<%=pr.getId()%>);">
                                                <i class="fas fa-trash"></i>
                                                Delete
                                            </a>
                                            <% } %>
                                        </td>
                                    </tr>
                                </tbody>
                                <%}%>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.2.0
                </div>
                <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script>
            function confirmDelete(postId) {
                var confirmation = confirm("Bạn có chắc chắn muốn xóa bài viết này?");
                if (confirmation) {
                    window.location.href = "admin-dashboard?service=deletePost&id=" + postId;
                }
            }
        </script>
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="Admin/assets/javascript/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="Admin/assets/javascript/demo.js"></script>
    </body>
</html>

