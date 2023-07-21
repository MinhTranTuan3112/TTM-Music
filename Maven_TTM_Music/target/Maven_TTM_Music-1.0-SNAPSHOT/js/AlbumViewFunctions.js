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

function nextAlbumPage(totalAlbumPage, currentAlbumPage) {
    if (currentAlbumPage < totalAlbumPage) {
        window.location = './album?action=get&album_page=' + (currentAlbumPage + 1);
    } else if (currentAlbumPage === totalAlbumPage) {
        window.location = './album?action=get&album_page=1';
    }
}
function prevAlbumPage(totalAlbumPage, currentAlbumPage) {
    if (currentAlbumPage > 1) {
        window.location = './album?action=get&album_page=' + (currentAlbumPage - 1);
    } else {
        window.location = './album?action=get&album_page=' + totalAlbumPage;
    }
}