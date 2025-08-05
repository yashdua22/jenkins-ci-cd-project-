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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
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
        
        try {
            // Get featured products (products on sale)
            List<Product> featuredProducts = productDAO.getProductsOnSale();
            request.setAttribute("featuredProducts", featuredProducts);

            // Get all categories
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);

            // Get latest products
            List<Product> latestProducts = productDAO.getAllProducts();
            if (latestProducts.size() > 8) {
                latestProducts = latestProducts.subList(0, 8);
            }
            request.setAttribute("latestProducts", latestProducts);

            // Forward to home page
            request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("error", "Database error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/error/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
} 