<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap css file -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css file-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleExplorePage.css"/>
        <!--icon file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/1754/1754224.png"/>
        <title>Album Page</title>

    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <section class="album-list-section hidden-load">
            <h1 class="album-list-title">All Albums</h1>
            <article class="album-list-content">
                <c:if test="${requestScope.album_list != null}">
                    <c:forEach items="${requestScope.album_list}" var="album">
                        <div class="album-item">
                            <div class="album-cover" onclick="location.href = './album?albumid=${album.albumid}';"><img
                                    src="${album.albumimage}"
                                    alt=""></div>
                            <div class="album-name">
                                <p>${album.name}</p>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${requestScope.album_list.size() < 3}">
                        <c:forEach begin="1" end="${3 - requestScope.album_list.size()}" varStatus="loop">
                            <div class="album-item">
                                <div class="album-cover"></div>
                                <div class="album-name">
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${requestScope.album_list == null}">
                    <h2 style="color: white;text-align: center;">[No Album Data]</h2>
                </c:if>
            </article>
        </section>
        <section class="album-page-section hidden-load">
            <c:set var="albumPageCnt" value="${1}"/>
            <div class="pagination">
                <!--                <span class="pagination__number-indicator"></span>-->
                <button class="pagination__arrow" 
                        onclick="prevAlbumPage(${requestScope.totalAlbumPages},${requestScope.currentAlbumPage});">
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
                <c:forEach begin="1" end="${requestScope.totalAlbumPages}" varStatus="loop">
                    <div class="page_item">
                        <button  class="pagination__number" cnt="${albumPageCnt}"
                                 onclick="location.href = './album?action=get&album_page=${albumPageCnt}';">${albumPageCnt}</button>
                        <div class="page-circle"></div>
                    </div>
                    <c:set var="albumPageCnt" value="${albumPageCnt + 1}"/>
                </c:forEach>
                <button class="pagination__arrow pagination__arrow--right" 
                        onclick="nextAlbumPage(${requestScope.totalAlbumPages},${requestScope.currentAlbumPage});">
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
            </div>
        </section>
        <div class="empty"></div>
        <script src="js/AlbumViewFunctions.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
