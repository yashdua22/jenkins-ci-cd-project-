package com.beauty.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beauty.dao.CategoryDAO;
import com.beauty.dao.ProductDAO;
import com.beauty.model.Category;
import com.beauty.model.Product;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String categoryId = request.getParameter("id");
        
        try {
            if (categoryId != null && !categoryId.trim().isEmpty()) {
                // Get specific category and its products
                int catId = Integer.parseInt(categoryId);
                Category category = categoryDAO.getCategoryById(catId);
                
                if (category != null && category.isActive()) {
                    List<Product> products = productDAO.getProductsByCategory(catId);
                    request.setAttribute("category", category);
                    request.setAttribute("products", products);
                    request.getRequestDispatcher("/WEB-INF/views/category.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Category not found");
                    request.getRequestDispatcher("/WEB-INF/error/404.jsp").forward(request, response);
                }
            } else {
                // Get all categories
                List<Category> categories = categoryDAO.getAllCategories();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/WEB-INF/views/categories.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("error", "Database error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/error/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID");
            request.getRequestDispatcher("/WEB-INF/error/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
} 