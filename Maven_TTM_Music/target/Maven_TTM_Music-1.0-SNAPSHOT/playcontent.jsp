<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleControlBar.css">
        <link rel="stylesheet" href="css/stylePlayUI.css">
        <title>JSP Page</title>
        <script type="text/javascript">
            function playNextSong() {
                if (songs === null) {
                    return;
                }
                currentSongIndex++;
                if (currentSongIndex >= songs.length) {
                    currentSongIndex = 0;
                }
                let song = songs[currentSongIndex];
                playSong(song.songUrl, song.songName, song.songImage, song.songArtists, song.songLyrics);
            }

            function playPreviousSong() {
                if (songs === null) {
                    return;
                }
                currentSongIndex--;
                if (currentSongIndex < 0) {
                    currentSongIndex = songs.length - 1;
                }
                let song = songs[currentSongIndex];
                playSong(song.songUrl, song.songName, song.songImage, song.songArtists, song.songLyrics);
            }
            function shuffleSongs() {
                if (songs === null) {
                    return;
                }
                for (let i = songs.length - 1; i > 0; i--) {
                    let j = Math.floor(Math.random() * (i + 1));
                    [songs[i], songs[j]] = [songs[j], songs[i]];
                }
            }
        </script>
    </head>
    <body>
        <!--control bar-->
        <section class="control-bar">
            <button class="full-screen-button glyphicon glyphicon-resize-full" onclick="switchUI()"></button>
            <div class="control-bar-title">
                <h1>Now Playing</h1>
            </div>
            <section class="control-bar-content">
                <div class="playing-song">
                    <div class="current-song-item">
                        <div class="current-song-img-content">
                            <img class="current-song-img"
                                 src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                        </div>
                    </div>
                    <div class="song-content">
                        <div class="song-name">
                            <div hidden id="songID"></div>
                            <div class="glyphicon glyphicon-cd" id="cd-icon"></div> <span class="playing-song-name-content">Golden Hour</span> - 
                            <span class="playing-artist-name" style="font-weight: bold;">JVKE</span>
                            <c:if test="${requestScope.song_list != null}">
                                from &nbsp;<span class="current-playlist-name">My Playlist</span>
                            </c:if>
                        </div>
                        <div class="control-buttons">
                            <div class="prev-button" onclick="playPreviousSong()">
                                <div class="glyphicon glyphicon-step-backward"></div>
                            </div>
                            <div class="play-button" onclick="modifyCDAnimation(this)">
                                <div class="glyphicon glyphicon-play" id="play-button-content"></div>
                            </div>
                            <div class="next-button" onclick="playNextSong()">
                                <div class="glyphicon glyphicon-step-forward"></div>
                            </div>
                            <div class="mode-button" onclick="changeModeButtonColor(this);repeatSong(this)">
                                <div class="glyphicon glyphicon-retweet" id="mode-button-content"></div>
                            </div>
                            <div class="add-button">
                                <div class="glyphicon glyphicon-plus-sign"></div>
                            </div>
                            <div class="shuffle-button" onclick="shuffleSongs()">
                                <div class="glyphicon glyphicon-random"></div>
                            </div>
                        </div>
                        <div class="song-progress-bar">
                            <div id="current-time">0:00</div>
                            <input min="0" max="100" id="song-progress" type="range" value="0"></input>
                            <div class="time-end duration"></div>
                        </div>
                    </div>
                </div>
                <div class="volume-control">
                    <div class="glyphicon glyphicon-volume-down" id="volume-icon"></div>
                    <div id="volume-bar"><input type="range" min="0" max="100" orient="vertical" id="volume-value"
                                                onchange="changeVolumeIcon(this);
                                                        changeSongVolume(this);"></div>
                </div>
            </section>
        </section>
        <!--PlayUI-->
        <section class="UI-window">
            <section class="playing-content">
                <div class="playing-song">
                    <div class="playing-song-img">
                        <img src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg"
                             alt="song_image" class="current-song-img">
                    </div>
                    <div class="playing-song-name">
                        <div class="glyphicon glyphicon-cd" id="cd-icon"></div> <span class="playing-song-name-content">Golden Hour</span> - 
                        <span class="playing-artist-name" style="font-weight: bold;">JVKE</span>
                    </div>
                </div>
                <div class="media-buttons">
                    <div class="prev-button" onclick="playPreviousSong()">
                        <div class="glyphicon glyphicon-step-backward"></div>
                    </div>
                    <div class="second-play-button" onclick="modifyCDAnimation(this)">
                        <div class="glyphicon glyphicon-play" id="second-play-button-content"></div>
                    </div>
                    <div class="next-button" onclick="playNextSong()">
                        <div class="glyphicon glyphicon-step-forward"></div>
                    </div>
                    <!--                    <div class="mode-button" onclick="changeModeButtonColor(this);repeatSong(this)">
                                            <div class="glyphicon glyphicon-retweet" id="mode-button-content"></div>
                                        </div>-->
                </div>
                <div class="second-song-progress-bar">
                    <div id="second-current-time">0:00</div>
                    <input min="0" max="100" id="second-song-progress" type="range" value="0" class="second-song-bar"></input>
                    <div class="second-time-end duration"></div>
                </div>
                <div class="volume-control">
                    <div class="glyphicon glyphicon-volume-down" id="volume-icon"></div>
                    <div id="volume-bar"><input type="range" min="0" max="100" id="volume-value"
                                                onchange="changeVolumeIcon(this);
                                                        changeSongVolume(this);"></div>
                </div>
            </section>
            <section class="nav-content">
                <div class="nav-content-bar">
                    <button class="nav-item lyric-button" onclick="TriggerLyricTransition();HideAndShowLyrics(this)">Hide Lyric</button>
                    <button class="nav-item minimize-button" onclick="MinimizePlayUIWindow()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-fullscreen-exit" viewBox="0 0 16 16">
                        <path
                            d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z" />
                        </svg>
                    </button>
                </div>
                <div class="lyric-content">
                    <pre id="mylyrics">
                    It was just two lovers
                    Sittin' in the car, listening to Blonde
                    Fallin' for each other
                    Pink and orange skies, feelin' super childish
                    No Donald Glover
                    Missed call from my mother
                    Like, "Where you at tonight?" Got no alibi
                    I was all alone with the love of my life
                    She's got glitter for skin
                    My radiant beam in the night
                    I don't need no light to see you
                    Shine
                    It's your golden hour (oh)
                    You slow down time
                    In your golden hour (oh)
                    We were just two lovers
                    Feet up on the dash, drivin' nowhere fast
                    Burnin' through the summer
                    Radio on blast, make the moment last
                    She got solar power
                    Minutes feel like hours
                    She knew she was the baddest, can you even imagine
                    Fallin' like I did?
                    For the love of my life
                    She's got glow on her face
                    A glorious look in her eyes
                    My angel of light
                    I was all alone with the love of my life
                    She's got glitter for skin
                    My radiant beam in the night
                    I don't need no light to see you
                    Shine
                    It's your golden hour (oh)
                    You slow down time
                    In your golden hour (oh)
                    </pre>
                </div>
                <div class="next-songs-list">
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Perfect - <span class="artist-name">Ed Sheeran</span>
                        </div>
                    </div>
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000352463268-5bfny8-t500x500.jpg" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Let Me Down Slowly - <span class="artist-name">Alec
                                Benjamin</span>
                        </div>
                    </div>
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i1.sndcdn.com/artworks-UHTknyAmzXHrIhaj-JzfJ9w-t500x500.jpg" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Dancing With Your Ghost - <span class="artist-name">
                                Sasha Alex Sloan</span>
                        </div>
                    </div>
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Perfect - <span class="artist-name">Ed Sheeran</span>
                        </div>
                    </div>
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000352463268-5bfny8-t500x500.jpg" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Let Me Down Slowly - <span class="artist-name">Alec
                                Benjamin</span>
                        </div>
                    </div>
                    <div class="next-song-item">
                        <div class="next-song-img"><img
                                src="https://i1.sndcdn.com/artworks-UHTknyAmzXHrIhaj-JzfJ9w-t500x500.jpg" alt=""></div>
                        <div class="next-song-name">
                            <div class="glyphicon glyphicon-cd"></div> Dancing With Your Ghost - <span class="artist-name">
                                Sasha Alex Sloan</span>
                        </div>
                    </div>
                </div>
            </section>
        </section>
        <div class="empty"></div>
        <!--trigger button for control bar transition-->
        <div class="trigger-button" onmouseover="moveControlBarUpAndDown()">
            <div class="glyphicon glyphicon-cd"></div> Playing Song
        </div>

        <audio controls id="current-song" hidden>
            <source src="http://docs.google.com/uc?export=open&id=1M7xKVGNOM8HM06wpZILjqIR41orkq5cO" type="audio/mpeg">
        </audio>
        <script src="js/ControlBarFunction.js"></script>
        <script src="js/PlayUIFunction.js"></script>
        <script src="js/playContentFunctions.js">
        </script>
    </body>
</html>
