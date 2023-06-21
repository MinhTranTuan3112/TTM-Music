<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Song.SongDTO"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="admin-section" id="admin-section">
            <!--add admin edit content-->
            <form action="saveaudio" method="post" enctype="multipart/form-data">
                <p>Enter song id: <input type="text" name="id"></p>
                <p>Enter song name: <input type="text" name="name"></p>
                <p>Choose song audio file: <input type="file" name="songaudio" accept="audio/*"></p>
                <p>Enter song lyric: <input type="file" name="lyric" accept="text/plain"></p>
                <p>Enter song image: <input type="file" accept="image/*" name="image"></p>
                <p>Enter album id: <input type="text" name="albumid"></p>
                <input type="submit" value="Add">
            </form>
        </section>
        <c:if test="${requestScope.mysong != null}">
            <section class="test-section">
                <p>Song id: ${requestScope.mysong.songid}</p>
                <p>Song name: ${requestScope.mysong.name}</p>
                <audio controls>
                    <source src="${requestScope.mysong.url}">
                </audio>
                <p>Song lyric:
                    <%
                        SongDTO mysong = (SongDTO) (request.getAttribute("mysong"));
                        StringBuilder fileContent = new StringBuilder();
                        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(mysong.getLyric()), "UTF-8"))) {
                            String line;
                            while ((line = reader.readLine()) != null) {
                                fileContent.append(line).append("<br/>");
                            }
                        }
                    %>
                <p><%= fileContent%></p>
            </p>
            <p>
                Song image:
                <img src="${requestScope.mysong.image}">
            </p>
            <p>
                Album ID: ${requestScope.mysong.albumid}
            </p>
        </section>
    </c:if>
</body>
</html>
