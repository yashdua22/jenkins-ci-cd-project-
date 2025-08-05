package com.beauty.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Product {
    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private BigDecimal salePrice;
    private int categoryId;
    private String imageUrl;
    private int stockQuantity;
    private boolean isActive;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Additional fields for display
    private Category category;

    // Default constructor
    public Product() {}

    // Constructor with all fields
    public Product(int id, String name, String description, BigDecimal price, 
                  BigDecimal salePrice, int categoryId, String imageUrl, 
                  int stockQuantity, boolean isActive, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.stockQuantity = stockQuantity;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Constructor without id and timestamps (for creating new products)
    public Product(String name, String description, BigDecimal price, 
                  BigDecimal salePrice, int categoryId, String imageUrl, 
                  int stockQuantity, boolean isActive) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.salePrice = salePrice;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.stockQuantity = stockQuantity;
        this.isActive = isActive;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    // Helper methods
    public BigDecimal getCurrentPrice() {
        return salePrice != null ? salePrice : price;
    }

    public boolean isOnSale() {
        return salePrice != null && salePrice.compareTo(price) < 0;
    }

    public BigDecimal getDiscountPercentage() {
        if (isOnSale()) {
            BigDecimal discount = price.subtract(salePrice);
            return discount.divide(price, 2, BigDecimal.ROUND_HALF_UP)
                    .multiply(new BigDecimal("100"));
        }
        return BigDecimal.ZERO;
    }

    public boolean isInStock() {
        return stockQuantity > 0;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", salePrice=" + salePrice +
                ", categoryId=" + categoryId +
                ", stockQuantity=" + stockQuantity +
                ", isActive=" + isActive +
                '}';
    }
} 