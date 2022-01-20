const accountModel = require('../models/account.M');
const bcrypt = require('bcryptjs');
const passport = require('passport')
const jwt = require('jsonwebtoken');

class SignInController {
    getSignIn(req, res) {
        // if (req.cookies.un) {
        //     res.redirect('/');
        //     return;
        // }
        // else {
        //     req.session.user = null;
        // }
        res.render('signin', {
            nav: () => 'nav'
        });
    }

    async postSignInWithId(req, res, next) {
        if (req.body.username) {
            var acc = await accountModel.getAccountById(req.body.username);
            if (acc) {
                if (acc.Password) {
                    res.render('signinPass', {
                        accid: acc.AccID
                    });
                    return;
                }
                res.render('firstSignIn', {
                    accid: acc.AccID
                });
                return;
            }
            return res.render('signin', {
                msg: 'ID tài khoản không tồn tại',
                color: 'danger',
            })
        }
        res.render('signin', {
            msg: 'ID tài khoản trống',
            color: 'danger'
        })
    }

    async postSignIn(req, res, next) {
        if (!req.body.password) {
            return res.render('signinPass', {
                layout: 'main',
                msg: 'Vui lòng không để trống mật khẩu',
                accid: req.body.username,
                color: 'danger',
                nav: () => 'nav'
            })
        }
        passport.authenticate('local', function (err, user, info) {
            if (err) {
                return res.render('signinPass', {
                    layout: 'main',
                    msg: err,
                    accid: req.body.username,
                    color: 'danger',
                    nav: () => 'nav'
                });
            }
            if (!user) {
                return res.render('signinPass', {
                    layout: 'main',
                    msg: info.message,
                    accid: req.body.username,
                    color: 'danger',
                    nav: () => 'nav'
                });
            }

            req.logIn(user, function (err) {
                if (err) {
                    return res.render('signinPass', {
                        layout: 'main',
                        msg: err,
                        accid: req.body.username,
                        color: 'danger',
                        nav: () => 'nav'
                    });
                }
                var userToken = {
                    id: user.AccID
                }
                const token = jwt.sign(userToken, process.env.JWT_SECRET);
                res.cookie('access_token', token);
                return res.redirect('/');
            });
        })(req, res, next);
    }

    getFirstSignIn(req, res, next) {
        res.render('firstSignIn')
    }

    async postFirstSignIn(req, res, next) {
        if (req) {
            var account = await accountModel.getAccountByUsername(req.body.username);
            if (!account) {
                return res.render('firstSignIn', {
                    accid: 'empty',
                    msg: 'Không tồn tại ID tài khoản',
                    color: 'danger'
                })
            }
            if (account.Password) {
                return res.render('firstSignIn', {
                    accid: account.AccID,
                    msg: 'Tài khoản đã được tạo mật khẩu',
                    color: 'danger'
                })
            }
            const pass = req.body.password;
            const saltRounds = 10;
            const passHashed = await bcrypt.hash(pass, saltRounds);
            const acc = {
                AccID: account.AccID,
                Password: passHashed,
                Balance: account.Balance
            }
            const colName = "Password";
            // TODO: FIX THIS
            const data = await accountModel.updateAccount(acc.AccID, acc);
            return res.render('message', {
                msg: 'Tạo mât khẩu thành công',
                link: '/signin',
                text: 'Quay lại trang đăng nhập'
            });
        }
        res.redirect('/')
    }
}
module.exports = new SignInController();