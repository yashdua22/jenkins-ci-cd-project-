package com.beauty.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beauty.model.User;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        // Check if user is logged in
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        // Allow access to login and register pages
        if (requestURI.equals(contextPath + "/login") || 
            requestURI.equals(contextPath + "/register") ||
            requestURI.equals(contextPath + "/") ||
            requestURI.equals(contextPath + "/index.jsp") ||
            requestURI.equals(contextPath + "/home")) {
            chain.doFilter(request, response);
            return;
        }

        // Check for admin access
        if (requestURI.startsWith(contextPath + "/admin/")) {
            if (!isLoggedIn) {
                httpResponse.sendRedirect(contextPath + "/login?error=Please login to access admin area");
                return;
            }
            
            User user = (User) session.getAttribute("user");
            if (user == null || !"admin".equals(user.getRole())) {
                httpResponse.sendRedirect(contextPath + "/login?error=Admin access required");
                return;
            }
        }

        // Check for user area access
        if (requestURI.startsWith(contextPath + "/user/")) {
            if (!isLoggedIn) {
                httpResponse.sendRedirect(contextPath + "/login?error=Please login to access user area");
                return;
            }
        }

        // Continue with the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Clean up resources if needed
    }
} 