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

//for circle on page button
var pageItemList = document.querySelectorAll('.page_item');
pageItemList.forEach(function (pageItem) {
    pageItem.addEventListener('mouseover', function () {
        var page_circle = this.querySelector('.page-circle');
        page_circle.style.display = 'unset';
    });
    pageItem.addEventListener('mouseout', function () {
        var page_circle = this.querySelector('.page-circle');
        page_circle.style.display = 'none';
    });
});
/*next and prev page functions*/
function nextSongPage(totalSongPage, currentSongPage) {
    if (currentSongPage < totalSongPage) {
        window.location = './song?action=get&song_page=' + (currentSongPage + 1);
    } else if (currentSongPage === totalSongPage) {
        window.location = './song?action=get&song_page=1';
    }
}
function prevSongPage(totalSongPage, currentSongPage) {
    if (currentSongPage > 1) {
        window.location = './song?action=get&song_page=' + (currentSongPage - 1);
    } else {
        window.location = './song?action=get&song_page=' + totalSongPage;
    }
}