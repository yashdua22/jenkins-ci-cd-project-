-- Beauty Store Database Schema and Dummy Data
-- Database: beauty_store

-- Create database
CREATE DATABASE IF NOT EXISTS beauty_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE beauty_store;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create categories table
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create products table
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2),
    category_id INT,
    image_url VARCHAR(255),
    stock_quantity INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    shipping_address TEXT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create order_items table
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insert dummy users
INSERT INTO users (username, email, password, first_name, last_name, phone, address, role) VALUES
('admin', 'admin@beautystore.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Admin', 'User', '555-0100', '123 Admin St, Beauty City, BC 12345', 'admin'),
('john_doe', 'john@example.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'John', 'Doe', '555-0101', '456 Main St, Beauty City, BC 12345', 'user'),
('jane_smith', 'jane@example.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Jane', 'Smith', '555-0102', '789 Oak Ave, Beauty City, BC 12345', 'user'),
('mike_wilson', 'mike@example.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Mike', 'Wilson', '555-0103', '321 Pine Rd, Beauty City, BC 12345', 'user'),
('sarah_jones', 'sarah@example.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Sarah', 'Jones', '555-0104', '654 Elm St, Beauty City, BC 12345', 'user');

-- Insert dummy categories
INSERT INTO categories (name, description, image_url) VALUES
('Skincare', 'Premium skincare products for all skin types', '/images/categories/skincare.jpg'),
('Makeup', 'Professional makeup products and cosmetics', '/images/categories/makeup.jpg'),
('Hair Care', 'Hair care products for all hair types', '/images/categories/haircare.jpg'),
('Fragrances', 'Luxury fragrances and perfumes', '/images/categories/fragrances.jpg'),
('Bath & Body', 'Bath and body care products', '/images/categories/bathbody.jpg'),
('Tools & Brushes', 'Professional beauty tools and brushes', '/images/categories/tools.jpg');

-- Insert dummy products
INSERT INTO products (name, description, price, sale_price, category_id, image_url, stock_quantity) VALUES
-- Skincare Products
('Hydrating Face Cream', 'Deeply hydrating face cream with hyaluronic acid', 45.99, 39.99, 1, '/images/products/face-cream.jpg', 50),
('Vitamin C Serum', 'Brightening vitamin C serum for radiant skin', 32.99, NULL, 1, '/images/products/vitamin-c-serum.jpg', 30),
('Gentle Cleanser', 'Gentle daily cleanser for all skin types', 28.99, 24.99, 1, '/images/products/cleanser.jpg', 40),
('Retinol Night Cream', 'Anti-aging retinol night cream', 58.99, NULL, 1, '/images/products/retinol-cream.jpg', 25),
('Sunscreen SPF 50', 'Broad spectrum sunscreen for daily protection', 35.99, 29.99, 1, '/images/products/sunscreen.jpg', 60),

-- Makeup Products
('Foundation Pro', 'Long-lasting foundation with natural finish', 42.99, NULL, 2, '/images/products/foundation.jpg', 35),
('Matte Lipstick', 'Long-wearing matte lipstick in various shades', 24.99, 19.99, 2, '/images/products/lipstick.jpg', 45),
('Eyeshadow Palette', 'Professional eyeshadow palette with 18 shades', 65.99, 55.99, 2, '/images/products/eyeshadow.jpg', 20),
('Mascara Volume', 'Volumizing mascara for dramatic lashes', 29.99, NULL, 2, '/images/products/mascara.jpg', 50),
('Concealer Stick', 'Creamy concealer for flawless coverage', 26.99, 22.99, 2, '/images/products/concealer.jpg', 40),

-- Hair Care Products
('Shampoo & Conditioner Set', 'Nourishing shampoo and conditioner duo', 38.99, 32.99, 3, '/images/products/shampoo-set.jpg', 30),
('Hair Mask Treatment', 'Deep conditioning hair mask', 25.99, NULL, 3, '/images/products/hair-mask.jpg', 25),
('Heat Protectant Spray', 'Thermal protection spray for heat styling', 22.99, 18.99, 3, '/images/products/heat-protectant.jpg', 35),
('Hair Oil Serum', 'Argan oil hair serum for shine and repair', 34.99, NULL, 3, '/images/products/hair-oil.jpg', 20),
('Dry Shampoo', 'Refreshing dry shampoo for volume', 19.99, 16.99, 3, '/images/products/dry-shampoo.jpg', 45),

-- Fragrances
('Floral Perfume', 'Elegant floral fragrance for women', 89.99, 75.99, 4, '/images/products/floral-perfume.jpg', 15),
('Woody Cologne', 'Sophisticated woody cologne for men', 95.99, NULL, 4, '/images/products/woody-cologne.jpg', 12),
('Fresh Body Mist', 'Light and fresh body mist', 28.99, 24.99, 4, '/images/products/body-mist.jpg', 30),
('Vanilla Perfume', 'Warm vanilla fragrance', 65.99, 55.99, 4, '/images/products/vanilla-perfume.jpg', 18),

-- Bath & Body
('Luxury Body Wash', 'Moisturizing body wash with natural oils', 32.99, 28.99, 5, '/images/products/body-wash.jpg', 40),
('Hand Cream', 'Nourishing hand cream with shea butter', 18.99, NULL, 5, '/images/products/hand-cream.jpg', 55),
('Body Lotion', 'Hydrating body lotion for smooth skin', 26.99, 22.99, 5, '/images/products/body-lotion.jpg', 35),
('Bath Bombs Set', 'Relaxing bath bombs in various scents', 24.99, 19.99, 5, '/images/products/bath-bombs.jpg', 25),

-- Tools & Brushes
('Foundation Brush Set', 'Professional foundation brush set', 45.99, 38.99, 6, '/images/products/foundation-brushes.jpg', 20),
('Eyeshadow Brush Set', 'Complete eyeshadow brush collection', 38.99, 32.99, 6, '/images/products/eyeshadow-brushes.jpg', 25),
('Hair Dryer Pro', 'Professional hair dryer with diffuser', 129.99, 109.99, 6, '/images/products/hair-dryer.jpg', 10),
('Makeup Mirror', 'LED makeup mirror with magnification', 89.99, NULL, 6, '/images/products/makeup-mirror.jpg', 15),
('Curling Iron', 'Professional curling iron with temperature control', 79.99, 65.99, 6, '/images/products/curling-iron.jpg', 12);

-- Insert dummy orders
INSERT INTO orders (user_id, total_amount, status, shipping_address) VALUES
(2, 89.97, 'delivered', '456 Main St, Beauty City, BC 12345'),
(3, 156.95, 'shipped', '789 Oak Ave, Beauty City, BC 12345'),
(4, 234.92, 'processing', '321 Pine Rd, Beauty City, BC 12345'),
(5, 67.98, 'pending', '654 Elm St, Beauty City, BC 12345');

-- Insert dummy order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 39.99),
(1, 7, 1, 42.99),
(1, 12, 1, 6.99),
(2, 3, 2, 24.99),
(2, 8, 1, 19.99),
(2, 15, 1, 75.99),
(2, 20, 1, 35.99),
(3, 9, 1, 55.99),
(3, 16, 1, 95.99),
(3, 22, 1, 38.99),
(3, 25, 1, 44.99),
(4, 5, 1, 29.99),
(4, 11, 1, 32.99),
(4, 18, 1, 5.99);

-- Create indexes for better performance
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_active ON products(is_active);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- Create database user for application
CREATE USER IF NOT EXISTS 'beauty_user'@'localhost' IDENTIFIED BY 'beauty_pass123';
GRANT ALL PRIVILEGES ON beauty_store.* TO 'beauty_user'@'localhost';
FLUSH PRIVILEGES; 