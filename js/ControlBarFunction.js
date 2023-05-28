//for song playing events
const modeButtonColor = 'rgb(48, 162, 255)';
let mysong = document.getElementById('current-song');
function ChangePlayAndPauseIcon(play_button) {
    if (document.getElementById('play-button-content').className == 'glyphicon glyphicon-play') {
        mysong.play();
        document.getElementById('play-button-content').className = 'glyphicon glyphicon-pause';
    } else {
        mysong.pause();
        document.getElementById('play-button-content').className = 'glyphicon glyphicon-play';
    }
}
function convertTime(time) {
    var minutes = Math.floor(time / 60);
    var remainingSeconds = time % 60;
    if (remainingSeconds >= 0 && remainingSeconds < 10) {
        remainingSeconds = '0' + remainingSeconds;
    }
    return minutes + ':' + remainingSeconds;
}
let songTime = document.getElementById('song-progress');
mysong.onloadedmetadata = function () {
    songTime.max = mysong.duration;
}
songTime.oninput = function () {
    mysong.currentTime = songTime.value;
    document.getElementById('current-time').textContent = convertTime(songTime.value);
}
mysong.ontimeupdate = function () {
    songTime.value = mysong.currentTime;
    document.getElementById('current-time').textContent = convertTime(songTime.value);
}
//for volume
function changeVolumeIcon(volumeInput) {
    let volumeValue = volumeInput.value;
    if (volumeValue == 0) {
        document.getElementById('volume-icon').className = 'glyphicon glyphicon-volume-off';
    } else if (volumeValue > 0 && volumeValue <= 50) {
        document.getElementById('volume-icon').className = 'glyphicon glyphicon-volume-down';
    } else {
        document.getElementById('volume-icon').className = 'glyphicon glyphicon-volume-up';
    }
}
function changeSongVolume(volumeInput) {
    mysong.volume = parseFloat(parseInt(volumeInput.value)) / 100;
}
function changeModeButtonColor(modeButton) {
    let modeButtonContent = document.getElementById('mode-button-content');
    if (modeButtonContent.style.color != modeButtonColor) {
        modeButtonContent.style.color = modeButtonColor;
    } else {
        modeButtonContent.style.color = 'white';
    }
}
function repeatSong(modeButton) {
    let modeButtonContent = document.getElementById('mode-button-content');
    if (modeButtonContent.style.color == modeButtonColor) {
        mysong.setAttribute("loop", "");
    } else {
        mysong.removeAttribute("loop");
    }
}
function modifyCDAnimation(play_button) {
    if (document.getElementById('play-button-content').className == 'glyphicon glyphicon-play') {
        document.getElementById('cd-icon').style.animationPlayState = 'paused';
    } else {
        document.getElementById('cd-icon').style.animationPlayState = 'running';
    }
}
