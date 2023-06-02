function playSong() {
    alert('ok');
} 
function mouseOnSong(song) {
    document.getElementsByClassName('play-button')[0].style.display = 'unset';
    song.style = 'filter: blur(5px)';
}
function mouseOutSong(song) {
    document.getElementsByClassName('play-button')[0].style.display = 'none';
    song.style = 'filter: none';
}
let songImgs = document.getElementsByClassName('song-cover-img');
for (let i = 0; i < songImgs.length; ++i) {
    songImgs[i].addEventListener('click', function () {
        alert('ok');
    });
}