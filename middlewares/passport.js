const passport = require('passport'),
    LocalStrategy = require('passport-local').Strategy;


const userModel = require('../models/userModel');

passport.use(new LocalStrategy(
    async function (username, password, done) {
        const user = await userModel.checkCorrectAccount(username, password);
        if (!user) {
            return done(null, false, { message: 'Incorrect username or password' });
        }
        return done(null, user);
    }
));

passport.serializeUser(function (user, done) {
    done(null, user.id);
});

passport.deserializeUser(function (id, done) {
    userModel.getUser(id)
        .then((user) => {
            done(null, user);
        })
});

module.exports = passport;