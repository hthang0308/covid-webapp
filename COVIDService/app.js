const express = require('express');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
require('dotenv').config({ path: './.env' });
const { rmSync } = require('fs');

const userRouter = require('./routes/userRoute');
const packRouter = require('./routes/packageRoute');
const productRouter = require('./routes/productRoute');
const statisticRouter = require('./routes/statisticRoute');

const app = express();
require('./middlewares/handlebars')(app);
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
//Change: Add Override Method - PUT DELETE
const methodOverride = require("method-override");
const morgan = require('morgan');
app.use(methodOverride("_method"));
//Done Change

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

app.get('/', function (req, res) {
  res.render("home", {
    cssP: () => "css",
    scriptP: () => "empty",
    navP: () => "nav",
    footerP: () => "footer",
  });
});

app.use('/user', userRouter);
app.use('/products', productRouter);
app.use('/packages', packRouter);
app.use('/statistic', statisticRouter);

app.use(express.static(path.join(__dirname + "/public")));
app.all("*", (req, res, next) => {
  next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;
