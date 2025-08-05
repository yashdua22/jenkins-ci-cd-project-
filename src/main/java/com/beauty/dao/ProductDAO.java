package com.beauty.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.beauty.model.Category;
import com.beauty.model.Product;
import com.beauty.util.DatabaseUtil;

public class ProductDAO {
    
    public Product createProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (name, description, price, sale_price, category_id, " +
                    "image_url, stock_quantity, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setBigDecimal(4, product.getSalePrice());
            stmt.setInt(5, product.getCategoryId());
            stmt.setString(6, product.getImageUrl());
            stmt.setInt(7, product.getStockQuantity());
            stmt.setBoolean(8, product.isActive());
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    product.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
            
            return product;
        }
    }
    
    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id WHERE p.id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToProduct(rs);
                }
            }
        }
        return null;
    }
    
    public List<Product> getAllProducts() throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = true ORDER BY p.created_at DESC";
        
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }
    
    public List<Product> getProductsByCategory(int categoryId) throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.category_id = ? AND p.is_active = true ORDER BY p.name";
        
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, categoryId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }
    
    public List<Product> searchProducts(String searchTerm) throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = true AND (p.name LIKE ? OR p.description LIKE ?) " +
                    "ORDER BY p.name";
        
        List<Product> products = new ArrayList<>();
        String searchPattern = "%" + searchTerm + "%";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }
    
    public List<Product> getProductsOnSale() throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = true AND p.sale_price IS NOT NULL " +
                    "ORDER BY (p.price - p.sale_price) DESC";
        
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }
    
    public List<Product> getProductsInStock() throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, c.description as category_description " +
                    "FROM products p LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = true AND p.stock_quantity > 0 " +
                    "ORDER BY p.stock_quantity DESC";
        
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }
    
    public boolean updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, sale_price = ?, " +
                    "category_id = ?, image_url = ?, stock_quantity = ?, is_active = ?, " +
                    "updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setBigDecimal(3, product.getPrice());
            stmt.setBigDecimal(4, product.getSalePrice());
            stmt.setInt(5, product.getCategoryId());
            stmt.setString(6, product.getImageUrl());
            stmt.setInt(7, product.getStockQuantity());
            stmt.setBoolean(8, product.isActive());
            stmt.setInt(9, product.getId());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean updateStockQuantity(int productId, int newQuantity) throws SQLException {
        String sql = "UPDATE products SET stock_quantity = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, newQuantity);
            stmt.setInt(2, productId);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean deactivateProduct(int id) throws SQLException {
        String sql = "UPDATE products SET is_active = false, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setDescription(rs.getString("description"));
        product.setPrice(rs.getBigDecimal("price"));
        product.setSalePrice(rs.getBigDecimal("sale_price"));
        product.setCategoryId(rs.getInt("category_id"));
        product.setImageUrl(rs.getString("image_url"));
        product.setStockQuantity(rs.getInt("stock_quantity"));
        product.setActive(rs.getBoolean("is_active"));
        product.setCreatedAt(rs.getTimestamp("created_at"));
        product.setUpdatedAt(rs.getTimestamp("updated_at"));
        
        // Set category information if available
        String categoryName = rs.getString("category_name");
        if (categoryName != null) {
            Category category = new Category();
            category.setId(rs.getInt("category_id"));
            category.setName(categoryName);
            category.setDescription(rs.getString("category_description"));
            product.setCategory(category);
        }
        
        return product;
    }
} 