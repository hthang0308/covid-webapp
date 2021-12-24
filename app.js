const express = require('express');
const path = require('path');
const exhbs = require('express-handlebars');
const session = require('express-session');
const passport = require('passport');

const userRouter = require('./routes/userRoute');
const packRouter = require('./routes/packageRoute');
const productRouter = require('./routes/productRoute');

const app = express();

app.engine('hbs', exhbs({
    defaultLayout: 'layout',
    extname: 'hbs',
    layoutsDir: 'views',
    partialsDir: 'views/partials',
    helpers: {
        section: hbs_section()
    }
}));
app.set('view engine', 'hbs');
var hbs = exhbs.create({});
hbs.handlebars.registerHelper("when", function (op1, op2, opt, choice) {
    var opts = {
        'eq': function (l, r) { return l == r },
        'noteq': function (l, r) { return l != r },
        'gt': function (l, r) { return Number(l) > Number(r) },
        'or': function (l, r) { return l || r },
        'and': function (l, r) { return l & r },
        '%': function (l, r) { return (l % r) === 0 },
    }, result = opts[opt](op1, op2);

    if (result) return choice.fn(this);
    else return choice.inverse(this);
})

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

app.use('/', userRouter);
app.use('/products', productRouter);
app.use('/packages', packRouter);

app.use(express.static(path.join(__dirname + '/public')));
app.all('*', (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;