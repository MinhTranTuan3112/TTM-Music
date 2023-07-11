<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--custom css files-->
        <link rel="stylesheet" href="css/styleNavBar.css"/>
        <title>JSP Page</title>
    </head>
    <body>
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
                            <a class="navbar-brand" href="./home">
                                <div class="glyphicon glyphicon-headphones"></div> TTM Music
                            </a>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active nav-item"><a href="./home">Home</a></li>
                            <li class="nav-item"><a href="">Explore</a></li>
                            <li class="nav-item"><a href="./library">Library</a></li>
                        </ul>
                        <form action="./home" class="navbar-form navbar-left">
                            <input type="hidden" name="action" value="search">
                            <div class="search-group">
                                <div class="search-bar"><input type="text" class="form-control"
                                                               placeholder="Search your music here" name="keyword" list="search-list" 
                                                               value="${requestScope.search_keyword}">
<!--                                    <datalist id="search-list">
                                        <option value="Golden Hour"></option>
                                        <option value="Gaming Music"></option>
                                        <option value=""></option>
                                    </datalist>-->
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
    </body>
</html>
