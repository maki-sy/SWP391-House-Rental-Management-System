<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>House Rental Admin | Log in</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="assets/vendor/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="Admin/assets/css/adminlte.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="assets/vendor/icheck-bootstrap/icheck-bootstrap.min.css">

    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Admin</b>House Rental</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form action="admin-login" method="POST">
                        <div class="input-group mb-3">
                            <input name="email" type="email" class="form-control" placeholder="Email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input id="password" name="password" type="password" class="form-control" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>

                        <p style="color:red">${msg}</p>

                        <div class="row">
                            <div class="col-8">
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <!-- /.social-auth-links -->

                    <p class="mb-1">
                        <a href="recover?service=forgotForm">I forgot my password</a>
                    </p>

                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="Admin/assets/javascript/adminlte.min.js"></script>

        <!-- Validator.js for validating password -->
        <script type="text/javascript" src="https://unpkg.com/validator@latest/validator.min.js"></script>

        <!-- Validate password -->
        <script type="text/javascript">

            let password = document.getElementById("password"); // password input field in login form
//            let form = document.querySelector('form');

            let options = {
                minLength: 6,
                minLowercase: 1,
                minUppercase: 1,
                minSymbols: 1
            };

            // add eventHandler
            password.addEventListener("input", checkValidPassword);
//            form.addEventListener('submit', checkValidPassword);

            // check login password
            function checkValidPassword(event) {

                let loginValidPwd = validator.isStrongPassword(password.value, options);
                if (!loginValidPwd) { // password does not valid
                    password.setCustomValidity("Password does not valid. It must at least 6 characters long, 1 lowercase, 1 uppercase and 1 special symbols");
                    password.reportValidity();
                } else {
                    password.setCustomValidity(""); // set validity to empty so that form can be submitted
                }
            }
        </script>
    </body>
</html>
