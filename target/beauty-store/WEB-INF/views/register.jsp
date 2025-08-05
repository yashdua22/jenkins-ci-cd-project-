<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Beauty Store</title>
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
            padding: 2rem 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .register-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            text-align: center;
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
            text-align: center;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
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

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .form-footer {
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e1e5e9;
            text-align: center;
        }

        .form-footer p {
            color: #666;
            margin-bottom: 0.5rem;
        }

        .password-requirements {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.9rem;
            color: #666;
        }

        .password-requirements h4 {
            color: #333;
            margin-bottom: 0.5rem;
        }

        .password-requirements ul {
            list-style: none;
            text-align: left;
        }

        .password-requirements li {
            margin-bottom: 0.3rem;
        }

        .password-requirements li:before {
            content: "✓ ";
            color: #28a745;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 10px;
            }
            
            .register-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="register-card">
            <div class="logo">
                <i class="fas fa-spa"></i>Beauty Store
            </div>
            
            <h1>Create Your Account</h1>
            <p style="color: #666; margin-bottom: 2rem; text-align: center;">Join our beauty community today</p>

            <!-- Alert Messages -->
            <c:if test="${error != null}">
                <div class="alert alert-error">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return validateForm()">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name *</label>
                        <div class="input-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" id="firstName" name="firstName" value="${firstName}" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name *</label>
                        <div class="input-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" id="lastName" name="lastName" value="${lastName}" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username">Username *</label>
                    <div class="input-icon">
                        <i class="fas fa-at"></i>
                        <input type="text" id="username" name="username" value="${username}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <div class="input-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" value="${email}" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password *</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password *</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <div class="input-icon">
                        <i class="fas fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value="${phone}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <div class="input-icon">
                        <i class="fas fa-map-marker-alt"></i>
                        <input type="text" id="address" name="address" value="${address}">
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </form>

            <div class="form-footer">
                <p>Already have an account?</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">
                    <i class="fas fa-sign-in-alt"></i> Sign In
                </a>
            </div>

            <div class="password-requirements">
                <h4>Password Requirements:</h4>
                <ul>
                    <li>At least 6 characters long</li>
                    <li>Can contain letters, numbers, and symbols</li>
                    <li>Make it unique and secure</li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            const firstName = document.getElementById('firstName').value.trim();
            const lastName = document.getElementById('lastName').value.trim();
            const username = document.getElementById('username').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (firstName === '') {
                alert('Please enter your first name');
                return false;
            }
            
            if (lastName === '') {
                alert('Please enter your last name');
                return false;
            }
            
            if (username === '') {
                alert('Please enter a username');
                return false;
            }
            
            if (email === '') {
                alert('Please enter your email address');
                return false;
            }
            
            if (!isValidEmail(email)) {
                alert('Please enter a valid email address');
                return false;
            }
            
            if (password === '') {
                alert('Please enter a password');
                return false;
            }
            
            if (password.length < 6) {
                alert('Password must be at least 6 characters long');
                return false;
            }
            
            if (password !== confirmPassword) {
                alert('Passwords do not match');
                return false;
            }
            
            return true;
        }
        
        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
    </script>
</body>
</html> 