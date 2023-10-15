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
                    <c:if test="${now == 'edit'}"> 
                        <form class="" method="post" action="EditPromotion?service=edit&id=${promo.promotion_id}">
                            <input type="hidden" name="now" value="${now}">                            
                            <div class="form-group">
                                <label >Edit Promotion form</label>
                                <p class="text-danger">${mess}</p>
                                <div class="form-group">
                                    <label >Discount</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="discount" value="${promo.discount}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label >Descriptions</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="desciptions" value="${promo.descriptions}"/>
                                    </div>
                                </div>
                                <button type="submit" style="color: red">SUBMIT</button>
                                <a href="PromotionManage"><button type="button" class="float-right" style="color: red">CANCEL</button>
                                    </form>
                                </c:if>
                                <c:if test="${now == 'duration'}"> 
                                    <form class="" method="post" action="EditPromotion?service=duration&id=${promo.promotion_id}">
                                        <input type="hidden" name="now" value="${now}">  
                                        <div class="form-group">
                                            <label >Edit Promotion form</label>
                                            <p class="text-danger">${mess}</p>
                                            <div class="form-group">
                                                <label >Promotion start date</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                    <input type="date" class="form-control" name="start_date" value="${promo.promotion_start_date}"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label >Promotion end date</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                    <input type="date" class="form-control" name="end_date" value="${promo.promotion_end_date}"/>
                                                </div>
                                            </div>
                                            <button type="submit" style="color: red">SUBMIT</button>
                                            <a href="PromotionManage"><button type="button" class="float-right" style="color: red">CANCEL</button>
                                                </form>
                                            </c:if>

                                    </div><!--main-center"-->
                                    </div><!--main-->
                                    </div><!--container-->
                                    </body>
                                    </html>
