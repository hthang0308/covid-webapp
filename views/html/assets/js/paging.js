const perPage = 3;
var rowTotal = $('#content-1 .table-content tbody tr').length;
$('#content-1 #main-pagination').twbsPagination({
    totalPages: Number.isInteger(rowTotal/perPage) ? rowTotal/perPage : rowTotal/perPage + 1,
    startPage: 1,
    visiblePages: 5,
    onPageClick: function (event, page) {
        $(`#content-1 .table-content tbody tr`).addClass('d-none');
        for(let i = (page-1)*perPage + 1 ; i <= page*perPage ; i++) {
            $(`#content-1 .table-content tbody tr:nth-child(${i})`).removeClass('d-none');

            // TRUY VẤN KHI DÙNG BE LOAD PAGE
            // var url = $('.content').attr('value') +'/?page='+ page;
            // window.location.href = url;
        }
    },
    initiateStartPageClick: 'true',
    hideOnlyOnePage: 'true',
    paginationClass: 'pagination justify-content-center justify-content-md-end',
    first: '<span aria-hidden="true">&laquo;</span>',
    prev: '<span aria-hidden="true">&lsaquo;</span>',
    next: '<span aria-hidden="true">&rsaquo;</span>',
    last: '<span aria-hidden="true">&raquo;</span>',
});
