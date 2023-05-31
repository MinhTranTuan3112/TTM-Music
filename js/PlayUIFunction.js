function TriggerLyricTransition() {
    let mylyrics = document.getElementById('mylyrics');
    if (mylyrics.style.height != '0px') {
        mylyrics.style.height = '0px';
    } else {
        mylyrics.style.height = '500px';
    }
}
function MinimizePlayUIWindow() {
    let UI_Window = document.getElementsByClassName('UI-window')[0];
    if (UI_Window.style.bottom == '0px') {
        UI_Window.style.bottom = '-100%';
    } else {
        UI_Window.style.bottom = '0px';
    }
}