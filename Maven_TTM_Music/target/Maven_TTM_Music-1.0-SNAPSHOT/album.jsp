<%@page import="Song.SongDTO"%>
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
        <!--font css file-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleAlbumPage.css">
        <!--icon file -->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/1754/1754224.png"/>
        <title>${requestScope.album.name}</title>
        
    </head>

    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <main>
            <jsp:include page="favDialog.jsp" flush="true"/>
            <div class="wrapper hidden-load">
                <div class="album-title hidden-load">
                    <div hidden id="albumid">${requestScope.album.albumid}</div>
                    <div class="album-cover hidden-load"><img src="${requestScope.album.albumimage}" alt=""></div>
                    <div class="album-description">
                        <div class="album-name hidden-load">
                            <h1>${requestScope.album.name} - <span class="artist-name">${requestScope.album.getArtistName()}</span></h1>
                        </div>
                        <div class="album-songs-number hidden-load"><h2>${requestScope.song_list.size()} songs</h2></div>
                        <div class="album-buttons hidden-load">
                            <div class="album-play-button" onclick="startPlayingAlbum()"><div class="glyphicon glyphicon-play-circle"></div></div>
                            <div class="add-button"><div class="glyphicon glyphicon-plus-sign"></div></div>
                            <div class="favorite-button" 
                                 onclick="addNewFavoriteAlbum(this);"><div class="glyphicon glyphicon-thumbs-up"></div></div>
                        </div>
                    </div>
                </div>
                <div class="album-content hidden-load">
                    <c:if test="${requestScope.song_list != null}">
                        <c:set var="songIndex" value="${0}"/>
                        <c:forEach items="${requestScope.song_list}" var="song">
                            <div class="album-item hidden-load">
                                <div class="album-item-img" data-lyric ="${song.getLyric()}" 
                                     onclick="playSong('${song.songid}', '${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'));
                                             changeSongIndex(${songIndex})">
                                    <img src="${song.image}" alt="">
                                </div>
                                <div class="album-item-name">${song.name} - <span class="artist-name"> &nbsp;
                                        <c:set var="song_artist_list" value="${song.getArtistNameList()}"/>
                                        <c:forEach items="${song_artist_list}" var="song_artist">
                                            ${song_artist}
                                        </c:forEach>
                                    </span></div>
                            </div>  
                            <c:set var="songIndex" value="${songIndex + 1}"/>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.song_list == null}">
                        <h1 style="text-align: center;">[No songs]</h1>
                    </c:if>
                </div>
            </div>
            <div class="empty"></div>
        </main>
        <script src="js/AlbumPageFunctions.js"></script>
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
            function playAlbum(songs, index = 0) {
                console.log('Play album started');
                if (index >= songs.length) {
                    return;
                }
                let song = songs[index];
                playSong(song.songID, song.songUrl, song.songName, song.songImage, song.songArtists, song.songLyrics);
                mysong.addEventListener('ended', () => playAlbum(songs, index + 1));
            }
            var songs = [
            <c:forEach items="${requestScope.song_list}" var="song">
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
            var currentSongIndex = 0;
            function startPlayingAlbum() {
                document.querySelector('.current-playlist-name').textContent = `${requestScope.album.name}`;
                playAlbum(songs);
            }
            function changeSongIndex(newIndex) {
                currentSongIndex = newIndex;
            }
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
            function addNewFavoriteAlbum(like_button) {
                changeLikeButtonColor(like_button);
                let myDialog = document.querySelector('#dialog');
                let dialog_action = myDialog.querySelector('.dialog_action');
                let album_name = document.querySelector('.item_name');
                album_name.textContent = `${requestScope.album.name}`;
                let albumID = document.querySelector('#albumid');
                if (like_button.style.color === likeButtonColor) {
                    //save code
                    $.ajax({
                        url: "./like?itemtype=album&action=like&itemid=" + albumID.textContent,
                        method: "POST",
                        data: {album: albumID.textContent},
                        success: function (result) {
                            console.log("Passed alblum id: " + result);
                        }
                    });
                    dialog_action.textContent = 'Saved';
                } else {
                    //remove code
                    $.ajax({
                        url: "./like?itemtype=album&action=delete&itemid=" + albumID.textContent,
                        method: "POST",
                        data: {albumid: albumID.textContent},
                        success: function (result) {
                            console.log("Passed album id: " + result);
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