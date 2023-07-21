<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--bootstrap css file-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css files-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100&display=swap" rel="stylesheet">
        <!--custom css file-->
        <link rel="stylesheet" href="css/styleUserDetails.css">
        <!--icon file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/1177/1177568.png">
        <title>${requestScope.user != null ? requestScope.user.username : 'New User'}</title>
    </head>

    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <main>
            <c:if test="${requestScope.action != 'insert'}">
                <section class="analytic-section">
                    <div class="card-list hidden-load">
                        <div class="card song-card">
                            <div class="card-name ">
                                <div class="card-logo"><img src="https://cdn-icons-png.flaticon.com/512/2467/2467467.png" alt=""></div>  Songs
                            </div>
                            <div class="card-content">
                                ${requestScope.songCount} songs
                            </div>
                            <button class="card-button">
                                View
                            </button>
                        </div>
                        <div class="card album-card hidden-load">
                            <div class="card-name ">
                                <div class="card-logo "><img src="https://cdn-icons-png.flaticon.com/512/1754/1754224.png" alt=""></div>Albums
                            </div>
                            <div class="card-content ">
                                ${requestScope.albumCount} albums
                            </div>
                            <button class="card-button ">
                                View
                            </button>
                        </div>
                        <div class="card artist-card hidden-load">
                            <div class="card-name ">
                                <div class="card-logo ">
                                    <img src="https://cdn-icons-png.flaticon.com/512/4889/4889072.png" alt="">
                                </div>  Artists
                            </div>
                            <div class="card-content ">
                                ${requestScope.artistCount} artists
                            </div>
                            <button class="card-button ">
                                View
                            </button>
                        </div>
                        <div class="card playlist-card hidden-load">
                            <div class="card-name ">
                                <div class="card-logo ">
                                    <img src="https://cdn-icons-png.flaticon.com/512/3126/3126407.png" alt="">
                                </div>  Playlists
                            </div>
                            <div class="card-content ">
                                ${requestScope.playlistCount} playlists
                            </div>
                            <button class="card-button ">
                                View
                            </button>
                        </div>
                    </div>
                </section>
            </c:if>
            <c:if test="${requestScope.message != null}">
                <h1 style="color: red;text-align: center;">${requestScope.message}</h1>
            </c:if>
            <section class="user-section">
                <c:set var="user" value="${requestScope.user}"/>
                <form action="./user" method="post" class="hidden-load">
                    <input type="hidden" name="action" value="${requestScope.action}">
                    <div class="form-group hidden-load">
                        <label for="username">
                            <div class="glyphicon glyphicon-user"></div> Username
                        </label>
                        <c:set var="EditableID" value="${requestScope.user != null ? 'readonly' : ''}"/>
                        <input type="text" placeholder="Enter username" id="username" name="username" value="${user.username}" 
                               ${EditableID} required>
                    </div>
                    <div class="form-group hidden-load">
                        <label for="password">
                            <div class="glyphicon glyphicon-lock"></div> Password
                        </label>
                        <input type="password" name="password" id="password" name="password" value="${user.password}"
                               placeholder="Enter password" required>
                    </div>
                    <div class="form-group hidden-load">
                        <label for="email">
                            <div class="glyphicon glyphicon-envelope"></div> Email
                        </label>
                        <input type="email" name="email" id="email" placeholder="Enter email" value="${user.email}" required>
                    </div>
                    <div class="form-group hidden-load">
                        <label for="role">
                            <div class=""></div> Role
                        </label>
                        <select name="role" id="role" class="role_select">
                            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                            <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                        </select>
                    </div>
                    <button type="submit" class="submit-button">Save</button>
                </form>
            </section>
        </main>
        <div class="empty"></div>
        <script src="js/UserDetailsPageFunctions.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>