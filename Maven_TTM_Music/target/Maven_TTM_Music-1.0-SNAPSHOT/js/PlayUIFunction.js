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
        document.getElementsByClassName('trigger-button')[0].style.display = 'unset';
        document.getElementsByClassName('control-bar')[0].style.display = 'unset';
    } else {
        UI_Window.style.bottom = '0px';
        document.getElementsByClassName('trigger-button')[0].style.display = 'none';
        document.getElementsByClassName('control-bar')[0].style.display = 'none';
    }
}
function HideAndShowLyrics(lyric_button) {
    if (lyric_button.textContent == 'Hide Lyric') {
        lyric_button.setHTML('Show Lyric');
    } else {
        lyric_button.setHTML('Hide Lyric');
    }
}