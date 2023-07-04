function switchUI() {
    let songTimeBar = document.querySelectorAll('.song-bar');
    if (document.getElementsByClassName('UI-window')[0].style.bottom === '-100%') {
        document.getElementsByClassName('trigger-button')[0].style.display = 'none';
        document.getElementsByClassName('control-bar')[0].style.display = 'none';
        document.getElementsByClassName('UI-window')[0].style.bottom = '0px';
       
    } else {
        document.getElementsByClassName('trigger-button')[0].style.display = 'unset';
        document.getElementsByClassName('control-bar')[0].style.display = 'unset';
        document.getElementsByClassName('UI-window')[0].style.bottom = '-100%';
    }
}
