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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styleAdminPage.css"/>
        <title>Admin Page</title>
    </head>
    <body>
        <div class="c">
        <div class="main-body">
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="">Admin</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Song</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="">Profile</a></li>
                </ol>
            </nav>
            <section class="admin-section" id="admin-section">
                <!--add admin edit content-->
                <form action="saveaudio" method="post" enctype="multipart/form-data" onsubmit="return confirm('Add this song?');">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="" class="rounded-circle" width="200" alt="admin">
                                    </div>
                                    <div class="mt-3">
                                        <p>Enter song image: </p>
                                        <input type="file" accept="image/*" name="image">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0"> Enter Song ID </h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="id" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Enter song name: </h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0"> Choose Audio file</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="file" name="songaudio">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0"> Choose lyrics file: </h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="file" name="lyric" accept="text/plain">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Enter album id: </h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="albumid" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" value="Add" class="btn-primary px-4 submit-button">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
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

     <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Get the input element that accepts the image file
        var input = document.querySelector("input[name='image']");

        // Get the img element that displays the image
        var img = document.querySelector(".d-flex.flex-column.align-items-center.text-center img");

        // Add an event listener to the input element
        input.addEventListener("change", function () {
            // Check if the input has a file
            if (this.files && this.files[0]) {
                // Create a new FileReader object
                var reader = new FileReader();

                // Add an event listener to the reader object
                reader.addEventListener("load", function (e) {
                    // Set the src attribute of the img element to the data URL of the file
                    img.src = e.target.result;
                });

                // Read the file as a data URL
                reader.readAsDataURL(this.files[0]);
            }
        });
    </script>
</body>
</html>
