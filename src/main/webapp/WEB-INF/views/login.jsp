<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Beauty Store</title>
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

        .container {
            max-width: 400px;
            width: 100%;
            padding: 0 20px;
        }

        .login-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .logo i {
            margin-right: 10px;
            color: #ffd700;
        }

        h1 {
            color: #333;
            margin-bottom: 1rem;
            font-size: 1.8rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .input-icon input {
            padding-left: 40px;
        }

        .btn {
            width: 100%;
            padding: 0.8rem;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
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
            margin-top: 1rem;
        }

        .btn-secondary:hover {
            background: #667eea;
            color: white;
        }

        .alert {
            padding: 0.8rem;
            margin-bottom: 1rem;
            border-radius: 8px;
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

        .form-footer {
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e1e5e9;
        }

        .form-footer p {
            color: #666;
            margin-bottom: 0.5rem;
        }

        .demo-credentials {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.9rem;
            color: #666;
        }

        .demo-credentials h4 {
            color: #333;
            margin-bottom: 0.5rem;
        }

        .demo-credentials ul {
            list-style: none;
            text-align: left;
        }

        .demo-credentials li {
            margin-bottom: 0.3rem;
        }

        .demo-credentials strong {
            color: #667eea;
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 10px;
            }
            
            .login-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-card">
            <div class="logo">
                <i class="fas fa-spa"></i>Beauty Store
            </div>
            
            <h1>Welcome Back</h1>
            <p style="color: #666; margin-bottom: 2rem;">Sign in to your account</p>

            <!-- Alert Messages -->
            <c:if test="${param.success != null}">
                <div class="alert alert-success">
                    ${param.success}
                </div>
            </c:if>

            <c:if test="${param.error != null}">
                <div class="alert alert-error">
                    ${param.error}
                </div>
            </c:if>

            <c:if test="${error != null}">
                <div class="alert alert-error">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" name="username" value="${username}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt"></i> Sign In
                </button>
            </form>

            <div class="form-footer">
                <p>Don't have an account?</p>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">
                    <i class="fas fa-user-plus"></i> Create Account
                </a>
            </div>

            <div class="demo-credentials">
                <h4>Demo Credentials:</h4>
                <ul>
                    <li><strong>Admin:</strong> admin / password123</li>
                    <li><strong>User:</strong> john_doe / password123</li>
                    <li><strong>User:</strong> jane_smith / password123</li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            
            if (username === '') {
                alert('Please enter your username');
                return false;
            }
            
            if (password === '') {
                alert('Please enter your password');
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html> 