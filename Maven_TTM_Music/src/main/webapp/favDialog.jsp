<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/styleFavDialog.css" rel="stylesheet">
</head>

<body>
    <!--    <button class="primary" onclick="window.dialog.showModal();">
            Add
        </button>-->
    <dialog id="dialog">
        <h2 class="dialog_action">Saved</h2>
        <p class="song_name"><a href="#"></a></p>
        <button onclick="window.dialog.close();" aria-label="close" class="x">❌</button>
    </dialog>
    <script src="js/favDialogFunctions.js"></script>
</body>

</html>