<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Beauty Store</title>
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

        /* Page Header */
        .page-header {
            background: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .page-title {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .page-subtitle {
            color: #666;
            font-size: 1.1rem;
        }

        /* Filters Section */
        .filters {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .filters-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            align-items: end;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }

        .filter-buttons {
            display: flex;
            gap: 1rem;
            align-items: end;
        }

        .btn-filter {
            padding: 0.8rem 1.5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-filter:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-clear {
            padding: 0.8rem 1.5rem;
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-clear:hover {
            background: #667eea;
            color: white;
        }

        /* Products Grid */
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

        .sort-select {
            padding: 0.5rem 1rem;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
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

        .product-category {
            color: #667eea;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
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

        /* No Results */
        .no-results {
            text-align: center;
            padding: 3rem;
            color: #666;
        }

        .no-results i {
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

            .filters-grid {
                grid-template-columns: 1fr;
            }

            .filter-buttons {
                flex-direction: column;
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

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1 class="page-title">Our Products</h1>
            <p class="page-subtitle">Discover our premium collection of beauty products</p>
        </div>
    </section>

    <!-- Filters Section -->
    <section class="filters">
        <div class="container">
            <form action="${pageContext.request.contextPath}/products" method="get">
                <div class="filters-grid">
                    <div class="form-group">
                        <label for="search">Search Products</label>
                        <input type="text" id="search" name="search" value="${searchTerm}" placeholder="Search by name or description...">
                    </div>
                    
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select id="category" name="category">
                            <option value="">All Categories</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}" ${categoryId == category.id ? 'selected' : ''}>
                                    ${category.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="sort">Sort By</label>
                        <select id="sort" name="sort">
                            <option value="">Default</option>
                            <option value="name_asc" ${sort == 'name_asc' ? 'selected' : ''}>Name A-Z</option>
                            <option value="name_desc" ${sort == 'name_desc' ? 'selected' : ''}>Name Z-A</option>
                            <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>Price Low to High</option>
                            <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>Price High to Low</option>
                            <option value="newest" ${sort == 'newest' ? 'selected' : ''}>Newest First</option>
                        </select>
                    </div>
                    
                    <div class="filter-buttons">
                        <button type="submit" class="btn-filter">
                            <i class="fas fa-search"></i> Search
                        </button>
                        <a href="${pageContext.request.contextPath}/products" class="btn-clear">
                            <i class="fas fa-times"></i> Clear
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <!-- Products Section -->
    <section class="products-section">
        <div class="container">
            <div class="products-header">
                <div class="products-count">
                    <c:choose>
                        <c:when test="${searchTerm != null}">
                            Found ${products.size()} products for "${searchTerm}"
                        </c:when>
                        <c:when test="${selectedCategory != null}">
                            ${products.size()} products in ${selectedCategory.name}
                        </c:when>
                        <c:otherwise>
                            ${products.size()} products available
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div>
                    <select class="sort-select" onchange="this.form.submit()" form="sortForm">
                        <option value="">Sort by...</option>
                        <option value="name_asc" ${sort == 'name_asc' ? 'selected' : ''}>Name A-Z</option>
                        <option value="name_desc" ${sort == 'name_desc' ? 'selected' : ''}>Name Z-A</option>
                        <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>Price Low to High</option>
                        <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>Price High to Low</option>
                        <option value="newest" ${sort == 'newest' ? 'selected' : ''}>Newest First</option>
                    </select>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty products}">
                    <div class="no-results">
                        <i class="fas fa-search"></i>
                        <h3>No products found</h3>
                        <p>Try adjusting your search criteria or browse all categories.</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">
                            Browse All Products
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
                                    <div class="product-category">
                                        <c:if test="${product.category != null}">
                                            ${product.category.name}
                                        </c:if>
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

    <form id="sortForm" action="${pageContext.request.contextPath}/products" method="get">
        <c:if test="${searchTerm != null}">
            <input type="hidden" name="search" value="${searchTerm}">
        </c:if>
        <c:if test="${categoryId != null}">
            <input type="hidden" name="category" value="${categoryId}">
        </c:if>
    </form>
</body>
</html> 