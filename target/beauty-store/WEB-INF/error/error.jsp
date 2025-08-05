<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error | Beauty Store</title>
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .error-container {
            text-align: center;
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 90%;
        }

        .error-icon {
            font-size: 5rem;
            color: #ffc107;
            margin-bottom: 1rem;
        }

        .error-title {
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .error-message {
            color: #666;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        .error-details {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            text-align: left;
            font-family: monospace;
            font-size: 0.9rem;
            color: #666;
            max-height: 200px;
            overflow-y: auto;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-block;
            margin: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
        }

        .btn-secondary:hover {
            background: #667eea;
            color: white;
        }

        .navigation-links {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid #e1e5e9;
        }

        .navigation-links a {
            color: #667eea;
            text-decoration: none;
            margin: 0 1rem;
            font-weight: 500;
        }

        .navigation-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        
        <h1 class="error-title">Oops! Something went wrong</h1>
        
        <p class="error-message">
            We encountered an unexpected error. Please try again or contact support if the problem persists.
        </p>
        
        <c:if test="${error != null}">
            <div class="error-details">
                <strong>Error Details:</strong><br>
                ${error}
            </div>
        </c:if>
        
        <div>
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                <i class="fas fa-home"></i> Go Home
            </a>
            <a href="javascript:history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Go Back
            </a>
        </div>
        
        <div class="navigation-links">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/products">Products</a>
            <a href="${pageContext.request.contextPath}/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</body>
</html> 