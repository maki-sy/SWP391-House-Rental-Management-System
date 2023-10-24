<!doctype html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
        </style>
    </head>

    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <% String token = request.getParameter("token") == null ? null : request.getParameter("token"); %>
        <% boolean verified = request.getAttribute("verified") == null ? false : (boolean)request.getAttribute("verified"); %>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Reset Password</strong>
                                </h1>
                            </div>

                            <% if(verified) { %>
                            <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                                 fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                            </svg>
                            <% } else { %>
                            <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                            </svg>

                            <div class="text-center">
                                <h1>Sorry are you lost the way?</h1>
                                <p>The link you followed has been wrong, or the token has been expired</p>
                                <a href="trang-chu"><button class="btn btn-outline-success">Back Home</button></a>
                            </div>
                            <% } %>

                            <% if(verified) { %>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="recover?service=resetPwd" method="POST">
                                    <!-- Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="password" id="password"
                                                   placeholder="&#xf084; &nbsp; New Password"
                                                   class="form-control border-info placeicon">
                                        </div>
                                    </div>
                                    <!-- Re-Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="confPassword" id="confPassword"
                                                   placeholder="&#xf084; &nbsp; Confirm New Password"
                                                   class="form-control border-info placeicon">
                                        </div>
                                    </div>
                                    <input type="hidden" name="token" value="<%=token%>">

                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset" class="btn btn-block btn-info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <% } %>        

                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">

                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                <!-- Register Now -->
                                <div class="pt-2">
                                    <div class="row justify-content-center">
                                        <h5>
                                            Don't have an Account?<span><a href="login?type=login" class="text-danger"> Register
                                                    Now!</a></span>
                                        </h5>
                                    </div>
                                    <div class="row justify-content-center align-items-center pt-4 pb-5">
                                        <div class="col-4">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

        <!-- Validator.js for validating password -->
        <script type="text/javascript" src="https://unpkg.com/validator@latest/validator.min.js"></script>

        <!-- Validate password -->
        <script type="text/javascript">

            let password = document.getElementById("password"); // password input field in login form
            let retypePwd = document.getElementById("confPassword");

            let options = {
                minLength: 6,
                minLowercase: 1,
                minUppercase: 1,
                minSymbols: 1
            }

            // add eventHandler
            password.addEventListener("input", checkPassword);
            retypePwd.addEventListener("input", checkRetypeMatch);

            // check login password
            function checkPassword() {

                let loginValidPwd = validator.isStrongPassword(password.value, options);
                if (!loginValidPwd) { // password does not valid
                    password.setCustomValidity("Password does not valid. It must at least 6 characters long, 1 lowercase, 1 uppercase and 1 special symbols");
                    password.reportValidity();
                } else {
                    password.setCustomValidity(""); // set validity to empty so that form can be submitted
                }
            }

            function checkRetypeMatch() {
                if (password.value !== retypePwd.value) {
                    retypePwd.setCustomValidity("Password does not match");
                    retypePwd.reportValidity();
                } else {
                    retypePwd.setCustomValidity("");
                }
            }

        </script>

    </body>

</html>