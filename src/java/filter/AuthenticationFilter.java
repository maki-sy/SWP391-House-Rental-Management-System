/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Users;

/**
 *
 * @author DTS
 */
public class AuthenticationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) sr;
        HttpServletResponse response = (HttpServletResponse) sr1;
        HttpSession session = request.getSession();

        String url = request.getRequestURI();
        
        System.out.println(url);

        // filter URI begins with admin-*
        if (url.matches("/SWP391-House-Rental-Management/admin[\\s\\S]*")) {
            // check whether user logged in
            Users user = (Users) session.getAttribute("user");
            if (user != null) { // if user already logged in
                if (user.getRoleID() == 3) { // Admin role
                    fc.doFilter(sr, sr1);
                } else { // logged account is not admin
                    response.sendRedirect(request.getContextPath() + "/trang-chu");
                }
            } else {
                // check whether user trying to access admin-login to prevent infinite loop
                if(url.matches("/SWP391-House-Rental-Management/admin-login[\\s\\S]*")){
                    fc.doFilter(sr, sr1);
                    return;
                }
                response.sendRedirect(request.getContextPath() + "/admin-login?service=login");
            }
        } else {
            fc.doFilter(sr, sr1);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
