<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${category.name} - Beauty Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header */
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
        }

        .logo i {
            margin-right: 10px;
            color: #ffd700;
        }

        nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #ffd700;
        }

        .user-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background: white;
            color: #667eea;
        }

        /* Category Header */
        .category-header {
            background: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .category-icon {
            font-size: 4rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .category-title {
            font-size: 3rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .category-description {
            color: #666;
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .breadcrumb {
            background: white;
            padding: 1rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .breadcrumb a {
            color: #667eea;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        /* Products Section */
        .products-section {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .products-count {
            color: #666;
            font-size: 1.1rem;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-decoration: none;
            color: inherit;
            border: 1px solid #e1e5e9;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            height: 200px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
        }

        .product-content {
            padding: 1.5rem;
        }

        .product-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .product-description {
            color: #666;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            line-height: 1.4;
        }

        .product-price {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .current-price {
            font-size: 1.3rem;
            font-weight: 700;
            color: #667eea;
        }

        .original-price {
            font-size: 1rem;
            color: #999;
            text-decoration: line-through;
        }

        .sale-badge {
            background: #ff6b6b;
            color: white;
            padding: 0.2rem 0.5rem;
            border-radius: 5px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .stock-status {
            font-size: 0.9rem;
        }

        .in-stock {
            color: #28a745;
        }

        .out-of-stock {
            color: #dc3545;
        }

        /* No Products */
        .no-products {
            text-align: center;
            padding: 3rem;
            color: #666;
        }

        .no-products i {
            font-size: 4rem;
            color: #ddd;
            margin-bottom: 1rem;
        }

        /* Footer */
        footer {
            background: #333;
            color: white;
            padding: 3rem 0 1rem;
            text-align: center;
            margin-top: 3rem;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            margin-bottom: 1rem;
            color: #ffd700;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        .footer-section a {
            color: #ccc;
            text-decoration: none;
        }

        .footer-section a:hover {
            color: #ffd700;
        }

        .footer-bottom {
            border-top: 1px solid #555;
            padding-top: 1rem;
            color: #ccc;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            nav ul {
                flex-direction: column;
                gap: 1rem;
            }

            .category-title {
                font-size: 2rem;
            }

            .products-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .products-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-content">
                <a href="${pageContext.request.contextPath}/" class="logo">
                    <i class="fas fa-spa"></i>Beauty Store
                </a>
                <nav>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </nav>
                <div class="user-actions">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <span>Welcome, ${sessionScope.user.firstName}!</span>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-secondary">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">Login</a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>

    <!-- Breadcrumb -->
    <section class="breadcrumb">
        <div class="container">
            <a href="${pageContext.request.contextPath}/">Home</a> &gt; 
            <a href="${pageContext.request.contextPath}/categories">Categories</a> &gt; 
            <span>${category.name}</span>
        </div>
    </section>

    <!-- Category Header -->
    <section class="category-header">
        <div class="container">
            <div class="category-icon">
                <i class="fas fa-spa"></i>
            </div>
            <h1 class="category-title">${category.name}</h1>
            <p class="category-description">${category.description}</p>
        </div>
    </section>

    <!-- Products Section -->
    <section class="products-section">
        <div class="container">
            <div class="products-header">
                <div class="products-count">
                    ${products.size()} products in ${category.name}
                </div>
            </div>

            <c:choose>
                <c:when test="${empty products}">
                    <div class="no-products">
                        <i class="fas fa-box-open"></i>
                        <h3>No products found in this category</h3>
                        <p>We're working on adding more products to this category. Please check back soon!</p>
                        <a href="${pageContext.request.contextPath}/categories" class="btn btn-primary">
                            Browse Other Categories
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="products-grid">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <div class="product-image">
                                    <i class="fas fa-gem"></i>
                                </div>
                                <div class="product-content">
                                    <h3 class="product-title">${product.name}</h3>
                                    <p class="product-description">${product.description}</p>
                                    <div class="product-price">
                                        <c:choose>
                                            <c:when test="${product.onSale}">
                                                <span class="current-price">$${product.salePrice}</span>
                                                <span class="original-price">$${product.price}</span>
                                                <span class="sale-badge">SALE</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="current-price">$${product.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="stock-status">
                                        <c:choose>
                                            <c:when test="${product.inStock}">
                                                <span class="in-stock">✓ In Stock (${product.stockQuantity})</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="out-of-stock">✗ Out of Stock</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Beauty Store</h3>
                    <p>Your premium destination for beauty products. We believe everyone deserves to feel beautiful and confident.</p>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
                        <li><a href="#about">About Us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Customer Service</h3>
                    <ul>
                        <li><a href="#contact">Contact Us</a></li>
                        <li><a href="#shipping">Shipping Info</a></li>
                        <li><a href="#returns">Returns</a></li>
                        <li><a href="#faq">FAQ</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Connect With Us</h3>
                    <ul>
                        <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i> Twitter</a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i> YouTube</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Beauty Store. All rights reserved. | Privacy Policy | Terms of Service</p>
            </div>
        </div>
    </footer>
</body>
</html> 