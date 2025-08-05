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

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String categoryId = request.getParameter("category");
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");
        
        try {
            List<Product> products = null;
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);

            if (search != null && !search.trim().isEmpty()) {
                // Search products
                products = productDAO.searchProducts(search.trim());
                request.setAttribute("searchTerm", search);
            } else if (categoryId != null && !categoryId.trim().isEmpty()) {
                // Get products by category
                int catId = Integer.parseInt(categoryId);
                products = productDAO.getProductsByCategory(catId);
                Category selectedCategory = categoryDAO.getCategoryById(catId);
                request.setAttribute("selectedCategory", selectedCategory);
            } else {
                // Get all products
                products = productDAO.getAllProducts();
            }

            // Sort products if requested
            if (sort != null && !sort.trim().isEmpty()) {
                products = sortProducts(products, sort);
            }

            request.setAttribute("products", products);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("sort", sort);

            // Forward to products page
            request.getRequestDispatcher("/WEB-INF/views/products.jsp").forward(request, response);

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

    private List<Product> sortProducts(List<Product> products, String sort) {
        switch (sort) {
            case "name_asc":
                products.sort((p1, p2) -> p1.getName().compareToIgnoreCase(p2.getName()));
                break;
            case "name_desc":
                products.sort((p1, p2) -> p2.getName().compareToIgnoreCase(p1.getName()));
                break;
            case "price_asc":
                products.sort((p1, p2) -> p1.getCurrentPrice().compareTo(p2.getCurrentPrice()));
                break;
            case "price_desc":
                products.sort((p1, p2) -> p2.getCurrentPrice().compareTo(p1.getCurrentPrice()));
                break;
            case "newest":
                // Products are already sorted by creation date in DAO
                break;
            default:
                // Default sorting (by creation date)
                break;
        }
        return products;
    }
} 