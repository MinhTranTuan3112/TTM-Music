<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Saved</h2>
        <p>(Song name)<a href="#"></a> as a new favorite song
        </p>
        <button onclick="window.dialog.close();" aria-label="close" class="x">❌</button>
    </dialog>
    <script src="js/favDialogFunctions.js"></script>
</body>

</html>