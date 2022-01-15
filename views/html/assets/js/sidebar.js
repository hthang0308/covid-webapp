$(document).ready(function () {
    $(window).resize(function () {
        $('#sidebar').css('top', $('#main-navbar').height());
    })

    $('#sidebar .nav-link').hover(
        function () {
            $(this).addClass('rounded-pill');
        },
        function () {
            $(this).removeClass('rounded-pill');
        }
    )
});