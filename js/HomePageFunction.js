let songCovers = document.querySelectorAll('.song-cover');
songCovers.forEach(function(songCover){
    songCover.addEventListener('mouseover', function(){
        let playButton = this.querySelector('.hover-play-button');
        let coverImg = this.querySelector('.song-cover-img');
        coverImg.style = 'filter: blur(2px)'; //blur the song cover img 
        playButton.style.display = 'flex'; //then make the button appears
    });
    songCover.addEventListener('mouseout', function(){
        let playButton = this.querySelector('.hover-play-button'); 
        let coverImg = this.querySelector('.song-cover-img');
        coverImg.style = 'filter: none'; //make the img normal again
        playButton.style.display = 'none'; //remove the play button
    });
});
