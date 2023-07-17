<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css files-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleArtistPage.css">
        <!--icon file-->
        <link rel="icon" href="images/icons/artist.png">
        <title>${requestScope.artist.name}</title>
    </head>

    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
            <jsp:include page="favDialog.jsp" flush="true"/>
            <div class="artist-title hidden-load">
                <div hidden id="artistid">${requestScope.artist.artistid}</div>
                <div class="artist-cover hidden-load"><img
                        src="${requestScope.artist.image}" alt=""></div>
                <div class="artist-description hidden-load">
                    <div class="artist-name">
                        <h1 class="artist-name-content">${requestScope.artist.name}</h1>
                    </div>
                    <div class="artist-buttons hidden-load">
                        <div class="favorite-button" onclick="addNewFavoriteArtist(this)">
                            <div class="glyphicon glyphicon-thumbs-up"></div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <section class="song-section">
                <div class="song-section-title hidden-load">
                    <h1>Songs</h1>
                </div>
                <section class="song-list hidden-load">
                    <c:if test="${requestScope.song_list != null}">
                        <c:forEach items="${requestScope.song_list}" var="song">
                            <article class="song-item hidden-load">
                                <div class="song-cover">
                                    <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                         onclick="playSong('${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'))"></div>
                                    <img class="song-cover-img"
                                         src="${song.image}" alt="">
                                </div>
                                <div class="song-name">${song.name} - <span class="artist-name">
                                        <c:set var="song_artist_list" value="${song.getArtistNameList()}"/>
                                        <c:forEach items="${song_artist_list}" var="song_artist">
                                            ${song_artist}
                                        </c:forEach>
                                    </span>
                                </div>
                            </article>
                        </c:forEach>
                        <c:if test="${requestScope.song_list.size() < 5}">
                            <c:forEach begin="1" end="${5 - requestScope.song_list.size()}" varStatus="loop">
                                <article class="song-item">
                                    <div class="song-cover">
                                        <img class="song-cover-img" alt="">
                                    </div>
                                    <div class="song-name">
                                        <span class="artist-name"></span>
                                    </div>
                                </article>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.song_list == null || requestScope.song_list.isEmpty()}">
                        <h1 style="text-align: center;">[No Songs Data]</h1>
                    </c:if>
                </section>
            </section>
            <section class="album-section hidden-load">
                <article class="album-section-title hidden-load"><h1>Albums</h1></article>
                <article class="album-list-content">
                    <c:if test="${requestScope.album_list != null}">
                        <c:forEach items="${requestScope.album_list}" var="album">
                            <div class="album-item hidden-load">
                                <div class="album-cover" onclick="location.href = 'album?albumid=${album.albumid}';"><img
                                        src="${album.albumimage}"
                                        alt=""></div>
                                <div class="album-name hidden-load">
                                    <p>${album.name}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${requestScope.album_list.size() < 3}">
                            <c:forEach begin="1" end="${3 - requestScope.album_list.size()}" varStatus="loop">
                                <div class="album-item">
                                    <div class="album-cover"><img alt=""></div>
                                    <div class="album-name">
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.album_list == null || requestScope.album_list.isEmpty()}">
                        <h1 style="text-align: center;">[No Albums Data]</h1>
                    </c:if>
                </article>
            </section>
        </main>
        <div class="empty"></div>
        <script src="js/ArtistPageFunctions.js"></script>
        <script type="text/javascript">
            const likeButtonColor = 'rgb(167, 237, 231)';
            let likeButton = document.querySelector('.favorite-button');
            <c:if test="${requestScope.isLiked == true}">
            if (likeButton !== null) {
                console.log('Changed color');
                changeLikeButtonColor(likeButton);
            } else {
                console.log('Change color failed!! ');
            }
            </c:if>
            function changeLikeButtonColor(like_button) {
                if (like_button.style.color !== likeButtonColor) {
                    like_button.style.color = likeButtonColor;
                } else {
                    like_button.style.color = 'white';
                }
            }
            function addNewFavoriteArtist(like_button) {
                changeLikeButtonColor(like_button);
                let myDialog = document.querySelector('#dialog');
                let dialog_action = myDialog.querySelector('.dialog_action');
                let artist_name = document.querySelector('.item_name');
                artist_name.textContent = `${requestScope.artist.name}`;
                let artistID = document.querySelector('#artistid');
                if (like_button.style.color === likeButtonColor) {
                    //save code
                    $.ajax({
                        url: "./like?itemtype=artist&action=like&itemid=" + artistID.textContent,
                        method: "POST",
                        data: {artistid: artistID.textContent},
                        success: function (result) {
                            console.log("Passed artist id: " + result);
                        }
                    });
                    dialog_action.textContent = 'Saved';
                } else {
                    //remove code
                    $.ajax({
                        url: "./like?itemtype=artist&action=delete&itemid=" + artistID.textContent,
                        method: "POST",
                        data: {artistid: artistID.textContent},
                        success: function (result) {
                            console.log("Passed artist id: " + result);
                        }
                    });
                    dialog_action.textContent = 'Removed';
                }
                myDialog.showModal();
            }
        </script>
        <jsp:include page="playcontent.jsp" flush="true"/>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>