<%-- 
    Document   : report-page
    Created on : Oct 5, 2023, 7:52:51 AM
    Author     : Sy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!--Google Fonts--> 
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!--Vendor CSS Files--> 
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
    <!--Template Main CSS File--> 
    <link href="assets/css/style.css" rel="stylesheet">

    <%@ page import="model.Users" %>
    <%
        Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
        String type = (String)request.getAttribute("report_type");
    %>  
    <%@include file="header.jsp" %>
    <div class="container" style="margin-top: 9rem">
        <div class="row justify-content-center">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="trang-chu">Home</a></li>
                            <li class="breadcrumb-item"><a href="ReportCenter?type=general">Report Center</a></li>
                            <li class="breadcrumb-item active" aria-current="page">My Report</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <a href="ReportCenter?type=viewreport"><button class="btn btn-primary">View previous report</button></a>
        <%
            if(user!=null){
            if(type.equals("post")){
            String url_ref = (String)request.getAttribute("url_ref");
        %>

        <form method="post" id="reportform" action="ReportCenter" style="display: flex; flex-direction: column; align-items: center;"<%--onSubmit="return validateForm();""--%>>
            <div style="max-width: 400px;">
            </div>
            <div style="padding-bottom: 18px;font-size : 24px; color: red; text-align: center; font-weight: bold">Report An Issue!</div>
            <div style="padding-bottom: 18px;">Reported by<span style="color: red;"> *</span><br/>
                <input type="text" style="width: 650px;" name="reporter_email" value="<%=user.getEmail()%>" readonly style="max-width : 450px;" class="form-control"/>
            </div>
            <div style="padding-bottom: 18px;">Categories<br/>
                <select name="categories" style="width: 650px;" id="categories" style="max-width : 300px;" class="form-control" onchange="showInput(this.value)" required>
                    <option disabled>Select a category</option>
                    <option value="Fraudulent Post" selected>Fraudulent Post</option>
                </select>

                <!-- Initially hide this div -->
                <div id="reportDiv" style="padding-bottom: 18px;">Reported Property<span style="color: red;"> *</span><br/>
                    <input type="text" style="width: 650px;" placeholder="Relative URL of the post" id="data_2" name="post_link" value="<%=url_ref%>" style="max-width : 450px;" class="form-control" readonly />
                </div>

                <div style="padding-bottom: 18px;">Description<br/>
                    <textarea id="data_7" style="width: 650px;" name="description" placeholder="Provide a description for your problem..." style="max-width : 450px;" rows="6" class="form-control"></textarea>
                </div>
                <div style="padding-bottom: 18px;"><input name="Submit" value="Submit" type="submit"  class="btn btn-primary"/></div>
        </form>
        <%}else{%> 

        <form method="post" id="reportform" action="ReportCenter" style="display: flex; flex-direction: column; align-items: center;"<%--onSubmit="return validateForm();""--%>>
            <div style="max-width: 400px;">
            </div>
            <div style="padding-bottom: 18px;font-size : 24px; color: red; text-align: center; font-weight: bold">Report An Issue!</div>
            <div style="padding-bottom: 18px;">Reported by<span style="color: red;"> *</span><br/>
                <input type="text" style="width: 650px;" name="reporter_email" value="<%=user.getEmail()%>" readonly style="max-width : 450px;" class="form-control"/>
            </div>
            <div style="padding-bottom: 18px;">Categories<br/>
                <select name="categories" style="width: 650px;" id="categories" style="max-width : 300px;" class="form-control" onchange="showInput(this.value)" required>
                    <option selected disabled>Select a category</option>
                    <option value="User Complaint">User Complaint</option>
                    <option value="Fraudulent Post">Fraudulent Post</option>
                    <option value="Payment Problems">Payment Problems</option>
                    <option value="System Bug">System Bug</option>
                    <option value="Legal">Legal</option>
                    <option value="Others">Others</option>
                </select>
            </div>

            <!--   Initially hide this div--> 
            <div id="reportDiv" style="display: none; padding-bottom: 18px;">Reported Property<span style="color: red;"> *</span><br/>
                <input type="text" style="width: 650px;" placeholder="Relative URL of the post" id="data_2" name="post_link" style="max-width : 450px;" class="form-control"  />
            </div>
            <div id="personDiv" style="display: none; padding-bottom: 18px;">Reported Person<span style="color: red;"> *</span><br/>
                <input type="text" style="width: 650px;" placeholder="Email of the reported person" id="data_3" name="reported_email" style="max-width : 450px;" class="form-control"/>
            </div>


            <div style="padding-bottom: 18px;">Description<br/>
                <textarea id="data_7" style="width: 650px;" name="description" placeholder="Provide a description for your problem..." style="max-width : 450px;" rows="6" class="form-control"></textarea>
            </div>
            <div style="padding-bottom: 18px;"><input name="Submit" value="Submit" type="submit"  class="btn btn-primary"/></div>
        </form>
        <%}
        }%>
    </div>
