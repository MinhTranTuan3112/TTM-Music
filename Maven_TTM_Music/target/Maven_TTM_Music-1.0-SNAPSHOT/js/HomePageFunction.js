//load animations
const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add('show-load');
            observer.unobserve(entry.target);
        } else {
            entry.target.classList.remove('show-load');
        }
    });
});
const hiddenElements = document.querySelectorAll('.hidden-load');
hiddenElements.forEach((el) => observer.observe(el));

let songCovers = document.querySelectorAll('.song-cover');
songCovers.forEach(function (songCover) {
    songCover.addEventListener('mouseover', function () {
        let playButton = this.querySelector('.hover-play-button');
        let coverImg = this.querySelector('.song-cover-img');
        coverImg.style = 'filter: blur(2px)'; //blur the song cover img 
        playButton.style.display = 'flex'; //then make the button appears
    });
    songCover.addEventListener('mouseout', function () {
        let playButton = this.querySelector('.hover-play-button');
        let coverImg = this.querySelector('.song-cover-img');
        coverImg.style = 'filter: none'; //make the img normal again
        playButton.style.display = 'none'; //remove the play button
    });
});
function transferSongTimeBasedOnUI() {

}
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
