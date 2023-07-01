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
                            <form action="./home" class="navbar-form navbar-left">
                                <input type="hidden" name="action" value="search">
                                <div class="search-group">
                                    <div class="search-bar"><input type="text" class="form-control"
                                                                   placeholder="Search your music here" name="keyword" list="search-list">
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
                    <c:if test="${requestScope.home_category_list != null}">
                        <c:forEach items="${requestScope.home_category_list}" var="category">
                            <div class="explore-item">
                                <button class="explore-button" 
                                        onclick="location.href='home?action=searchbycategory&categoryid=${category.categoryid}">${category.name}</button>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.home_category_list == null}">
                        <h2>[No category data]</h2>
                    </c:if>
                </article>
            </section>
            <section class="recently-play-section hidden-load">
                <h1 class="recently-play-title">Songs you might like</h1>
                <section class="song-list">
                    <c:if test="${requestScope.home_song_list != null}">
                        <c:forEach items="${requestScope.home_song_list}" var="song">
                            <article class="song-item">
                                <div class="song-cover">
                                    <div class="hover-play-button glyphicon glyphicon-play" data-lyric ="${song.lyric}" onclick="playSong('${song.url}', '${song.name}', '${song.image}', '${song.getArtistInfo()}', this.getAttribute('data-lyric'))"></div>
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
                    </c:if>
                    <c:if test="${requestScope.home_song_list == null}">
                        <h2>[No Song Data]</h2>
                    </c:if>
                </section>
            </section>
            <section class="album-list-section hidden-load">
                <h1 class="album-list-title">Albums you might like</h1>
                <article class="album-list-content">
                    <c:if test="${requestScope.home_album_list != null}">
                        <c:forEach items="${requestScope.home_album_list}" var="album">
                            <div class="album-item">
                                <div class="album-cover"><img
                                        src="${album.albumimage}"
                                        alt=""></div>
                                <div class="album-name">
                                    <p>${album.name}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.home_album_list == null}">
                        <h2>[No album data]</h2>
                    </c:if>
                </article>
            </section>
            <section class="artist-section hidden-load">
                <div class="artist-section-title">
                    <h1>Artists you might like</h1>
                </div>
                <div class="artist-section-content">
                    <c:if test="${requestScope.home_artist_list != null}">
                        <c:forEach items="${requestScope.home_artist_list}" var="artist">
                            <div class="artist">
                                <div class="artist-img"><img
                                        src="${artist.image}" alt=""></div>
                                <div class="artist-name">${artist.name}</div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.home_artist_list == null}">
                        <h2>[No artist data]</h2>
                    </c:if>
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
        <jsp:include page="playcontent.jsp" flush="true"/>
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
