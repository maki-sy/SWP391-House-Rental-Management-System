<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            body {
                background-position: center;
                background-color: #eee;
                background-repeat: no-repeat;
                background-size: cover;
                color: #505050;
                font-family: "Rubik", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.5;
                text-transform: none
            }

            .change {
                background-color: #fff;
                padding: 12px;
                border: 1px solid #dfdfdf
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important
            }

            .card-footer {
                background-color: #fff
            }

            .btn {
                font-size: 13px
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #76b7e9;
                outline: 0;
                box-shadow: 0 0 0 0px #28a745
            }
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
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="change">
                        <h2>Change your password in three easy steps. This will help you
                            to secure your password!</h2>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>Enter your old password below.</li>
                            <li><span class="text-primary text-medium">2. </span>Our system will send you an email to verify the request.</li>
                            <li><span class="text-primary text-medium">3. </span>Enter the new password on the next page</li>
                        </ol>
                    </div>
                    <form class="card mt-4" action="changePassword" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="email-for-pass">Enter your password</label> <input
                                    class="form-control" type="password" name="password" id="email-for-pass"><small
                                    class="form-text text-muted">Enter the old password in the box below. If the password is correct, we will send an
                                    email to this address.</small>
                                <!--<label for="role-for-pass">Choose the role that you registered using this email</label>
                                <select name="role">
                                    <option value="" disabled selected>Select a role</option>
                                    <option>Tenant</option>
                                    <option>Landlord</option>
                                </select>-->
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" name="getNewPassword" type="submit">Get New
                                Password</button>
                            <button class="btn btn-danger" name="backToHome" type="submit">Back to
                                Home</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
    </body>
</html>