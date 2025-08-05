package com.beauty.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beauty.dao.UserDAO;
import com.beauty.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Forward to register page
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        String errorMessage = null;

        // Validate input
        if (username == null || username.trim().isEmpty()) {
            errorMessage = "Username is required";
        } else if (email == null || email.trim().isEmpty()) {
            errorMessage = "Email is required";
        } else if (password == null || password.trim().isEmpty()) {
            errorMessage = "Password is required";
        } else if (confirmPassword == null || !password.equals(confirmPassword)) {
            errorMessage = "Passwords do not match";
        } else if (firstName == null || firstName.trim().isEmpty()) {
            errorMessage = "First name is required";
        } else if (lastName == null || lastName.trim().isEmpty()) {
            errorMessage = "Last name is required";
        } else if (password.length() < 6) {
            errorMessage = "Password must be at least 6 characters long";
        } else {
            try {
                // Check if username already exists
                if (userDAO.isUsernameExists(username)) {
                    errorMessage = "Username already exists";
                } else if (userDAO.isEmailExists(email)) {
                    errorMessage = "Email already exists";
                } else {
                    // Create new user
                    User newUser = new User();
                    newUser.setUsername(username);
                    newUser.setEmail(email);
                    newUser.setPassword(password); // In production, hash the password
                    newUser.setFirstName(firstName);
                    newUser.setLastName(lastName);
                    newUser.setPhone(phone);
                    newUser.setAddress(address);
                    newUser.setRole("user"); // Default role
                    
                    userDAO.createUser(newUser);
                    
                    // Redirect to login page with success message
                    response.sendRedirect(request.getContextPath() + "/login?success=Registration successful! Please login.");
                    return;
                }
                
            } catch (SQLException e) {
                errorMessage = "Database error occurred: " + e.getMessage();
            }
        }

        // If there's an error, forward back to register page with error message
        request.setAttribute("error", errorMessage);
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }
} 