const express = require('express');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
require('dotenv').config({ path: './.env' });
require('./middlewares/handlebars')(app);

const userRouter = require('./routes/userRoute');
const packRouter = require('./routes/packageRoute');
const productRouter = require('./routes/productRoute');

const app = express();
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use(session({
    cookie: {
        httpOnly: true, maxAge: null
    },
    secret: process.env.SECRET_COOKIE,
    resave: false,
    saveUninitialized: false
}));

app.use(passport.initialize());
app.use(passport.session());

app.use('/', function (req, res) {
    res.render('homes');
})
app.use('/account', userRouter);
app.use('/products', productRouter);
app.use('/packages', packRouter);

app.use(express.static(path.join(__dirname + '/public')));
app.all('*', (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;