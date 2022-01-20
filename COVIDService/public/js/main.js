$(function() {
    $('#sub-nav__sort-by').on('change', function() {
        $('#sortby-form').submit();
    })
    
    $('button[data-target="#edit-modal"]').click(function(e) {
        let target_modal = $(this).attr('data-target');
        for(const col of $(this).parents('td').siblings()) {
            let value = $(col).text();
            let class_name = $(col).attr('title');
            $(`#edit-modal .modal-body .${class_name}`).val(value.trim());
        }

        $(`${target_modal} .more-info-link`).attr('href', $(this).parents('td').siblings('.name').find('a.details-link').attr('href'));
    })

    $('button[data-target="#delete-modal"]').click(function () {
        let target_modal = $(this).attr('data-target');
        let name = $(this).parents('td').siblings(".name").text();
        $(`${target_modal} .message`).text(`Bạn chắc chắn muốn xóa ${name.trim()}?`);
    })

    $("form").each(function () {
        var formElement = $(this);
        $(this).find("input, select, textarea").on({
            input: function (event) {
                formElement.find('[type=submit]').each(function () {
                    console.log($(this).text());
                    if($(this).hasClass("disabled")) {
                        $(this).removeClass('disabled');
                        return;
                    }
                })
            }
        })
    })
})