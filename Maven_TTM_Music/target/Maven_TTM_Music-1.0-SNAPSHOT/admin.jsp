<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css files-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100&display=swap" rel="stylesheet">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleAdminPage.css">
        <!--icon css file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/4919/4919538.png">
        <title>Admin Page</title>

    </head>

    <body>
        <header>
            <!--include nav bar here-->
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <main>
            <section class="analytic-section">
                <div class="card-list hidden-load">
                    <div class="card song-card">
                        <div class="card-name ">
                            <div class="card-logo "><img src="https://cdn-icons-png.flaticon.com/512/2467/2467467.png" alt=""></div>  Songs
                        </div>
                        <div class="card-content">
                            ${requestScope.songCount} songs
                        </div>
                        <div class="card-button-section">
                            <button class="card-button" onclick="location.href='./song';">
                                View
                            </button>
                            <button class="card-button">
                                Add
                            </button>
                        </div>
                    </div>
                    <div class="card album-card hidden-load">
                        <div class="card-name ">
                            <div class="card-logo "><img src="https://cdn-icons-png.flaticon.com/512/1754/1754224.png" alt=""></div>Albums
                        </div>
                        <div class="card-content ">
                            ${requestScope.albumCount} albums
                        </div>
                        <div class="card-button-section">
                            <button class="card-button" onclick="location.href='./album?action=loadall';">
                                View
                            </button>
                            <button class="card-button">
                                Add
                            </button>
                        </div>
                    </div>
                    <div class="card artist-card hidden-load">
                        <div class="card-name ">
                            <div class="card-logo ">
                                <img src="https://cdn-icons-png.flaticon.com/512/4889/4889072.png" alt="">
                            </div>  Artists
                        </div>
                        <div class="card-content">
                            ${requestScope.artistCount} artists
                        </div>
                        <div class="card-button-section">
                            <button class="card-button">
                                View
                            </button>
                            <button class="card-button">
                                Add
                            </button>
                        </div>
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
                        <div class="card-button-section">
                            <button class="card-button">
                                View
                            </button>
                            <button class="card-button">
                                Add
                            </button>
                        </div>
                    </div>
                    <div class="card user-card hidden-load">
                        <div class="card-name ">
                            <div class="card-logo ">
                                <img src="https://cdn-icons-png.flaticon.com/512/1177/1177568.png" alt="">
                            </div> Users
                        </div>
                        <div class="card-content">
                            ${requestScope.userCount} users
                        </div>
                        <button class="card-button" onclick="location.href = './user?action=create';">
                            Add User
                        </button>
                    </div>
                </div>
            </section>
            <c:if test="${requestScope.message != null}">
                <h1 style="color: red;text-align: center;">${requestScope.message}</h1>
            </c:if>
            <section class="user-table-section hidden-load">
                <div class="user-table-title">
                    <h1>All Users</h1>
                </div>
                <table class="user-table table">
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th></th>
                    </tr>
                    <c:choose>
                        <c:when test="${requestScope.user_list != null && !requestScope.user_list.isEmpty()}">
                            <c:forEach items="${requestScope.user_list}" var="user">
                                <tr>
                                    <td>${user.username}</td>
                                    <td class="password_data">
                                        ${user.password}
                                    </td>
                                    <td>${user.email}</td>
                                    <td>
                                        ${user.role}
                                    </td>
                                    <td class="table-button">
                                        <button class="delete-button" onclick="doDeleteUser(`${user.username}`)">Delete</button>
                                        <button class="update-button" onclick="location.href = './user?action=edit&username=${user.username}';">Details</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h1 style="text-align: center;">[No Users Data]</h1>
                        </c:otherwise>
                    </c:choose>

                </table>
            </section>
        </main>
        <div class="empty"></div>
        <script src="js/AdminPageFunctions.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>