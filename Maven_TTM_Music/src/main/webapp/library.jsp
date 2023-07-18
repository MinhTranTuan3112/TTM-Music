<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--bootstrap css files-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styleLibrary.css">
        <!--icon css file-->
        <link rel="icon" href="images/icons/library-music.png"> 
        <title>My Library</title>
    </head>

    <body>
        <header>
            <section class="home-section hidden-load">
                <button class="home-button hidden-load" onclick="location.href='./home';">Home</button>
            </section>
        </header>
        <main>
            <jsp:include page="favDialog.jsp" flush="true"/>
            <section class="filter-section hidden-load">
                <article class="filter-section-title hidden-load">
                    <h1>What are you looking for?</h1>
                </article>
                <article class="filter-section-content hidden-load">
                    <div class="filter-item">
                        <button class="filter-button" onclick="location.href = 'library#song-section';">Songs</button>
                    </div>
                    <div class="filter-item">
                        <button class="filter-button" onclick="location.href = 'library#playlist-section';">Playlist</button>
                    </div>
                    <div class="filter-item">
                        <button class="filter-button" onclick="location.href = 'library#album-section';">Album</button>
                    </div>
                    <div class="filter-item">
                        <button class="filter-button" onclick="location.href = 'library#artist-section';">Artists</button>
                    </div>
                </article>
                <article class="search-form-wrapper hidden-load">
                    <form action="./library" class="search-form">
                        <input type="hidden" name="action" value="search">
                        <input type="text" name="search_keyword" class="form-control" placeholder="Search here">
                        <button type="submit" class="search-button">Search</button>
                    </form>
                </article>
            </section>
            <section class="song-section hidden-load" id="song-section">
                <section class="song-section-title">
                    <h1>Your favorite songs</h1>
                </section>
                <section class="song-list">
                    <c:if test="${requestScope.user_song_list != null}">
                        <c:forEach items="${requestScope.user_song_list}" var="song">
                            <article class="song-item">
                                <div class="song-cover">
                                    <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                         onclick="playSongWithUserData('${song.songid}', '${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'))"></div>
                                    <img class="song-cover-img" src="${song.image}"
                                         alt="">
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
                        <c:if test="${requestScope.user_song_list.size() < 4}">
                            <c:forEach begin="1" end="${4 - requestScope.user_song_list.size()}" varStatus="loop">
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
                    <c:if test="${requestScope.user_song_list == null}">
                        <h2 style="text-align: center;">[No favorite songs]</h2>
                    </c:if>
                </section>
            </section>
            <section class="playlist-section hidden-load" id="playlist-section">
                <section class="playlist-section-title">
                    <h1>Your playlists</h1>
                </section>
                <section class="playlist-section-content hidden-load">
                    <c:choose>
                        <c:when test="${requestScope.user_playlist_list != null && !requestScope.user_playlist_list.isEmpty()}">
                            <c:forEach items="${requestScope.user_playlist_list}" var="playlist">
                                <div class="playlist-item" onclick="location.href = 'playlist?playlistid=${playlist.playlistid}';">
                                    <div class="playlist-item-header">
                                        <div class="playlist-item-name">
                                            <h1>${playlist.name}</h1>
                                        </div>
                                    </div>
                                    <div class="playlist-item-content">
                                        <c:forEach items="${playlist.getSong_list()}" var="song" begin="0" end="2">
                                            <div class="playlist-item-song">
                                                <div class="playlist-item-song-img"><img
                                                        src="${song.image}" alt=""></div>
                                                <div class="playlist-item-song-description">
                                                    <div class="playlist-item-song-name">${song.name}</div>
                                                    <div class="artist-name">
                                                        <c:forEach items="${song.getArtistNameList()}" var="song_artist">
                                                            ${song_artist}
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${requestScope.user_playlist.size() < 4}">
                                <c:forEach begin="1" end="${4 - requestScope.user_playlist_list.size()}" varStatus="loop">
                                    <div class="playlist-item">
                                        <div class="playlist-item-header">
                                            <div class="playlist-item-img"></div>
                                            <div class="playlist-item-name"></div>
                                        </div>
                                        <div class="playlist-item-content"></div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h1 style="text-align: center;">[No Playlists]</h1>
                        </c:otherwise>
                    </c:choose>
                </section>
                <section class="add-playlist-section hidden-load">
                    <div class="add-playlist-section-title"><h1>Add new playlist</h1></div>
                    <div class="add-playlist-button"><button class="glyphicon glyphicon-plus-sign"></button></div>
                </section>
            </section>
            <section class="album-section hidden-load" id="album-section">
                <section class="album-section-title">
                    <h1>Your Albums</h1>
                </section>
                <section class="album-section-content hidden-load">
                    <c:choose>
                        <c:when test="${requestScope.user_album_list != null && !requestScope.user_album_list.isEmpty()}">
                            <c:forEach items="${requestScope.user_album_list}" var="album">
                                <div class="album-item">
                                    <div class="album-cover" onclick="location.href = 'album?albumid=${album.albumid}';"><img
                                            src="${album.albumimage}"
                                            alt=""></div>
                                    <div class="album-name">
                                        <p>${album.name}</p>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${requestScope.user_album_list.size() < 3}">
                                <c:forEach begin="1" end="${3 - requestScope.user_album_list.size()}" varStatus="loop">
                                    <div class="album-item">
                                        <div class="album-cover"><img alt=""></div>
                                        <div class="album-name">
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h1 style="text-align: center;">[No Albums]</h1>
                        </c:otherwise>
                    </c:choose>
                </section>
            </section>
            <section class="artist-section hidden-load" id="artist-section">
                <section class="artist-section-title hidden-load">
                    <h1>Your Favorite Artists</h1>
                </section>
                <section class="artist-section-content">
                    <c:choose>
                        <c:when test="${requestScope.user_artist_list != null && !requestScope.user_artist_list.isEmpty()}">
                            <c:forEach items="${requestScope.user_artist_list}" var="artist">
                                <div class="artist">
                                    <div class="artist-img" onclick="location.href = 'artist?artistid=${artist.artistid}';"><img
                                            src="${artist.image}" alt=""></div>
                                    <div class="artist-name">${artist.name}</div>
                                </div>
                            </c:forEach>
                            <c:if test="${requestScope.user_artist_list.size() < 4}">
                                <c:forEach begin="1" end="${4 - requestScope.user_artist_list.size()}" varStatus="loop">
                                    <div class="artist">
                                        <div class="artist-img"></div>
                                        <div class="artist-name"></div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h1 style="text-align: center;">[No Artists]</h1>
                        </c:otherwise>
                    </c:choose>
                </section>
            </section>
            <c:if test="${sessionScope.usersession.role == 'admin'}">
                <%--<jsp:include page="/admin.jsp" flush="true"/>--%>
            </c:if>
        </main>
        <script src="js/LibraryFunctions.js"></script>

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
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>