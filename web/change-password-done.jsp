<%-- 
    Document   : change-password-done
    Created on : Oct 4, 2023, 9:38:36 PM
    Author     : nagis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <style>
            .main {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
        </style>
    </head>
    <body>
        <%
            String verified = request.getAttribute("verified") == null ? "" : (String) request.getAttribute("verified");
        %>
        <main id="main">
            <div class="vh-100 d-flex justify-content-center align-items-center">
                <div class="card col-md-4 bg-white shadow-md p-5">
                    <div class="mb-4 text-center">
                        <% if(verified == "success") { %>
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
                    <% if(verified == "invalidToken") { %>
                    <div class="text-center">
                        <h1>Change password failed!</h1>
                        <p>Invalid token. Please request a new password reset link.</p>
                        <a href="trang-chu"><button class="btn btn-outline-primary">Back to Home</button></a>
                    </div>
                    <% } else if(verified == "tokenExpired") { %>
                    <div class="text-center">
                        <h1>Change password failed!</h1>
                        <p>The link has expired. Please request a new password reset link.</p>
                        <a href="trang-chu"><button class="btn btn-outline-primary">Back to Home</button></a>
                    </div>
                    <% } else if(verified == "success") { %>
                    <div class="text-center">
                        <h1>Success!</h1>
                        <p>Password changed successfully.</p>
                        <a href="trang-chu"><button class="btn btn-outline-success">Back to Home</button></a>
                    <% } else { %>
                        <h1>Error</h1>
                        <p>An error occurred.</p>
                        <a href="trang-chu"><button class="btn btn-outline-primary">Back to Home</button></a>
                    <% } %>
                    </div>
                </div>
        </main>
    </body>
</html>
