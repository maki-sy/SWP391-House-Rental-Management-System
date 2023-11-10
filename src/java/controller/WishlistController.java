/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.PostRental;
import model.Users;
import model.Wishlist;
import service.PostService;
import service.UserService;

/**
 * This controller handle wishlist's related services, such as, user add post to
 * their own wishlist, remove post from their wishlist, etc.
 *
 * @author DTS
 */
@WebServlet(name = "WishlistController", urlPatterns = {"/wishlist"})
public class WishlistController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method. TODO: View wishlist for user,
     * remove from wishlist
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");

        HttpSession session = request.getSession();
        Users loggedUser = (Users) session.getAttribute("user");
        PostService postService = new PostService();
        UserService uService = new UserService();
        if (service == null) {
            service = "view";
        }

        // user are required to logged in before can access to wishlist feature
        if (loggedUser == null) {
            response.sendRedirect("login?type=login");
            return;
        } else { // user logged in
            try {

                switch (service) {
                    case "add":
                        String postId = request.getParameter("id");
                        // check whether postID in parameter is a valid postID
                        PostRental post = postService.getPostByID(Integer.parseInt(postId));
                        if (post == null) { // if there is no post
                            request.setAttribute("msg", "Sorry, the post you are looking for is not valid");
                            request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                            return;
                        }

                        // add post to user's wishlist
                        uService.addToWishlist(loggedUser.getId(), Integer.parseInt(postId));
                        response.sendRedirect("housedetail?id=" + postId); // TODO: use JS
                        break;
                    case "view":
                        List<Wishlist> wishes = uService.getWishlistByUserID(loggedUser.getId());
                        request.setAttribute("wishes", wishes);
                        request.getRequestDispatcher("Tenant/view/ViewWishlist.jsp").forward(request, response);
                        return;
                }

            } catch (NumberFormatException numberEx) {
                System.out.println("PostID is not a number, catch you");
                request.setAttribute("msg", "Sorry, the post you are looking for is not valid");
                request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
            }

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        UserService uService = new UserService();
        if (service == null) {
            response.sendRedirect("trang-chu");
            return;
        }

        switch (service) {
            case "delete":
                try {
                int wishId = Integer.parseInt(request.getParameter("wishId"));
                uService.deleteWish(wishId);
                response.sendRedirect("wishlist?service=view");
                break;
            } catch (NumberFormatException numberEx) {
                System.out.println(numberEx.getMessage());
                request.setAttribute("msg", "Cannot find your wishlist");
                request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                return;
            }
            case "deleteheart":
                int wishId = Integer.parseInt(request.getParameter("wishId"));
                    System.out.println(wishId);
                uService.deleteWish(wishId);
                response.sendRedirect("housedetail?id=" + wishId);
                break;
        }
    }
}
