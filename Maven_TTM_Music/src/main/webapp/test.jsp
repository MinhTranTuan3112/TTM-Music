<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="saveaudio" method="post" enctype="multipart/form-data">
            <input type="file" name="songaudio">
            <input type="text" name="name">
            <input type="submit" value="Submit">
        </form>
        <h1>Song url: ${requestScope.path}</h1>
        <audio controls>
            <source src="${requestScope.path}"></source>
        </audio>
    </body>
    <!--http://localhost:8080/Test_TTM_Music/songs/We_Don't_Talk_Anymore.mp3-->
</html>
