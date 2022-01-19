function Validator(selector) {
    var validatorRules = {
        alpha: function (value, title) {
            const onlyAlpha = /^[A-Za-z]+$/ug;
            return onlyAlpha.exec(value) || !value ? undefined : `${title} chỉ cho phép các chữ cái.`;
        },

        number: function (value, title) {
            const onlyNumber = /^[0-9]+$/;
            return onlyNumber.exec(value) || !value ? undefined : `${title} chỉ cho phép nhập số.`;
        },

        required: function (value, title) {
            return value ? undefined : `Hãy nhập ${title.toLowerCase()}`;
        },

        email: function (value, title) {
            const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
            return regex.test(value) ? undefined : 'Hãy nhập một email.';
        },

        min: function (minimum) {
            return function(value, title) {
                value.length <= minimum ? undefined : `Sử dụng ${minimum} ký tự trở lên cho ${title} của bạn.`;
            };
        },

        max: function (maximum) {
            return function(value, title) {
                value.length <= maximum ? undefined : `Sử dụng tối đa ${maximum} ký tự cho ${title} của bạn.`;
            };
        },

        equal: function (selector) {
            return function(value, title) {
                const temp = $(selector).val();
                if (temp) {
                    if(!value) {
                        return `${title} ${$(selector).attr('title').toLowerCase()} của bạn.`
                    }
                }
                return temp == value ? undefined : `Các ${$(selector).attr('title').toLowerCase()} đã nhập không khớp nhau. Hãy thử lại.`;
            };
        },

        strong: function (value, title) {
            const hasLower = /[a-z]/,
                hasUpper = /[A-Z]/,
                hasNumber = /[0-9]/,
                hasSpecial = /[`~!@#$%^&*()_+\{\}\[\]:;'",<>.?|]/,
                hasSpace = /\s/;
            if (!value) {
                return `Hãy nhập ${title.toLowerCase()} có tối thiểu 8 ký tự bao gồm số, chữ cái thường, chữ cái hoa và ký hiệu (như ! và &).` 
            }
            if(!hasLower.exec(value)) {
                return `${title} của bạn phải có ít nhất một chữ cái thường.`;
            }

            if(!hasUpper.exec(value)) {
                return `${title} của bạn phải có ít nhất một chữ cái hoa.`;
            }

            if(!hasNumber.exec(value)) {
                return `${title} của bạn phải có ít nhất một chữ số.`;
            }

            if(!hasSpecial.exec(value)) {
                return `${title} của bạn phải có ít nhất một ký hiệu đặc biệt hay dấu chấm câu (như ! và &).`;
            }

            if(hasSpace.exec(value)) {
                return `${title} của bạn không được có khoảng trắng.`;
            }

            return undefined;
        },

        checkedRequired: function(value, title) {
            return value ? undefined : `Bạn phải đồng ý trước khi tiếp tục.`;
        }
    };
    var formRules = {};
    // Lấy ra form element
    var formElement = $(selector);
    // console.log(formElement);

    // Chỉ xử lý dữ liệu khi form tồn tại
    if (formElement) {
        var submitBtn = formElement.find('[role=submit]');
        var inputs = formElement.find('input[name][rules], select');
        inputs.each(function () {
            var rules = $(this).attr('rules').split('|');
            for(let rule of rules) {
                var hasParams = rule.includes(':');
                var ruleInfo;
                if(hasParams) {
                   ruleInfo = rule.split(':');
                   rule = ruleInfo[0];
                }
                var ruleFunc = validatorRules[rule];
                if(hasParams) {
                    ruleFunc = ruleFunc(ruleInfo[1]);
                }
                if(Array.isArray(formRules[$(this).attr('id')])) {
                    formRules[$(this).attr('id')].push(ruleFunc);

                } else {
                    
                    formRules[$(this).attr('id')] = [ruleFunc];
                }
            }

            $(this).on({
                blur: function () {
                    var rules = formRules[$(this).attr('id')];
                    var errorMessage;
                    for (var rule of rules) {
                        let title = $(this).attr('title');
                        if(!title) {
                            title = $(this).siblings('label').text()
                        }                        
                        errorMessage = rule($(this).val(), $(this).attr('title'));
                        if(errorMessage) {
                        // Xảy ra lỗi input
                            $(this).addClass('is-invalid');
                            $(this).siblings('span.invalid-feedback').text(errorMessage);
                            if(!submitBtn.hasClass("disabled")) {
                                submitBtn.addClass('disabled');
                                submitBtn.attr("type", "button");
                            }
                            break;
                        }
                    }
                    if(!errorMessage) {
                        $(this).removeClass('is-invalid');
                        $(this).siblings('span.invalid-feedback').text('');
                        if(!$(this).hasClass('is-valid') && $(this).val()){
                            $(this).addClass('is-valid');
                        }
                        if(submitBtn.hasClass("disabled")) {
                            submitBtn.removeClass('disabled');
                            submitBtn.attr("type", "submit");
                        }
                    }

                },

                input: function() {
                    if ($(this).hasClass('is-invalid')) {
                        $(this).removeClass('is-invalid');
                        $(this).siblings('span.invalid-feedback').text('');
                    }
                    if ($(this).hasClass('is-valid')) {
                        $(this).removeClass('is-valid');
                    }
                    if(submitBtn.hasClass("disabled")) {
                        submitBtn.removeClass('disabled');
                        submitBtn.attr("type", "submit");
                    }
                }
            });

        })

        formElement.one('submit', function(event) {
            event.preventDefault();
            var isValid = true;
            inputs.each( function () {
                var rules = formRules[$(this).attr('id')];
                var errorMessage;
                for (var rule of rules) {
                    let title = $(this).attr('title');
                    // console.log($(this));
                    // console.log(title)
                    errorMessage = rule($(this).val(), $(this).attr('title'));
                    if(errorMessage) {
                        // Xảy ra lỗi input
                        isValid = false;
                        $(this).removeClass('is-valid');
                        $(this).addClass('is-invalid');
                        $(this).siblings('span.invalid-feedback').text(errorMessage);
                        if(!submitBtn.hasClass("disabled")) {
                            submitBtn.addClass('disabled');
                            submitBtn.attr("type", "button");
                        }
                        break;
                    }
                }
                if(!errorMessage) {
                    $(this).removeClass('is-invalid');
                    if(!$(this).hasClass('is-valid') && $(this).val()){
                        $(this).addClass('is-valid');
                    }
                    if(submitBtn.hasClass("disabled")) {
                        submitBtn.removeClass('disabled');
                        submitBtn.attr("type", "submit");
                    }
                    $(this).siblings('span.invalid-feedback').text('');
                }
            })
            // console.log(isValid);
            if(isValid) {
                $(this).submit();
                return true;
            }
            window.history.back();
        });
    }
}

$("input:checkbox").change(function () {
    if($(this).is(":checked")) {
        $(this).val('checked');
    } else {
        $(this).val('');
    }
})