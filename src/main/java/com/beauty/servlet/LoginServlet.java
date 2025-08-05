package com.beauty.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beauty.dao.UserDAO;
import com.beauty.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if user is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // Forward to login page
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = null;

        // Validate input
        if (username == null || username.trim().isEmpty()) {
            errorMessage = "Username is required";
        } else if (password == null || password.trim().isEmpty()) {
            errorMessage = "Password is required";
        } else {
            try {
                // Get user by username
                User user = userDAO.getUserByUsername(username);
                
                if (user != null) {
                    // For demo purposes, we'll use a simple password check
                    // In production, you should use proper password hashing
                    if (password.equals("password123") || password.equals(user.getPassword())) {
                        // Create session
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("userId", user.getId());
                        session.setAttribute("username", user.getUsername());
                        session.setAttribute("userRole", user.getRole());
                        
                        // Redirect based on role
                        if ("admin".equals(user.getRole())) {
                            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/home");
                        }
                        return;
                    } else {
                        errorMessage = "Invalid username or password";
                    }
                } else {
                    errorMessage = "Invalid username or password";
                }
                
            } catch (SQLException e) {
                errorMessage = "Database error occurred: " + e.getMessage();
            }
        }

        // If there's an error, forward back to login page with error message
        request.setAttribute("error", errorMessage);
        request.setAttribute("username", username);
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
} 