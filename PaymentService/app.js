const express = require('express');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
const morgan = require('morgan')
const cors = require('cors')

require('dotenv').config({ path: './.env' });

// Router
const paymentRouter = require('./routes/index');

const app = express();

app.use(session({
    cookie: {
        httpOnly: true, maxAge: null
    },
    secret: process.env.SECRET_COOKIE,
    resave: false,
    saveUninitialized: false
}));

require('./middlewares/handlebars')(app);
require('./middlewares/passport')(app);
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

//Change: Add Override Method - PUT DELETE
const methodOverride = require("method-override");
app.use(methodOverride("_method"));
//Done Change




app.use(cors());

if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'));
} else {
    app.use(morgan('combined'), {
        skip(req, res) {
            return res.statusCode < 400;
        }
    })
}
app.use('/', paymentRouter);

app.use(express.static(path.join(__dirname + "../public")));
app.all("*", (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;
