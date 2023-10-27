/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.AdminDAO;
import DAO.LandlordDAO;
import DAO.TenantDAO;
import DAO.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.*;
import model.Users;
import model.Users.Status;
import service.LandlordService;
import service.UserService;

/**
 *
 * @author nagis
 */
@WebServlet(name = "AdminAccountController", urlPatterns = {"/admin-account"})
public class AdminAccountController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserService uService = new UserService();
        UserDAO dao = new UserDAO();

        switch (action) {
            case "add":
                request.getRequestDispatcher("Admin/view/add-account.jsp").forward(request, response);
                break;
            case "edit": {
                int userid = Integer.parseInt(request.getParameter("userid"));
                Users user = dao.getUserByID(userid);
                Status status[] = Users.Status.values();
                request.setAttribute("user", user);
                request.setAttribute("status", status);
                request.getRequestDispatcher("Admin/view/edit-account.jsp").forward(request, response);
                break;
            }
            case "delete": {
                int userid = Integer.parseInt(request.getParameter("userid"));
                dao.updateUserDelete(userid);
                response.sendRedirect("admin-dashboard?service=manageAccount");
                break;
            }
            case "ban": { // display ban user page
                int userID;
                try {
                    userID = Integer.parseInt(request.getParameter("userid"));
                } catch (NumberFormatException numberEx) {
                    // TODO: Use 404 error page of admin instead
                    response.sendRedirect("admin-dashboard?service=manageAccount");
                    return;
                }

                Users user = uService.getUserByID(userID);
                if (user == null) {
                    request.setAttribute("msg", "Sorry, something went wrong");
                    request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                    return;
                }
                request.setAttribute("user", user);
                request.getRequestDispatcher("Admin/view/account-ban.jsp").forward(request, response);
                return;
            }
            case "add-point": { // display add point to landlord form
                int userID;
                try {
                    userID = Integer.parseInt(request.getParameter("userId"));
                    // check for user existence
                    Users user = uService.getUserByID(userID);
                    if (user == null) {
                        request.setAttribute("msg", "Sorry, something went wrong");
                        request.getRequestDispatcher("404-error-page.jsp").forward(request, response);
                        return;
                    }

                    // if user exists
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("Admin/view/add-point.jsp").forward(request, response);
                    return;
                } catch (NumberFormatException numEx) {
                    System.out.println("Add point to landlord doGet: " + numEx.getMessage());
                    response.sendRedirect("admin-dashboard");
                    return;
                }
            }
            case "unban": {
                try {
                    int userId = Integer.parseInt(request.getParameter("userid"));
                    uService.unbanUser(userId);
                    response.sendRedirect("admin-dashboard?service=account-utils");
                    return;
                } catch (NumberFormatException numEx) {
                    System.out.println("Unban in doGet " + numEx.getMessage());
                } catch (Exception ex) {
                    // TODO: Create an 404-error page for admin to display error message
                    System.out.println("Unban user doGet: " + ex.getMessage());
                }
                response.sendRedirect("admin-dashboard");
                return;
            }
            default:
                break;
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
        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();
        UserService uService = new UserService();
        //Construct regular expression to validate email and phone fields
        String regexPhone = "(84|0[1|3|5|7|8|9])+([0-9]{8})\\b";
        String regexCivilID = "0[0-9]{2}[0-3][0-9]{8}\\b";
        String regexPassword = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{6,}$";

        //Compile regular expressions
        Pattern p_phone = Pattern.compile(regexPhone);
        Pattern p_civilid = Pattern.compile(regexCivilID);
        Pattern p_password = Pattern.compile(regexPassword);

        //Pattern class contains matcher() method to find matching between given input and regex
        Matcher m_phone, m_civilid, m_password;

        if (action.equals("add")) {
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            m_phone = p_phone.matcher(phone);
            m_password = p_password.matcher(password);

            if (!m_phone.matches()) {               // phone mismatch
                request.setAttribute("message", "Please input valid phone number.");
                request.getRequestDispatcher("Admin/view/add-account.jsp").forward(request, response);
            } else if (!m_password.matches()) {     //password mismatch
                request.setAttribute("message", "Please input valid password. A valid password must be at least 6 characters long, 1 lowercase, 1 uppercase and 1 special symbols.");
                request.getRequestDispatcher("Admin/view/add-account.jsp").forward(request, response);
            } else {
                Users admin = dao.getUserByEmailRole(email, 3);
                if (admin != null) {
                    request.setAttribute("message", "The email you enter already exists. Please input a different email.");
                    request.getRequestDispatcher("Admin/view/add-account.jsp").forward(request, response);
                } else {
                    uService.addUser(email, fname, lname, phone, password);
                    response.sendRedirect("admin-dashboard?service=manageAccount");
                }
            }
        } else if (action.equals("edit")) {
            int userid = Integer.parseInt(request.getParameter("userid"));
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String civilid = request.getParameter("civilid");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            m_phone = p_phone.matcher(phone);

            if (!m_phone.matches()) {       // phone mismatch
                request.setAttribute("message", "Please input valid phone number.");
                Users user = dao.getUserByID(userid);
                request.setAttribute("user", user);
                request.setAttribute("status", Users.Status.values());
                request.getRequestDispatcher("Admin/view/edit-account.jsp").forward(request, response);
            } else {                               // both input matches
                //Update information based on user's role
                switch (role) {
                    case "Admin":
                        dao.updateUserInfo(userid, email, status);
                        AdminDAO dao_a = new AdminDAO();
                        dao_a.updateAdminInfo(userid, fname, lname, phone);
                        response.sendRedirect("admin-dashboard?service=manageAccount");
                        break;
                    case "Tenant":
                        m_civilid = p_civilid.matcher(civilid);
                        if (!m_civilid.matches()) {
                            request.setAttribute("message", "Please input valid civil ID.");
                            Users user = dao.getUserByID(userid);
                            request.setAttribute("user", user);
                            request.setAttribute("status", Users.Status.values());
                            request.getRequestDispatcher("Admin/view/edit-account.jsp").forward(request, response);
                        } else {
                            dao.updateUserInfo(userid, email, status);
                            TenantDAO dao_t = new TenantDAO();
                            dao_t.updateTenantInfo(userid, fname, lname, civilid, address, phone);
                            response.sendRedirect("admin-dashboard?service=manageAccount");
                        }
                        break;
                    case "Landlord":
                        m_civilid = p_civilid.matcher(civilid);
                        if (!m_civilid.matches()) {
                            request.setAttribute("message", "Please input valid civil ID.");
                            Users user = dao.getUserByID(userid);
                            request.setAttribute("user", user);
                            request.setAttribute("status", Users.Status.values());
                            request.getRequestDispatcher("Admin/view/edit-account.jsp").forward(request, response);
                        } else {
                            dao.updateUserInfo(userid, email, status);
                            LandlordDAO dao_l = new LandlordDAO();
                            dao_l.updateLandlordInfo(userid, fname, lname, civilid, address, phone);
                            response.sendRedirect("admin-dashboard?service=manageAccount");
                        }
                        break;
                }
            }
        } else if (action.equals("ban")) {
            int userID;
            int duration;
            try {
                userID = Integer.parseInt(request.getParameter("userID"));
                duration = Integer.parseInt(request.getParameter("duration"));
            } catch (NumberFormatException numberEx) {
                System.out.println("Banning error " + numberEx.getMessage());
                response.sendRedirect("admin-dashboard?service=manageAccount");
                return;
            }

            // If this account exist
            uService.banUser(userID, duration);
            response.sendRedirect("admin-dashboard?service=account-utils");
            return;

        } else if (action.equals("add-point")) {
            int userID;
            int amount;
            try {
                userID = Integer.parseInt(request.getParameter("userId"));
                amount = Integer.parseInt(request.getParameter("amount"));
                LandlordService lService = new LandlordService();
                lService.addPoint(userID, amount);
            } catch (NumberFormatException numEx) {
                System.out.println("doPost add point " + numEx.getMessage());

            } catch (IllegalArgumentException illArgEx) {
                System.out.println("doPost add point " + illArgEx.getMessage());

            } catch (Exception ex) {
                System.out.println("doPost add point " + ex.getMessage());

            }
            response.sendRedirect("admin-dashboard?service=manageAccount");
            return;
        }

    }

}
