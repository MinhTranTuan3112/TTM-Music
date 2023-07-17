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
//check if browser is edge, hide eye icon
if (/Edge|Edg/.test(navigator.userAgent)) {
    document.getElementsByClassName('eye-icon')[0].style.display = 'none';
}
const pwShowHide = document.querySelectorAll(".eye-icon");

pwShowHide.forEach(eyeIcon => {
    eyeIcon.addEventListener("click", () => {
        let pwFields = eyeIcon.parentElement.parentElement.querySelectorAll(".password");

        pwFields.forEach(password => {
            if (password.type === "password") {
                password.type = "text";
                eyeIcon.classList.replace("bx-hide", "bx-show");
                return;
            }
            password.type = "password";
            eyeIcon.classList.replace("bx-show", "bx-hide");
        });

    });
});
//const links = document.querySelectorAll('.my-links');
//links.forEach(mylink => {
//    mylink.addEventListener("click", e => {
//        e.preventDefault(); //preventing form submit
//        forms.classList.toggle("show-signup");
//    });
//});
//
//links.forEach(mylink => {
//    mylink.addEventListener("click", e => {
//        e.preventDefault(); //preventing form submit
//        forms.classList.toggle("show-signup");
//    })
//})

//function changeUserSessionState(checkbox) {
//    if (checkbox.checked) {
//        document.getElementById("username").setAttribute("value", "${sessionScope.usersession.username}");
//        document.getElementById("password").setAttribute("value", "${sessionScope.usersession.password}");
//    } else {
//        document.getElementById("username").removeAttribute("value");
//        document.getElementById("password").removeAttribute("value");
//    }
//}
