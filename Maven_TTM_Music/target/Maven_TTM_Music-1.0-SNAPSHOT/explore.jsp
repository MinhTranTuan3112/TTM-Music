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
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/1212/1212731.png"/>
        <title>Explore Page</title>

    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <section class="song-section">
            <section class="song-section-title hidden-load">
                <h1>All Songs</h1>
            </section>
            <section class="song-list">
                <c:choose>
                    <c:when test="${requestScope.song_list != null && !requestScope.song_list.isEmpty()}">
                        <c:forEach items="${requestScope.song_list}" var="song">
                            <article class="song-item hidden-load">
                                <div class="song-cover hidden-load">
                                    <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                         onclick="playSongWithUserData('${song.songid}', '${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'));"></div>
                                    <img class="song-cover-img" src="${song.image}"
                                         alt="">
                                </div>
                                <div class="song-name hidden-load">${song.name} - <span class="artist-name">
                                        <c:set var="song_artist_list" value="${song.getArtistNameList()}"/>
                                        <c:forEach items="${song_artist_list}" var="song_artist">
                                            ${song_artist}
                                        </c:forEach>
                                    </span>
                                </div>
                            </article>
                        </c:forEach>
                        <c:if test="${requestScope.song_list != null}">
                            <c:if test="${requestScope.song_list.size() < 4}">
                                <c:forEach begin="1" end="${4 - requestScope.song_list.size()}" varStatus="loop">
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
                    </c:when>
                    <c:otherwise>
                        <h2 style="color: white;text-align: center;" class="hidden-load">[No Song Data]</h2>
                    </c:otherwise>
                </c:choose>
            </section>
        </section>
        <section class="song-page-section hidden-load">
            <c:set var="songPageCnt" value="${1}"/>
            <div class="pagination">
                <!--                <span class="pagination__number-indicator"></span>-->
                <button class="pagination__arrow" 
                        onclick="prevSongPage(${requestScope.totalSongPages},${requestScope.currentSongPage},${requestScope.currentAlbumPage})" >
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
                <c:forEach begin="1" end="${requestScope.totalSongPages}" varStatus="loop">
                    <div class="page_item">
                        <div class="pagination__number" cnt="${songPageCnt}"
                             onclick="location.href = ${requestScope.search_keyword == null} ?
                                             './explore?action=get&song_page=${songPageCnt}&album_page=${requestScope.currentAlbumPage}' :
                                             './explore?action=search&keyword=${requestScope.search_keyword}&song_page=${songPageCnt}&album_page=${requestScope.currentAlbumPage}';">${songPageCnt}</div>
                        <div class="page-circle"></div>
                    </div>
                    <c:set var="songPageCnt" value="${songPageCnt + 1}"/>
                </c:forEach>
                <button class="pagination__arrow pagination__arrow--right" 
                        onclick="nextSongPage(${requestScope.totalSongPages},${requestScope.currentSongPage},${requestScope.currentAlbumPage})">
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
            </div>
        </section>
        <section class="album-list-section hidden-load">
            <h1 class="album-list-title">${requestScope.search_message == null ? 'All Albums' : 'Album results'} </h1>
            <article class="album-list-content">
                <c:if test="${requestScope.album_list != null}">
                    <c:forEach items="${requestScope.album_list}" var="album">
                        <div class="album-item">
                            <div class="album-cover" onclick="location.href = 'album?albumid=${album.albumid}';"><img
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
                        onclick="prevAlbumPage(${requestScope.totalAlbumPages},${requestScope.currentSongPage},${requestScope.currentAlbumPage});">
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
                <c:forEach begin="1" end="${requestScope.totalAlbumPages}" varStatus="loop">
                    <div class="page_item">
                        <button  class="pagination__number" cnt="${albumPageCnt}"
                                 onclick="location.href = './explore?action=get&song_page=${requestScope.currentSongPage}&album_page=${albumPageCnt}';">${albumPageCnt}</button>
                        <div class="page-circle"></div>
                    </div>
                    <c:set var="albumPageCnt" value="${albumPageCnt + 1}"/>
                </c:forEach>
                <button class="pagination__arrow pagination__arrow--right" 
                        onclick="nextAlbumPage(${requestScope.totalAlbumPages},${requestScope.currentSongPage},${requestScope.currentAlbumPage});">
                    <span class="pagination__arrow-half"></span>
                    <span class="pagination__arrow-half"></span>
                </button>
            </div>
        </section>
        <div class="empty"></div>
        <script src="js/explorePageFunction.js"></script>
        <jsp:include page="playcontent.jsp" flush="true"/>
        <script type="text/javascript">
                            class Song {
                                constructor(songID, songUrl, songName, songImage, songArtists, songLyrics) {
                                    this.songID = songID;
                                    this.songUrl = songUrl;
                                    this.songName = songName;
                                    this.songImage = songImage;
                                    this.songArtists = songArtists;
                                    this.songLyrics = songLyrics;
                                }
                            }
                            var UserSongList = null;
            <c:if test="${requestScope.user_song_list != null}">
                            UserSongList = [
                <c:forEach items="${requestScope.user_song_list}" var="song">
                                {
                                    songID: '${song.songid}',
                                    songUrl: '${song.url}',
                                    songName: '${fn:replace(song.name, "'", "\\'")}',
                                    songImage: '${song.image}',
                                    songArtists: '${song.getArtistInfo()}',
                                    songLyrics: `${song.getLyric()}`
                                },
                </c:forEach>
                            ];
            </c:if>
                            function playSongWithUserData(songID, songUrl, songName, songImage, songArtists, songLyrics) {
                                if (UserSongList !== null) {
                                    for (var i = 0; i < UserSongList.length; ++i) {
                                        if (UserSongList[i].songID === songID) {
                                            document.querySelector('.add-button').style.color = changedAddButtonColor;
                                            break;
                                        }
                                    }
                                }
                                playSong(songID, songUrl, songName, songImage, songArtists, songLyrics);
                            }
        </script>
        <script type="text/javascript">
            document.querySelector('.search-form').setAttribute('action', './explore');
        </script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
