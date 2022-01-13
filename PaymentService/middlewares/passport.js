const passport = require('passport'),
    LocalStrategy = require('passport-local').Strategy;

const JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;

const db = require('../utils/db');
const accountModel = require('../models/account.M');
const bcrypt = require('bcryptjs');

let opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = process.env.SECRET_KEY;

module.exports = app => {
    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    },
        async (username, password, done) => {
            try {
                const acc = await accountModel.getAccountByUsername(username);
                if (!acc) {
                    return done(null, false, { message: 'Sai số tài khoản.' });
                }
                if (!acc.Password) {
                    return done(null, false, { message: 'Chưa tạo mật khẩu cho tài khoản.' });
                }
                let checkPass = await bcrypt.compare(password, acc.Password);
                if (!checkPass) {
                    return done(null, false, { message: 'Sai mật khẩu.' });
                }
                return done(null, acc);

            } catch (error) {
                return done(error);
            }
        }
    ));

    var cookieExtractor = function (req) {
        var token = null;
        if (req && req.cookies) token = req.cookies['Authorization'];
        return token;
    };
    passport.use(new JwtStrategy({
        jwtFromRequest: cookieExtractor,
        secretOrKey: 'hello'
    }, function (jwt_payload, done) {
        try {
            const user = accountModel.get(jwt_payload.name);
            if (user) {
                return done(null, user);
            } else {
                return done(null, false);
            }
        } catch (error) {
            return done(err, false);

        }
    }));

    passport.serializeUser(function (user, done) {
        const userSe = {
            AccID: user.AccID,
            Balance: user.Balance
        }
        done(null, userSe);
    });

    passport.deserializeUser(async (user, done) => {
        try {
            const userDe = await accountModel.get(user.AccID);
            const user2 = {
                AccID: userDe.AccID,
                Balance: userDe.Balance
            }
            done(null, user2);
        } catch (error) {
            done(error, null);
        }
    });

    app.use(passport.initialize());
    app.use(passport.session());
}