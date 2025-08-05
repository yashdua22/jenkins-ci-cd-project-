<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty Store - Your Premium Beauty Destination</title>
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

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 0;
            text-align: center;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Features Section */
        .features {
            padding: 4rem 0;
            background: white;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            text-align: center;
            padding: 2rem;
            border-radius: 15px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-card i {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .feature-card h3 {
            margin-bottom: 1rem;
            color: #333;
        }

        /* Categories Section */
        .categories {
            padding: 4rem 0;
            background: #f8f9fa;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: #333;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
        }

        .category-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-decoration: none;
            color: inherit;
        }

        .category-card:hover {
            transform: translateY(-5px);
        }

        .category-image {
            height: 150px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
        }

        .category-content {
            padding: 1.5rem;
            text-align: center;
        }

        .category-content h3 {
            margin-bottom: 0.5rem;
            color: #333;
        }

        .category-content p {
            color: #666;
            font-size: 0.9rem;
        }

        /* Footer */
        footer {
            background: #333;
            color: white;
            padding: 3rem 0 1rem;
            text-align: center;
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

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }
        }

        /* Alert Messages */
        .alert {
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 5px;
            text-align: center;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
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

    <!-- Alert Messages -->
    <c:if test="${param.success != null}">
        <div class="container">
            <div class="alert alert-success">
                ${param.success}
            </div>
        </div>
    </c:if>

    <c:if test="${param.error != null}">
        <div class="container">
            <div class="alert alert-error">
                ${param.error}
            </div>
        </div>
    </c:if>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Discover Your Natural Beauty</h1>
            <p>Premium beauty products for every skin type and style. Shop our curated collection of skincare, makeup, and beauty essentials.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Shop Now</a>
                <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Browse Categories</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2 class="section-title">Why Choose Beauty Store?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <i class="fas fa-shipping-fast"></i>
                    <h3>Fast Shipping</h3>
                    <p>Free shipping on orders over $50. Get your beauty products delivered to your doorstep.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-medal"></i>
                    <h3>Premium Quality</h3>
                    <p>All our products are carefully selected and tested for quality and effectiveness.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-heart"></i>
                    <h3>Customer Love</h3>
                    <p>Join thousands of satisfied customers who trust us for their beauty needs.</p>
                </div>
                <div class="feature-card">
                    <i class="fas fa-shield-alt"></i>
                    <h3>Secure Shopping</h3>
                    <p>Your data is protected with industry-standard security measures.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories">
        <div class="container">
            <h2 class="section-title">Shop by Category</h2>
            <div class="categories-grid">
                <a href="${pageContext.request.contextPath}/categories?id=1" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-pump-soap"></i>
                    </div>
                    <div class="category-content">
                        <h3>Skincare</h3>
                        <p>Premium skincare products for all skin types</p>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/categories?id=2" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-palette"></i>
                    </div>
                    <div class="category-content">
                        <h3>Makeup</h3>
                        <p>Professional makeup products and cosmetics</p>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/categories?id=3" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-cut"></i>
                    </div>
                    <div class="category-content">
                        <h3>Hair Care</h3>
                        <p>Hair care products for all hair types</p>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/categories?id=4" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-spray-can"></i>
                    </div>
                    <div class="category-content">
                        <h3>Fragrances</h3>
                        <p>Luxury fragrances and perfumes</p>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/categories?id=5" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-bath"></i>
                    </div>
                    <div class="category-content">
                        <h3>Bath & Body</h3>
                        <p>Bath and body care products</p>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/categories?id=6" class="category-card">
                    <div class="category-image">
                        <i class="fas fa-brush"></i>
                    </div>
                    <div class="category-content">
                        <h3>Tools & Brushes</h3>
                        <p>Professional beauty tools and brushes</p>
                    </div>
                </a>
            </div>
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