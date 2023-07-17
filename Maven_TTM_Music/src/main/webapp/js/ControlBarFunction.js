//for song playing events
const modeButtonColor = 'rgb(48, 162, 255)';
let mysong = document.getElementById('current-song');

let firstPlayButton = document.querySelector('.play-button');
let secondPlayButton = document.querySelector('.second-play-button');
let firstPlayButtonContent = document.querySelector('#play-button-content');
let secondPlayButtonContent = document.querySelector('#second-play-button-content');


firstPlayButton.addEventListener('click', function () {
    if (firstPlayButtonContent.className === 'glyphicon glyphicon-play') {
        mysong.play();
        firstPlayButtonContent.className = 'glyphicon glyphicon-pause';
    } else {
        mysong.pause();
        firstPlayButtonContent.className = 'glyphicon glyphicon-play';
    }
    secondPlayButtonContent.className = firstPlayButtonContent.className;
});

secondPlayButton.addEventListener('click', function () {
    if (secondPlayButtonContent.className === 'glyphicon glyphicon-play') {
        mysong.play();
        secondPlayButtonContent.className = 'glyphicon glyphicon-pause';
    } else {
        mysong.pause();
        secondPlayButtonContent.className = 'glyphicon glyphicon-play';
    }
    firstPlayButtonContent.className = secondPlayButtonContent.className;
});

// function ChangePlayAndPauseIcon(play_button_content) {
//     if (document.getElementById('play-button-content').className == 'glyphicon glyphicon-play') {
//         mysong.play();
//         document.getElementById('play-button-content').className = 'glyphicon glyphicon-pause';
//         transferPlayButtonType();
//     } else {
//         mysong.pause();
//         document.getElementById('play-button-content').className = 'glyphicon glyphicon-play';
//         transferPlayButtonType();
//     }
// }
function convertTime(time) {
    var minutes = Math.floor(time / 60);
    var remainingSeconds = time % 60;
    if (remainingSeconds >= 0 && remainingSeconds < 10) {
        remainingSeconds = '0' + remainingSeconds;
    }
    return minutes + ':' + remainingSeconds;
}
let firstSongTime = document.getElementById('song-progress');
let secondSongTime = document.getElementById('second-song-progress');
// Get all the elements with the class name 'duration'
const durationElements = document.querySelectorAll('.duration');

// Add an event listener to the audio element to update the duration when the metadata is loaded
mysong.addEventListener('loadedmetadata', () => {
    // Calculate the minutes and seconds from the duration
    const minutes = Math.floor(mysong.duration / 60);
    const seconds = Math.floor(mysong.duration % 60);

    // Update the text content of all the elements with the class name 'duration'
    durationElements.forEach(element => {
        element.textContent = minutes + ':' + seconds;
    });
});
mysong.onloadedmetadata = function () {
    firstSongTime.max = mysong.duration;
    secondSongTime.max = mysong.duration;
};
firstSongTime.oninput = function () {
    mysong.currentTime = firstSongTime.value;
    document.getElementById('current-time').textContent = convertTime(firstSongTime.value);
    document.getElementById('second-current-time').textContent = convertTime(firstSongTime.value);
};
secondSongTime.oninput = function () {
    mysong.currentTime = secondSongTime.value;
    document.getElementById('current-time').textContent = convertTime(secondSongTime.value);
    document.getElementById('second-current-time').textContent = convertTime(secondSongTime.value);
};
mysong.ontimeupdate = function () {
    firstSongTime.value = mysong.currentTime;
    secondSongTime.value = mysong.currentTime;
    document.getElementById('current-time').textContent = convertTime(firstSongTime.value);
    document.getElementById('second-current-time').textContent = convertTime(firstSongTime.value);
};

//for volume
function changeVolumeIcon(volumeInput) {
    let volumeValue = volumeInput.value;
    if (volumeValue === 0) {
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
    if (modeButtonContent.style.color !== modeButtonColor) {
        modeButtonContent.style.color = modeButtonColor;
    } else {
        modeButtonContent.style.color = 'white';
    }
}
function repeatSong(modeButton) {
    let modeButtonContent = document.getElementById('mode-button-content');
    if (modeButtonContent.style.color === modeButtonColor) {
        mysong.setAttribute("loop", "");
    } else {
        mysong.removeAttribute("loop");
    }
}
function modifyCDAnimation(play_button) {
    if (document.getElementById('play-button-content').className === 'glyphicon glyphicon-play') {
        document.getElementById('cd-icon').style.animationPlayState = 'paused';
    } else {
        document.getElementById('cd-icon').style.animationPlayState = 'running';
    }
}
/*function for control bar transition*/
function moveControlBarUpAndDown() {
    let trigger_button = document.getElementsByClassName('trigger-button')[0];
    let control_bar = document.getElementsByClassName('control-bar')[0];
    control_bar.classList.add('move-above');
    trigger_button.style.display = 'none';
    setTimeout(function () {
        control_bar.classList.remove('move-above');
        trigger_button.style.display = 'unset';
    }, 5000);
}
function playSong(songID, songUrl, songName, songImage, songArtists, songLyrics) {
    console.log('songurl: ' + songUrl);
    console.log('song name: ' + songName);
    console.log('song image: ' + songImage);
    let CurrentSongID = document.querySelector('#songID');
    let song_name_divs = document.querySelectorAll('.playing-song-name-content');
    let artist_name_divs = document.querySelectorAll('.playing-artist-name');
    let song_image_divs = document.querySelectorAll('.current-song-img');
    CurrentSongID.textContent = songID;
    for (let i = 0; i < song_name_divs.length; ++i) {
        song_name_divs[i].textContent = songName;
    }
    for (let i = 0; i < song_image_divs.length; ++i) {
        song_image_divs[i].setAttribute('src', songImage);
    }
    for (let i = 0; i < artist_name_divs.length; ++i) {
        artist_name_divs[i].textContent = songArtists;
    }
    document.getElementById('mylyrics').setHTML(songLyrics);
    mysong.setAttribute('src', songUrl);
    mysong.load(songUrl);
    mysong.play();
    firstPlayButtonContent.className = 'glyphicon glyphicon-pause';
    secondPlayButtonContent.className = 'glyphicon glyphicon-pause';
    //trigger control bar
    let event = new MouseEvent("mouseover", {
        view: window,
        bubbles: true,
        cancelable: true
    });
    let target = document.querySelector('.trigger-button');
    target.dispatchEvent(event);
}
const changedAddButtonColor = 'rgb(120, 193, 243)';
function changeAddFavoriteButtonColor(add_button) {
    if (add_button.style.color !== changedAddButtonColor) {
        add_button.style.color = changedAddButtonColor;
    } else {
        add_button.style.color = 'white';
    }
}
