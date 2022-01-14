$(document).ready(function(){ 
    // Begin: Sidebar
    $(".sidebar .card-link").click(function(){
        if(!$(this).hasClass("active")) {
            $(".sidebar .card-link").removeClass("active");
            $(this).addClass("active");
        }
    })

    $('#toggle-collapse-btn').click(function(){
        $(".sidebar").toggleClass("is-collapsed");
        $(".sidebar-wrapper").toggleClass("col-3");
        $(".sidebar-wrapper").toggleClass("col-1");
    })
});