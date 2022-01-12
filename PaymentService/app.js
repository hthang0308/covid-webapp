const express = require('express');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
require('dotenv').config({ path: './.env' });
var morgan = require('morgan')

const app = express();
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

//Change: Add Override Method - PUT DELETE
const methodOverride = require("method-override");
const { mainModule } = require('process');
app.use(methodOverride("_method"));
//Done Change

app.use(session({
    cookie: {
        httpOnly: true, maxAge: null
    },
    secret: "helloworld",
    //secret: process.env.SECRET_COOKIE,
    resave: false,
    saveUninitialized: false
}));
require('./middlewares/handlebars')(app);
require('./middlewares/passport')(app);
app.use(passport.initialize());
app.use(passport.session());

//app.use(cors());

// if (process.env.NODE_ENV === 'development') {
//     app.use(morgan('dev'));
// } else {
//     app.use(morgan('combined'), {
//         skip(req, res) {
//             return res.statusCode < 400;
//         }
//     })
// }
const router = require('./routes/');
app.use('/', router);

app.use(express.static(path.join(__dirname + "../public")));
app.all("*", (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;
