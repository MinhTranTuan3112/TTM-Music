<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--bootstrap css files-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!--font css file-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">
        <!--custom css files-->
        <link rel="stylesheet" href="css/stylePlaylistPage.css">
        <!--icon file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/1382/1382065.png">
        <title>${requestScope.personalPlaylist ? 'New Playlist' : requestScope.playlist.name}</title>
        
    </head>

    <body>
        <header>
            <jsp:include page="navbar.jsp" flush="true"/>
        </header>
        <main>
            <jsp:include page="favDialog.jsp" flush="true"/>
            <form class="wrapper hidden-load" id="playlist-form" action="">
                <div class="playlist-title hidden-load">
                    <div class="playlist-description">
                        <div hidden id="playlistid">${requestScope.playlist.playlistid}</div>
                        <div class="playlist-name hidden-load">
                            <h1 ${requestScope.personalPlaylist ? contenteditable : ''}  id="playlist-name">
                                <c:out value="${requestScope.personalPlaylist ? 'My Playlist' : requestScope.playlist.name}"/> 
                                <c:if test="${requestScope.personalPlaylist}">
                                    <button type="submit" class="save-button">Save</button>
                                </c:if>
                            </h1>
                            <c:choose>
                                <c:when test="${requestScope.personalPlaylist}">
                                    <input type="hidden" name="playlistname" id="playlistname">
                                </c:when>
                                <c:otherwise>
                                    <div class="playlist-songs-number hidden-load"><h2>${requestScope.song_list.size()} songs</h2></div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="playlist-buttons hidden-load">
                        <div class="playlist-play-button" onclick="startPlayingPlaylist()"><div class="glyphicon glyphicon-play-circle"></div></div>
                        <div class="favorite-button" onclick="addNewFavoritePlaylist(this);">
                            <div class="glyphicon glyphicon-thumbs-up"></div>
                        </div>
                        <div class="playlist-shuffle-button" onclick="ShuffleThenPlay()">
                            <div class="glyphicon glyphicon-random"></div>
                        </div>
                        <c:if test="${requestScope.personalPlaylist}">
                            <div class="add-button" onclick="addSong()">
                                <div class="glyphicon glyphicon-plus-sign"></div>
                            </div>
                            <template>
                                <div class="playlist-item">
                                    <div class="playlist-item-img"><img
                                            src="https://png.pngtree.com/png-clipart/20190921/original/pngtree-music-icon-png-image_4694506.jpg"
                                            alt="" class="playlist-item-img-content"></div>
                                    <div class="playlist-item-name" contenteditable="true">
                                        <input type="text" name="songName" list="song_list" class="songName" placeholder="Enter song name">
                                        <datalist id="song_list">
                                            <c:if test="${requestScope.lib_song_list != null}">
                                                <c:forEach items="${requestScope.lib_song_list}" var="songData">
                                                    <option value="${songData.name}"></option>
                                                </c:forEach>
                                            </c:if>
                                        </datalist>
                                        <span class="artist-name">&nbsp;</span>
                                    </div>
                                    <div class="playlist-item-buttons">
                                        <div class="remove-button">
                                            <div class="glyphicon glyphicon-remove-sign"></div>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </c:if>
                    </div>
                </div>
                <div class="playlist-content hidden-load">
                    <c:choose>
                        <c:when test="${requestScope.song_list != null && !requestScope.song_list.isEmpty()}">
                            <c:set var="songIndex" value="${0}"/>
                            <c:forEach items="${requestScope.song_list}" var="song">
                                <div class="playlist-item hidden-load">
                                    <div class="playlist-item-img">
                                        <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                             onclick="playSong('${song.songid}', '${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'));
                                                     changeSongIndex(${songIndex})"></div>
                                        <img src="${song.image}" alt="" class="playlist-item-img-content">
                                    </div>
                                    <div class="playlist-item-name">${song.name} - &nbsp;<span class="artist-name">
                                            <c:set var="song_artist_list" value="${song.getArtistNameList()}"/>
                                            <c:forEach items="${song_artist_list}" var="song_artist">
                                                ${song_artist}
                                            </c:forEach>
                                        </span>
                                    </div>
                                    <c:if test="${requestScope.personalPlaylist}">
                                        <div class="playlist-item-buttons">
                                            <div class="remove-button">
                                                <div class="glyphicon glyphicon-remove-sign"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <c:set var="songIndex" value="${songIndex + 1}"/>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h1 style="text-align: center;">[No Songs Data]</h1>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="empty"></div>
            </form>
        </main>
        <script src="js/PlaylistPageFunctions.js"></script>
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
            function playPlaylist(songs, index = 0) {
                console.log('Playlist started');
                if (index >= songs.length) {
                    return;
                }
                let song = songs[index];
                playSong(song.songID, song.songUrl, song.songName, song.songImage, song.songArtists, song.songLyrics);
                mysong.addEventListener('ended', () => playPlaylist(songs, index + 1));
            }
            var songs = null;
            <c:if test="${requestScope.song_list != null}">
            songs = [
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
            </c:if>
            var currentSongIndex = 0;
            function startPlayingPlaylist() {
                document.querySelector('.current-playlist-name').textContent = `${requestScope.playlist.name}`;
                playPlaylist(songs);
            }
            function changeSongIndex(newIndex) {
                currentSongIndex = newIndex;
            }
            function ShuffleThenPlay() {
                shuffleSongs();
                startPlayingPlaylist();
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
            function addNewFavoritePlaylist(like_button) {
                 <c:if test="${sessionScope.usersession == null}">
                window.location = './login?message=' + 'Please Login First';
                return;
            </c:if>
                changeLikeButtonColor(like_button);
                let myDialog = document.querySelector('#dialog');
                let dialog_action = myDialog.querySelector('.dialog_action');
                let playlist_name = document.querySelector('.item_name');
                playlist_name.textContent = `${requestScope.playlist.name}`;
                let playlistID = document.querySelector('#playlistid');
                if (like_button.style.color === likeButtonColor) {
                    //save code
                    $.ajax({
                        url: "./like?itemtype=playlist&action=like&itemid=" + playlistID.textContent,
                        method: "POST",
                        data: {playlistid: playlistID.textContent},
                        success: function (result) {
                            console.log("Passed playlist id: " + result);
                        }
                    });
                    dialog_action.textContent = 'Saved';
                } else {
                    //remove code
                    $.ajax({
                        url: "./like?itemtype=playlist&action=delete&itemid=" + playlistID.textContent,
                        method: "POST",
                        data: {playlist: playlistID.textContent},
                        success: function (result) {
                            console.log("Passed playlist id: " + result);
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