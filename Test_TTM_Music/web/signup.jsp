<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
    <!-- Bootstrap css files -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!--custom css files-->
    <link rel="stylesheet" href="css/styleSignUp.css">
    <!--font css files-->
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!--icon css file-->
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/2037/2037710.png">
    <title>Sign Up Page</title>
</head>

<body>
    <main>
        <c:if test="${requestScope.error != null}">
            <h1 style="color: red;text-align: center;">${requestScope.error}</h1>
        </c:if>
        <div class="login-form hidden-load">
            <div class="login-form-title hidden-load">
                <h1>Registration Form</h1>
            </div>
            <div class="login-form-content">
                <form action="login" method="post">
                    <input type="hidden" name="action" value="signup">
                    <div class="form-group">
                        <label for="username">
                            <div class="glyphicon glyphicon-user"></div> Username
                        </label>
                        <input type="text" placeholder="Enter your username" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">
                            <div class="glyphicon glyphicon-lock"></div> Password
                        </label>
                        <input type="password" name="password" id="password" name="password"
                            placeholder="Enter your password" required>
                    </div>
                    <div class="form-group">
                        <label for="password">
                            <div class="glyphicon glyphicon-lock"></div> Confirm your password
                        </label>
                        <input type="password" name="password" id="password" name="password_confirm"
                            placeholder="Enter your password again" required>
                    </div>
                    <div class="form-group">
                        <label for="email">
                            <div class="glyphicon glyphicon-envelope"></div> Email
                        </label>
                        <input type="email" name="email" id="email" placeholder="Enter your email" required>
                    </div>
                    <div class="submit-button">
                        <div class="login-button">
                            <input type="submit" value="Sign Up" class="btn btn-default">
                        </div>
                    </div>
                </form>
                <div class="signup-group">
                    <div class="social-signup-button  p-t-54 p-b-20">
                        Or Sign Up Using
                    </div>
                </div>
                <div class="flex-c-m">
                    <ul class="hover-social-icon">
                        <li>
                            <a href="#" class="login100-social-item bg1">
                                <i class="fab fa-facebook-f icon"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="login100-social-item bg2">
                                <i class="fab fa-twitter icon"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="login100-social-item bg3">
                                <i class="fab fa-google icon"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="text-last">
                    <span class="txt1">
                       Already have an account? 
                    </span>
                    <a href="login.jsp" class="txt2">
                        Log In
                    </a>
                </div>
            </div>
        </div>
    </main>
    <script src="js/SignUpFunction.js"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>
