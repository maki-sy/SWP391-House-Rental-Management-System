<%-- 
    Document   : T-view-order
    Created on : Oct 13, 2023, 10:23:37 AM
    Author     : Sy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Orders, DAO.OrdersDAO" %>
<%@page import="java.util.List, java.sql.ResultSet"%>
<%@ page import="model.Users" %>
<%@ page import="service.OrderService" %>
<%@page import="model.PostRental, model.Landlord, model.PostImage, DAO.PostDAO, DAO.LandlordDAO"%>
<!DOCTYPE html>
<html>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="assets/css/order-style.css">

    <a class="btn btn-primary" href="Profile?service=displayProfile">Back</a>    

    <%
            Users user = session.getAttribute("user") == null ? null : (Users)session.getAttribute("user");
            int roleID = user.getRoleID();
            PostDAO Pdao = new PostDAO();
            LandlordDAO LDao = new LandlordDAO();
            OrderService service = new OrderService();
            if(roleID==1){
                List<Orders> listOfOrders = (List<Orders>)request.getAttribute("TenantOrders");
    %>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-4">
                    <h2 class="heading-section">Your Orders</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrap">
                        <table class="table">
                            <thead class="thead-primary">
                                <tr>

                                    <th>Image</th>
                                    <th>Property</th>
                                    <th>Landlord</th>
                                    <th>Date ordered</th>
                                    <th>Status</th>
                                    <th>Cancel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
            for(Orders order : listOfOrders){
                int tenantID = order.getTenantId();
                int landlordID = order.getLandlordId();
                int postID = order.getPostId();
                String order_date = order.getOrder_date();
                String status = order.getStatus();
                PostRental post = Pdao.getPostDetailsbyID(postID);
                String postName = post.getName();
                Landlord landlord = LDao.getLandlordByUserID(landlordID);
                String landlordName = landlord.getFirstName()+ " "+landlord.getLastName();
                String landlordEmail = service.getEmailFromLandlordByPostID(postID);
                                %>
                                <tr class="alert" role="alert">

                                    <td>
                                        <div class="img" style="background-image: url(images/product-1.png);"></div>
                                    </td>
                                    <td>
                                        <div class="email">
                                            <span><%=postName%></span>
                                            <a href="housedetail?id=<%=postID%>"><span style="color: blue; text-decoration: underline;">View details</span></a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="email">
                                            <span><%=landlordName%></span>
                                            <span><%=landlordEmail%></span>
                                        </div>
                                    </td>

                                    <td class="email">
                                        <%=order_date%>
                                    </td>
                                    <td><%=status%></td>
                                    <td>
                                        <a href="order?service=cancelOrder">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                        </button>
                                        </a>
                                    </td>
                                </tr>
                                <%
}
}
                                %>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</html>
