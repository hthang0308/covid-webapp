exports.forgotpassword = (req, res, next) => {
    res.render('auth/fpwd', {
        layout: 'authBG',
        title: "Quên mật khẩu",
    });
};

exports.login = (req, res, next) => {
    res.render('auth/login', {
        layout: 'authBG',
        title: "Đăng nhập",
    });
};

exports.signup = (req, res, next) => {
    res.render('auth/signup', {
        layout: 'authBG',
        title: "Đăng ký",
    });
};

exports.postForgotPassword = (req, res, next) => {
    console.log(req.body.username);
    res.json(req.body);
    res.redirect('/')
};

exports.postLogin = (req, res, next) => {
    res.json(req.body);
};

exports.postSignup = (req, res, next) => {
    res.json(req.body);
};