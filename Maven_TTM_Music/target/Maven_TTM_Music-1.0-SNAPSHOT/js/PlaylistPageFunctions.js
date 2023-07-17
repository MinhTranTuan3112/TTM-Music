// //for asking user to submit the form when leaving
// window.addEventListener("beforeunload", function (e) {
//     var confirmationMessage = "Are you sure you want to leave this page? Any unsaved changes will be lost.";
//     e.returnValue = confirmationMessage;
//     if (confirm(confirmationMessage)) {
//         document.querySelector("#playlist-form").submit();
//     }
// });
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



var form = document.getElementById('playlist-form');
var editable = document.getElementById('playlist-name');
var hiddenInput = document.getElementById('playlistname');

form.addEventListener('submit', function (event) {
    // update hidden input value
    hiddenInput.value = editable.textContent;
});
//hover effects for remove buttons
let playlistItems = document.querySelectorAll('.playlist-item');
playlistItems.forEach(function (playlistItem) {
    playlistItem.addEventListener('mouseover', function () {
        let playlistButtons = this.querySelector('.playlist-item-buttons');
        if (playlistButtons !== null) {
            playlistButtons.style.display = 'flex';
        }
    });
    playlistItem.addEventListener('mouseout', function () {
        let playlistButtons = this.querySelector('.playlist-item-buttons');
        if (playlistButtons !== null) {
            playlistButtons.style.display = 'none';
        }
    });
});
//remove a song 
let removeButtons = document.querySelectorAll('.remove-button');
removeButtons.forEach(function (removeButton) {
    removeButton.addEventListener('click', function () {
        if (confirm('Remove this song from the playlist')) {
            let playlistItem = removeButton.closest('.playlist-item');
            if (playlistItem !== null) {
                playlistItem.remove();
            }
        }
    });
});
//add a new song template
function addSong() {
    let playlistContent = document.querySelector('.playlist-content');
    let templateContent = document.getElementsByTagName('template')[0];
    let clon = templateContent.content.cloneNode(true);
    playlistContent.appendChild(clon);
    let playlistItems = document.querySelectorAll('.playlist-item');
    playlistItems.forEach(function (playlistItem) {
        playlistItem.addEventListener('mouseover', function () {
            let playlistButtons = this.querySelector('.playlist-item-buttons');
            if (playlistButtons !== null) {
                playlistButtons.style.display = 'flex';
            }
        });
        playlistItem.addEventListener('mouseout', function () {
            let playlistButtons = this.querySelector('.playlist-item-buttons');
            if (playlistButtons !== null) {
                playlistButtons.style.display = 'none';
            }
        });
    });
    let removeButtons = document.querySelectorAll('.remove-button');
    removeButtons.forEach(function (removeButton) {
        removeButton.addEventListener('click', function () {
            if (confirm('Remove this song from the playlist')) {
                let playlistItem = removeButton.closest('.playlist-item');
                if (playlistItem !== null) {
                    playlistItem.remove();
                }
            }
        });
    });
}
//hover play buttons on songs
let songCovers = document.querySelectorAll('.playlist-item-img');
songCovers.forEach(function (songCover) {
    songCover.addEventListener('mouseover', function () {
        let playButton = this.querySelector('.hover-play-button');
        let coverImg = this.querySelector('.playlist-item-img-content');
        coverImg.style = 'filter: blur(2px)'; //blur the song cover img 
        playButton.style.display = 'flex'; //then make the button appears
    });
    songCover.addEventListener('mouseout', function () {
        let playButton = this.querySelector('.hover-play-button');
        let coverImg = this.querySelector('.playlist-item-img-content');
        coverImg.style = 'filter: none'; //make the img normal again
        playButton.style.display = 'none'; //remove the play button
    });
});