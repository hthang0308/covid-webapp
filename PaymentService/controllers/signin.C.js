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
    async postSignIn(req, res, next) {
        passport.authenticate('local', function (err, user, info) {
            if (err) {
                return res.render('signin', {
                    layout: 'main',
                    msg: err,
                    color: 'danger',
                    nav: () => 'nav'
                });
            }
            if (!user) {
                return res.render('signin', {
                    layout: 'main',
                    msg: info.message,
                    color: 'danger',
                    nav: () => 'nav'
                });
            }

            req.logIn(user, function (err) {
                if (err) {
                    return res.render('signin', {
                        layout: 'main',
                        msg: err,
                        color: 'danger',
                        nav: () => 'nav'
                    });
                }
                // var userToken = {
                //     name: user.f_Username
                // }
                // const token = jwt.sign(userToken, 'hello');
                // res.cookie('Authorization', token);
                return res.redirect('/');
            });
        })(req, res, next);
    }

    getFirstSignIn(req, res, next) {
        res.render('firstSignIn')
    }

    async postFirstSignIn(req, res, next) {
        if (req) {
            var account = await accountModel.get(req.body.username);
            if (!account) {
                res.render('firstSignIn', {
                    msg: 'Không tồn tại ID tài khoản',
                    color: 'danger'
                })
                return;
            }
            if (account.Password) {
                res.render('firstSignIn', {
                    msg: 'Tài khoản đã được tạo mật khẩu',
                    color: 'danger'
                })
                return;
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
            const data = await accountModel.update(acc, colName);
            res.render('message');
            return;
        }
        res.redirect('/')
    }
}
module.exports = new SignInController();