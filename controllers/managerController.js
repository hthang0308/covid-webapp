exports.default = (req, res, next) => {
    res.redirect('dashboard')
}

exports.dashboard = (req, res, next) => {
    res.render('manager/dashboard', {
        layout: 'manager',
        title: 'Dashboard',
    })
}

exports.necessities = (req, res, next) => {
    res.render('manager/necessities', {
        layout: 'manager',
        title: 'Người liên quan Covid-19',
    })
}

exports.people = (req, res, next) => {
    res.render('manager/people', {
        layout: 'manager',
        title: 'Những người liên quan Covid-19',
    })
}

exports.packages = (req, res, next) => {
    res.render('manager/packages', {
        layout: 'manager',
        title: 'Gói nhu yêu phẩm',
    })
}