</div>
<script>
    function showInput(value) {
        var reportDiv = document.getElementById("reportDiv");
        var personDiv = document.getElementById("personDiv");

        // Hide both divs initially
        reportDiv.style.display = "none";
        personDiv.style.display = "none";
        // Clear both input fields initially
        reportDiv.querySelector('input').value = "";
        personDiv.querySelector('input').value = "";

        if (value === "Fraudulent Post") {
            reportDiv.style.display = "block"; // Show the div
        } else if (value === "User Complaint") {
            personDiv.style.display = "block"; // Show the div
        }
    }
</script>
<script>
    function isValidEmail(input) {
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailRegex.test(input);
    }</script>
<script>
    function isValidUrl(url) {
        var urlpattern = "http://localhost:8080/SWP391-House-Rental-Management/housedetail?id=";
        return url.startsWith(urlpattern);
    }
</script>
<script>
    document.getElementById('reportform').addEventListener('submit', function (e) {
        var categories = document.getElementById('categories');
        var reportInput = document.getElementById("data_2");
        var personInput = document.getElementById("data_3");

        if (categories.selectedIndex === 0) {
            alert('Please select a category.');
            e.preventDefault();
        } else {
            if (categories.value === "Fraudulent Post") {
                if (reportInput.value.trim() === "") {
                    alert("Please enter the relative URL of the post.");
                    e.preventDefault();
                } else
                if (!isValidUrl(reportInput.value.trim())) {
                    alert("Please enter a valid URL.");
                    e.preventDefault();
                } else {
                    alert('Your report has been successfully submitted, please wait for the admin to process your report and respond to you in 1-3 days.');
                }
            } else {
                if (categories.value === "User Complaint") {
                    if (personInput.value.trim() === "") {
                        alert("Please enter the email of the reported person.");
                        e.preventDefault();
                    } else
                    if (!isValidEmail(personInput.value.trim())) {
                        alert("Please enter a valid email.");
                        e.preventDefault();
                    } else {
                        alert('Your report has been successfully submitted, please wait for the admin to process your report and respond to you in 1-3 days.');
                    }
                } else {
                    alert('Your report has been successfully submitted, please wait for the admin to process your report and respond to you in 1-3 days.');
                }
            }
        }
    });
</script>

<!--        <form action="//submit.form" id="ReportProblem100" method="post" onsubmit="return ValidateForm(this);">
<script type="text/javascript">
function ValidateForm(frm) {
if (frm.ProblemDescription.value == "") { alert('Please enter describe the problem.'); frm.ProblemDescription.focus(); return false; }
if (frm.Name.value == "") { alert('Name is required.'); frm.Name.focus(); return false; }
if (frm.FromEmailAddress.value == "") { alert('Email address is required.'); frm.FromEmailAddress.focus(); return false; }
if (frm.FromEmailAddress.value.indexOf("@") < 1 || frm.FromEmailAddress.value.indexOf(".") < 1) { alert('Please enter a valid email address.'); frm.FromEmailAddress.focus(); return false; }
return true; }
</script>-->

<!--    <select id="mySelect" onchange="myFunction()">
        <option value="">Select a fruit:</option>
        <option value="apple">Apple</option>
        <option value="orange">Orange</option>
        <option value="pineapple">Pineapple</option>
        <option value="banana">Banana</option>
    </select>

    <p id="demo"></p>

     Create the input element once and hide it initially 
    <input id="myInput" type="text" style="display: none;">

    <script>
        function myFunction() {
            var x = document.getElementById("mySelect").value;
            document.getElementById("demo").innerHTML = "You selected: " + x;

            // Get the existing input element
            var input = document.getElementById("myInput");

            // If apple or orange is selected, update the input value
            if (x === "apple" || x === "orange") {
                input.value = x;
                input.style.display = "block"; // Show the input field
            } else {
                input.value = "";
                input.style.display = "none"; // Hide the input field
            }
        }
    </script>-->

</html>
