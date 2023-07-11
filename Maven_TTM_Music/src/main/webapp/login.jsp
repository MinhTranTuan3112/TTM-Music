<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!-- Bootstrap css files -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!--font css files-->
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
              integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleLogin.css">
        <!--icon css file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/6681/6681204.png">
        <title>Login Page</title>
        <script defer type="text/javascript">
            if (document.getElementById("remember_me").checked) {
                document.getElementById("username").setAttribute("value", '${sessionScope.usersession.username}');
                document.getElementById("password").setAttribute("value", '${sessionScope.usersession.password}');
            } else {
                document.getElementById("username").removeAttribute("value");
                document.getElementById("password").removeAttribute("value");
            }
        </script>
    </head>

    <body>
        <main>
            <c:if test="${requestScope.message != null}">
                <h1 style="color: red;text-align: center;">${requestScope.message}</h1>
            </c:if>
            <div class="login-form hidden-load">
                <section class="login-form-title hidden-load">
                    <h1>Welcome to TTM Music</h1>
                </section>
                <div class="login-form-content">
                    <form action="login" method="post">
                        <input type="hidden" name="action" value="login">
                        <div class="form-group">
                            <label for="username">
                                <div class="glyphicon glyphicon-user"></div> <span>Username</span>
                            </label>
                            <input type="text" placeholder="Enter your username" id="username" name="username" 
                                   value="${sessionScope.rememberedAccount ? sessionScope.usersession.username : ''}" required>
                        </div>
                        <div class="form-group password-form">
                            <label for="password">
                                <div class="glyphicon glyphicon-lock"></div> <span>Password</span>
                            </label>
                            <input type="password" name="password" id="password"
                                   placeholder="Enter your password" class="password" value="${sessionScope.rememberedAccount ? sessionScope.usersession.password : ''}" required>
                            <div class="eye-icon-wrapper"><i class='bx bx-hide eye-icon'></i></div>
                        </div>
                        <!--Cho t mới sửa lại theo ý mình-->
                        <div class="rem-for">
                            <div class="checkbox-group">
                                <input type="checkbox" name="remember_me" value="on" id="remember_me" ${sessionScope.rememberedAccount ? 'checked' : ''}>
                                <label for="remember_me">Remember Me</label>
                            </div>
                            <div class="forget-password">
                                <a href="#" class="forget-password-link">
                                    Forgot password?
                                </a>
                            </div>
                        </div>
                        <div class="submit-button">
                            <div class="login-button">
                                <input type="submit" value="Log In" class="btn btn-default color">
                            </div>
                        </div>
                    </form>
                    <div class="signup-group">
                        <div class="social-signup-button  p-t-54 p-b-20">
                            Or Login Using
                        </div>
                    </div>
                    <!--Change here-->
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
                            Or Sign Up Using
                        </span>
                        <a href="signup.jsp" class="txt2">
                            Sign Up
                        </a>
                    </div>
                    <!--Đến đây là hết-->
                </div>
            </div>
        </main>
        <!--custom js file-->
        <script src="js/LoginFunction.js"></script>
        <!--bootstrap js libraries-->
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>