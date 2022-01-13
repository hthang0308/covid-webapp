$(document).ready(function () {
    $(window).resize(function () {
        $('#sidebar').css('top', $('#main-navbar').height());
    })
});