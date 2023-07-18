<%@page import="Users.UserDAO"%>
<%@page import="Users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap css file -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css file-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <!--customize CSS Files-->
        <link rel="stylesheet" href="css/styleHomePage.css">
        <!--page icon css file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/2285/2285073.png">
        <title>TTM Music</title>
        
    </head>

    <body>
        <jsp:include page="favDialog.jsp" flush="true"/>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <main>
            <c:if test="${requestScope.search_message != null}">
                <h1 style="text-align: center;" class="hidden-load">${requestScope.search_message}</h1>
            </c:if>
            <section class="explore-section hidden-load">
                <article class="explore-section-title">
                    <h1>Hi! What's in your mood today?</h1>
                </article>
                <article class="explore-section-content">
                    <c:choose>
                        <c:when test="${requestScope.home_category_list != null && !requestScope.home_category_list.isEmpty()}">
                            <c:forEach items="${requestScope.home_category_list}" var="category">
                                <div class="explore-item">
                                    <button class="explore-button" data-url ="home?action=searchbycategory&categoryid=${category.categoryid}"
                                            onclick="location.href = 'home?action=searchbycategory&categoryid=${category.categoryid}';">${category.name}</button>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h2 style="color: white;text-align: center;">[No Category Data]</h2>
                        </c:otherwise>
                    </c:choose>
                </article>
            </section>
            <section class="recently-play-section hidden-load">
                <h1 class="recently-play-title">
                    <c:choose>
                        <c:when test="${requestScope.category_name != null}">
                            <c:out value="${'All songs that have category '}"/>
                            <c:out value="${requestScope.category_name}"/>
                        </c:when>
                        <c:otherwise>
                            ${requestScope.search_message == null ? 'Songs you might like' : 'Song results'}
                        </c:otherwise>
                    </c:choose>
                </h1>
                <section class="song-list">
                    <c:if test="${requestScope.home_song_list != null}">
                        <c:forEach items="${requestScope.home_song_list}" var="song">
                            <article class="song-item">
                                <div class="song-cover">
                                    <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                         onclick="testPlaySong('${song.songid}', '${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'));"></div>
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
                        <c:if test="${requestScope.home_song_list.size() < 4}">
                            <c:forEach begin="1" end="${4 - requestScope.home_song_list.size()}" varStatus="loop">
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
                    <c:if test="${requestScope.home_song_list == null}">
                        <h2 style="color: white;text-align: center;">[No Song Data]</h2>
                    </c:if>
                </section>
            </section>
            <section class="album-list-section hidden-load">
                <h1 class="album-list-title">${requestScope.search_message == null ? 'Albums you might like' : 'Album results'} </h1>
                <article class="album-list-content">
                    <c:if test="${requestScope.home_album_list != null}">
                        <c:forEach items="${requestScope.home_album_list}" var="album">
                            <div class="album-item">
                                <div class="album-cover" onclick="location.href = 'album?albumid=${album.albumid}';"><img
                                        src="${album.albumimage}"
                                        alt=""></div>
                                <div class="album-name">
                                    <p>${album.name}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${requestScope.home_album_list.size() < 3}">
                            <c:forEach begin="1" end="${3 - requestScope.home_album_list.size()}" varStatus="loop">
                                <div class="album-item">
                                    <div class="album-cover"></div>
                                    <div class="album-name">
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.home_album_list == null}">
                        <h2 style="color: white;text-align: center;">[No Album Data]</h2>
                    </c:if>
                </article>
            </section>
            <section class="artist-section hidden-load">
                <div class="artist-section-title">
                    <h1>${requestScope.search_message == null ? 'Artists you might like' : 'Artist results'} </h1>
                </div>
                <div class="artist-section-content">
                    <c:if test="${requestScope.home_artist_list != null}">
                        <c:forEach items="${requestScope.home_artist_list}" var="artist">
                            <div class="artist">
                                <div class="artist-img" onclick="location.href = 'artist?artistid=${artist.artistid}';"><img
                                        src="${artist.image}" alt=""></div>
                                <div class="artist-name">${artist.name}</div>
                            </div>
                        </c:forEach>
                        <c:if test="${requestScope.home_artist_list.size() < 4}">
                            <c:forEach begin="1" end="${4 - requestScope.home_artist_list.size()}" varStatus="loop">
                                <div class="artist">
                                    <div class="artist-img"></div>
                                    <div class="artist-name"></div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.home_artist_list == null}">
                        <h2 style="color: white;text-align: center;">[No Artist Data]</h2>
                    </c:if>
                </div>
            </section>
            <div class="playlist-section-title hidden-load" style="text-align: center;">
                <h1>${requestScope.search_message == null ? 'Playlists you might like' : 'Playlist results'} </h1>
            </div>
            <section class="playlist-section hidden-load">
                <c:choose>
                    <c:when test="${requestScope.home_playlist_list != null && !requestScope.home_playlist_list.isEmpty()}">
                        <c:forEach items="${requestScope.home_playlist_list}" var="playlist">
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
                        <c:if test="${requestScope.home_playlist.size() < 4}">
                            <c:forEach begin="1" end="${4 - requestScope.home_playlist_list.size()}" varStatus="loop">
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
                        <h1 style="text-align: center;">[No Playlists Data]</h1>
                    </c:otherwise>
                </c:choose>
            </section>
        </main>

        <jsp:include page="playcontent.jsp" flush="true"/>
        <!--custom js files-->
        <script src="js/HomePageFunction.js"></script>
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
            <c:if test="${requestScope.user_song_list != null}">
            var UserSongList = [
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
            function testPlaySong(songID, songUrl, songName, songImage, songArtists, songLyrics) {
                for (var i = 0;i < UserSongList.length;++i) {
                    if (UserSongList[i].songID === songID) {
                        document.querySelector('.add-button').style.color = changedAddButtonColor; 
                        break;
                    }
                }
                playSong(songID, songUrl, songName, songImage, songArtists, songLyrics);
            }
        </script>
        <!--bootstrap js libraries-->
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>

</html>
