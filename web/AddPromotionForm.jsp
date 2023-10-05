<%-- 
    Document   : AddPromotionForm
    Created on : Sep 26, 2023, 9:11:16 AM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            .main{
                padding: 40px 0;
            }
            .main input,
            .main input::-webkit-input-placeholder {
                font-size: 11px;
                padding-top: 3px;
            }
            .main-center{
                margin-top: 30px;
                margin: 0 auto;
                max-width: 400px;
                padding: 10px 40px;
                background:green;
                color: #FFF;
                text-shadow: none;
                -webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
                -moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
                box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);

            }
            span.input-group-addon i {
                color: #009edf;
                font-size: 17px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="main">
                <div class="main-center">
                    <h5>Add Promotion Form</h5>
                    <form class="" method="post" action="AddPromotion?service=add">
                        <div class="form-group">
                            <label >Chose property</label>
                            <p class="text-danger">${mess}</p>
                            <div class="input-group">
                                <c:forEach items="${listp}" var="o">
                                    <input type="checkbox" name="p" value="${o.id}"/>${o.name}
                                    <br>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Discount</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="discount" placeholder="Enter your discount"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label >Descriptions</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="desciptions" placeholder="Enter your descriptions"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label >Promotion start date</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="date" class="form-control" name="start_date" placeholder="Enter your start date"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label >Promotion end date</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input type="date" class="form-control" name="end_date" placeholder="Enter your end date"/>
                            </div>
                        </div>
                            <button type="submit" style="color: red">SUBMIT</button>

                    </form>
                </div><!--main-center"-->
            </div><!--main-->
        </div><!--container-->
    </body>
</html>
