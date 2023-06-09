<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/styleControlBar.css">
        <link rel="stylesheet" href="css/stylePlayUI.css">
        <!--page icon css file-->
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/2285/2285073.png">
        <title>TTM Music</title>
    </head>

    <body>
        <header>
            <section class="navbar-section hidden-load">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="navbar-brand-wrapper">
                                <a class="navbar-brand" href="">
                                    <div class="glyphicon glyphicon-headphones"></div> TTM Music
                                </a>
                            </div>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li class="active nav-item"><a href="">Home</a></li>
                                <li class="nav-item"><a href="">Explore</a></li>
                                <li class="nav-item"><a href="library.jsp">Library</a></li>
                            </ul>
                            <form action="" class="navbar-form navbar-left" method="get">
                                <div class="search-group">
                                    <div class="search-bar"><input type="text" class="form-control"
                                                                   placeholder="Search your music here" name="Search" list="search-list">
                                        <datalist id="search-list">
                                            <option value="Golden Hour"></option>
                                            <option value="Gaming Music"></option>
                                            <option value=""></option>
                                        </datalist>
                                    </div>
                                    <div class="search-button">
                                        <button class="btn btn-default" type="submit">
                                            Search
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item"><a href=""><span class="glyphicon glyphicon-user"></span>&nbsp; ${sessionScope.usersession.username}</a>
                                </li>
                                <li class="nav-item"><a href="login?rememberedAccount=${sessionScope.rememberedAccount}"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </section>
        </header>
        <main>                        
        <section class="explore-section hidden-load">
            <article class="explore-section-title">
                <h1>Hi! What's in your mood today?</h1>
            </article>
            <article class="explore-section-content">
                <div class="explore-item">
                    <button class="explore-button">Rap</button>
                </div>
                <div class="explore-item">
                    <button class="explore-button">Relaxing</button>
                </div>
                <div class="explore-item">
                    <button class="explore-button">Pop</button>
                </div>
                <div class="explore-item">
                    <button class="explore-button">EDM</button>
                </div>
            </article>
        </section>
        <section class="recently-play-section hidden-load">
            <h1 class="recently-play-title">Recently play songs</h1>
            <section class="song-list">
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div>
                        <img class="song-cover-img" src="https://i.scdn.co/image/ab67616d0000b27370413bcda71e96f3b13cc689"
                             alt="">
                    </div>
                    <div class="song-name">Có em đời bỗng vui - <span class="artist-name">Chillies</span></div>
                </article>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div>
                        <img class="song-cover-img"
                             src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                    </div>
                    <div class="song-name">Golden hour - <span class="artist-name">JVKE</span></div>
                </article>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div>
                        <img class="song-cover-img"
                             src="https://avatar-ex-swe.nixcdn.com/song/2017/11/29/0/6/1/1/1511950269534_640.jpg" alt="">
                    </div>
                    <div class="song-name">Sau tất cả - <span class="artist-name">Erik</span></div>
                </article>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div> <img class="song-cover-img"
                                                                                            src="https://avatar-ex-swe.nixcdn.com/song/2023/04/17/1/9/a/e/1681723596712_640.jpg" alt="">
                    </div>
                    <div class="song-name">夜に駆ける(Yoru ni kakeru) - <span class="artist-name">Yoasobi</span></div>
                </article>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div> <img class="song-cover-img"
                                                                                            src="https://i.scdn.co/image/ab67616d0000b27375c9daf36578bdf30645492f" alt="">
                    </div>
                    <div class="song-name">See you again - <span class="artist-name">Wiz Khalifa ft. Charlie Puth</span>
                    </div>
                </article>
                <div class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div> <img class="song-cover-img"
                                                                                            src="https://i1.sndcdn.com/artworks-Irvkk7URz49E1HBJ-zW3AxA-t500x500.jpg" alt="">
                    </div>
                    <div class="song-name">Relaxing Piano - <span class="artist-name">Soothing Relaxation</span></div>
                </div>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div> <img class="song-cover-img"
                                                                                            src="https://i1.sndcdn.com/artworks-000415538445-okyde2-t500x500.jpg" alt="">
                    </div>
                    <div class="song-name">Darkside - <span class="artist-name">Alan Walker (feat. Au/Ra and Tomine
                            Harket)</span></div>
                </article>
                <article class="song-item">
                    <div class="song-cover">
                        <div class="hover-play-button glyphicon glyphicon-play"></div> <img class="song-cover-img"
                                                                                            src="https://avatar-ex-swe.nixcdn.com/song/2020/10/28/4/1/a/0/1603898014236_640.jpg" alt="">
                    </div>
                    <div class="song-name">MORE - <span class="artist-name">K/DA ft.Madison Beer, (G)I-DLE, Lexie Liu, Jaira
                            Burns, Seraphine</span></div>
                </article>
            </section>
        </section>
        <section class="album-list-section hidden-load">
            <h1 class="album-list-title">Recently Listen Albums</h1>
            <article class="album-list-content">
                <div class="album-item">
                    <div class="album-cover"><img
                            src="https://lh3.googleusercontent.com/5hH_cz-iqNFf6IgPCcx_SdYN_4siZX7GVvXXD1DW2NvRa5sEz-279xsZ341s7jWMIwpEYscMPo1zkxvY6w=w544-h544-l90-rj"
                            alt=""></div>
                    <div class="album-name">
                        <p>Trên những đám mây</p>
                    </div>
                </div>
                <div class="album-item">
                    <div class="album-cover"><img
                            src="https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/4f/ad/3b/4fad3b49-55b8-47bd-7d12-f94fef62d16a/075679902863.jpg/600x600bf-60.jpg"
                            alt=""></div>
                    <div class="album-name">
                        <p>Nine Track Mind</p>
                    </div>
                </div>
                <div class="album-item">
                    <div class="album-cover"><img
                            src="https://upload.wikimedia.org/wikipedia/en/thumb/1/13/Rixton_-_Let_the_Road_%28Official_Album_Cover%29.png/220px-Rixton_-_Let_the_Road_%28Official_Album_Cover%29.png"
                            alt=""></div>
                    <div class="album-name">
                        <p>Let The Road</p>
                    </div>
                </div>
            </article>
        </section>
        <section class="artist-section hidden-load">
            <div class="artist-section-title">
                <h1>Your Favorite Artists</h1>
            </div>
            <div class="artist-section-content">
                <div class="artist">
                    <div class="artist-img"><img
                            src="https://trixie.com.vn/media/images/article/98645721/chillies-1586223837.jpg" alt=""></div>
                    <div class="artist-name">Chillies</div>
                </div>
                <div class="artist">
                    <div class="artist-img"><img
                            src="https://yt3.googleusercontent.com/QiI-c4cFyRPD0qVwTQooC3dlgJqHA_t6CpEAv818om-mqL9bqNDL4L_qXQVXx_eY76D_7cLD=s900-c-k-c0x00ffffff-no-rj"
                            alt=""></div>
                    <div class="artist-name">The Weekend</div>
                </div>
                <div class="artist">
                    <div class="artist-img"><img src="https://i.scdn.co/image/ab6761610000e5ebfbe071f5bc42f38d3485a29a"
                                                 alt=""></div>
                    <div class="artist-name">Yoasobi</div>
                </div>
                <div class="artist">
                    <div class="artist-img"><img
                            src="https://yt3.googleusercontent.com/ytc/AGIKgqOb6ImahVLErAGdEPjrafMdk-ac6xowlZwvKIFH=s900-c-k-c0x00ffffff-no-rj"
                            alt=""></div>
                    <div class="artist-name">Justatee</div>
                </div>
            </div>
        </section>
        <section class="suggest-section hidden-load">
            <div class="suggest-item">
                <div class="suggest-item-header">
                    <div class="suggest-item-img"><img src="https://media.nrj.fr/436x327/2012/06/la-pop-music_7505.jpg"
                                                       alt=""></div>
                    <div class="suggest-item-name">
                        <h1>Pop Playlist</h1>
                    </div>
                </div>
                <div class="suggest-item-content">
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000415538445-okyde2-t500x500.jpg" alt=""></div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Darkside</div>
                            <div class="artist-name">Alan Walker (feat. Au/Ra and Tomine Harket)</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2020/10/28/4/1/a/0/1603898014236_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">MORE</div>
                            <div class="artist-name">K/DA ft.Madison Beer, (G)I-DLE, Lexie Liu, Jaira Burns, Seraphine</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Golden hour</div>
                            <div class="artist-name">JVKE</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="suggest-item">
                <div class="suggest-item-header">
                    <div class="suggest-item-img"><img src="https://media.nrj.fr/436x327/2012/06/la-pop-music_7505.jpg"
                                                       alt=""></div>
                    <div class="suggest-item-name">
                        <h1>Pop Playlist</h1>
                    </div>
                </div>
                <div class="suggest-item-content">
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000415538445-okyde2-t500x500.jpg" alt=""></div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Darkside</div>
                            <div class="artist-name">Alan Walker (feat. Au/Ra and Tomine Harket)</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2020/10/28/4/1/a/0/1603898014236_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">MORE</div>
                            <div class="artist-name">K/DA ft.Madison Beer, (G)I-DLE, Lexie Liu, Jaira Burns, Seraphine</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Golden hour</div>
                            <div class="artist-name">JVKE</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="suggest-item">
                <div class="suggest-item-header">
                    <div class="suggest-item-img"><img src="https://media.nrj.fr/436x327/2012/06/la-pop-music_7505.jpg"
                                                       alt=""></div>
                    <div class="suggest-item-name">
                        <h1>Pop Playlist</h1>
                    </div>
                </div>
                <div class="suggest-item-content">
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000415538445-okyde2-t500x500.jpg" alt=""></div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Darkside</div>
                            <div class="artist-name">Alan Walker (feat. Au/Ra and Tomine Harket)</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2020/10/28/4/1/a/0/1603898014236_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">MORE</div>
                            <div class="artist-name">K/DA ft.Madison Beer, (G)I-DLE, Lexie Liu, Jaira Burns, Seraphine</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Golden hour</div>
                            <div class="artist-name">JVKE</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="suggest-item">
                <div class="suggest-item-header">
                    <div class="suggest-item-img"><img src="https://media.nrj.fr/436x327/2012/06/la-pop-music_7505.jpg"
                                                       alt=""></div>
                    <div class="suggest-item-name">
                        <h1>Pop Playlist</h1>
                    </div>
                </div>
                <div class="suggest-item-content">
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://i1.sndcdn.com/artworks-000415538445-okyde2-t500x500.jpg" alt=""></div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Darkside</div>
                            <div class="artist-name">Alan Walker (feat. Au/Ra and Tomine Harket)</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2020/10/28/4/1/a/0/1603898014236_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">MORE</div>
                            <div class="artist-name">K/DA ft.Madison Beer, (G)I-DLE, Lexie Liu, Jaira Burns, Seraphine</div>
                        </div>
                    </div>
                    <div class="suggest-item-song">
                        <div class="suggest-item-song-img"><img
                                src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg" alt="">
                        </div>
                        <div class="suggest-item-song-description">
                            <div class="suggest-item-song-name">Golden hour</div>
                            <div class="artist-name">JVKE</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </main>
        <div class="search-content"></div>
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
                            <div class="glyphicon glyphicon-cd" id="cd-icon"></div> Golden Hour - <span
                                class="artist-name">JVKE</span> 
                            from &nbsp;<span class="current-playlist-name">My Playlist</span>
                        </div>
                        <div class="control-buttons">
                            <div class="prev-button">
                                <div class="glyphicon glyphicon-step-backward"></div>
                            </div>
                            <div class="play-button" onclick="modifyCDAnimation(this)">
                                <div class="glyphicon glyphicon-play" id="play-button-content"></div>
                            </div>
                            <div class="next-button">
                                <div class="glyphicon glyphicon-step-forward"></div>
                            </div>
                            <div class="mode-button" onclick="changeModeButtonColor(this);repeatSong(this)">
                                <div class="glyphicon glyphicon-retweet" id="mode-button-content"></div>
                            </div>
                            <div class="add-playlist-button">
                                <div class="glyphicon glyphicon-plus-sign"></div>
                            </div>
                            <div class="shuffle-button">
                                <div class="glyphicon glyphicon-random"></div>
                            </div>
                        </div>
                        <div class="song-progress-bar">
                            <div id="current-time">0:00</div>
                            <input min="0" max="100" id="song-progress" type="range" value="0"></input>
                            <div class="time-end">4:07</div>
                        </div>
                    </div>
                </div>
                <div class="volume-control">
                    <div class="glyphicon glyphicon-volume-down" id="volume-icon"></div>
                    <div id="volume-bar"><input type="range" min="0" max="100" orient="vertical" id="volume-value"
                                                onchange="changeVolumeIcon(this);changeSongVolume(this);"></div>
                </div>
            </section>
        </section>
        <!--PlayUI-->
        <section class="UI-window">
            <section class="playing-content">
                <div class="playing-song">
                    <div class="playing-song-img">
                        <img src="https://avatar-ex-swe.nixcdn.com/song/2022/12/13/a/f/7/3/1670903992722_640.jpg"
                             alt="song_image">
                    </div>
                    <div class="playing-song-name">
                        <div class="glyphicon glyphicon-cd" id="cd-icon"></div> Golden Hour - <span
                            class="artist-name">JVKE</span>
                    </div>
                </div>
                <div class="media-buttons">
                    <div class="prev-button">
                        <div class="glyphicon glyphicon-step-backward"></div>
                    </div>
                    <div class="second-play-button" onclick="modifyCDAnimation(this)">
                        <div class="glyphicon glyphicon-play" id="second-play-button-content"></div>
                    </div>
                    <div class="next-button">
                        <div class="glyphicon glyphicon-step-forward"></div>
                    </div>
                    <div class="mode-button" onclick="changeModeButtonColor(this);repeatSong(this)">
                        <div class="glyphicon glyphicon-retweet" id="mode-button-content"></div>
                    </div>
                </div>
                <div class="second-song-progress-bar">
                    <div id="second-current-time">0:00</div>
                    <input min="0" max="100" id="second-song-progress" type="range" value="0" class="second-song-bar"></input>
                    <div class="second-time-end">4:07</div>
                </div>
                <div class="volume-control">
                    <div class="glyphicon glyphicon-volume-down" id="volume-icon"></div>
                    <div id="volume-bar"><input type="range" min="0" max="100" id="volume-value"
                                                onchange="changeVolumeIcon(this);changeSongVolume(this);"></div>
                </div>
            </section>
            <section class="nav-content">
                <div class="nav-content-bar">
                    <button class="nav-item lyric-button" onclick="TriggerLyricTransition();HideAndShowLyrics(this)">Hide
                        Lyric</button>
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
        <!--custom js files-->
        <script src="js/HomePageFunction.js"></script>
        <script src="js/ControlBarFunction.js"></script>
        <script src="js/PlayUIFunction.js"></script>
        <!--bootstrap js libraries-->
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </body>

</html>
