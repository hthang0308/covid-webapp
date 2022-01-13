$(function() {
    // console.log('main.js')
    $('#sub-nav__sort-by').on('change', function() {
        var value = $(this).find('option').filter(':selected').val()
        var newURL = $('#sortby-form').attr('action') + '/?sort_by=' + value;
        console.log(newURL)
        window.location.href = newURL;
    })
    
})