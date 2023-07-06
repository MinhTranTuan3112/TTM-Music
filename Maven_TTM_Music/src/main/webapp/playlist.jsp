<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
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
    <title>${requestScope.playlist.name}</title>
    <script type="text/javascript">
        class Song {
            constructor(songUrl, songName, songImage, songArtists, songLyrics) {
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
            playSong(song.songUrl, song.songName, song.songImage, song.songArtists, song.songLyrics);
            mysong.addEventListener('ended', () => playPlaylist(songs, index + 1));
        }
        var songs = [
        <c:forEach items="${requestScope.song_list}" var="song">
            {
                songUrl: '${song.url}',
                songName: '${fn:replace(song.name, "'", "\\'")}',
                songImage: '${song.image}',
                songArtists: '${song.getArtistInfo()}',
                songLyrics: `${song.getLyric()}`
            },
        </c:forEach>
        ];
        var currentSongIndex = 0;
        function startPlayingPlaylist() {
            document.querySelector('.current-playlist-name').textContent = `${requestScope.playlist.name}`;
            playPlaylist(songs);
        }
        function changeSongIndex(newIndex) {
            currentSongIndex = newIndex;
        }
    </script>
</head>

<body>
    <header>
        <jsp:include page="navbar.jsp" flush="true"/>
    </header>
    <main>
        <form class="wrapper hidden-load" id="playlist-form" action="">
            <div class="playlist-title hidden-load">
                <div class="playlist-description">
                    <div class="playlist-name hidden-load">
                        <h1 ${requestScope.personalPlaylist ? contenteditable : ''}  id="playlist-name">${requestScope.playlist.name}</h1>
                        <c:if test="${requestScope.personalPlaylist}">
                            <input type="hidden" name="playlistname" id="playlistname">
                        </c:if>
                        <div class="playlist-songs-number hidden-load"><h2>${requestScope.song_list.size()} songs</h2></div>
                    </div>
                </div>
                <div class="playlist-buttons hidden-load">
                    <div class="playlist-play-button" onclick="startPlayingPlaylist()"><div class="glyphicon glyphicon-play-circle"></div></div>
                    <div class="favorite-button">
                        <div class="glyphicon glyphicon-thumbs-up"></div>
                    </div>
                    <c:if test="${requestScope.personalPlaylist}">
                        <div class="add-button" onclick="addSong()">
                            <div class="glyphicon glyphicon-plus-sign"></div>
                        </div>
                        <template>
                            <div class="playlist-item">
                                <div class="playlist-item-img"><img
                                        src="https://png.pngtree.com/png-clipart/20190921/original/pngtree-music-icon-png-image_4694506.jpg"
                                        alt=""></div>
                                <div class="playlist-item-name" contenteditable="true">
                                    <input type="text" name="songName" placeholder="Enter song name">
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
                <c:if test="${requestScope.song_list != null}">
                    <c:set var="songIndex" value="${0}"/>
                    <c:forEach items="${requestScope.song_list}" var="song">
                        <div class="playlist-item hidden-load">
                            <div class="playlist-item-img">
                                <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.getLyric()}" 
                                     onclick="playSong('${song.url}', '${fn:replace(song.name, "'", "\\'")}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'));changeSongIndex(${songIndex})"></div>
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
                </c:if>
                <c:if test="${requestScope.song_list == null || requestScope.song_list.isEmpty()}">
                    <h1 style="text-align: center;">[No Songs Data]</h1>
                </c:if>
            </div>
            <div class="empty"></div>
        </form>
    </main>
    <script src="js/PlaylistPageFunctions.js"></script>
    <jsp:include page="playcontent.jsp" flush="true"/>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>