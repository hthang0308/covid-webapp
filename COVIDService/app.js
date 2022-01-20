process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
//require("https").globalAgent.options.ca = require("ssl-root-cas/latest").create();

const express = require("express");
const path = require("path");
const session = require("express-session");
const passport = require("passport");
const handlebars = require("./middlewares/handlebars");
const route = require("./routes");
const methodOverride = require("method-override");
const morgan = require("morgan");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const dotenv = require("dotenv");

// const app = express();
const app = require("https-localhost")();

app.use(cookieParser());
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

//Change: Add Override Method - PUT DELETE
app.use(methodOverride("_method"));
//Done Change

dotenv.config({ path: "./.env" });
//thang them
//done
app.use(
  session({
    cookie: {
      httpOnly: true,
      maxAge: null,
    },
    secret: process.env.SECRET_COOKIE,
    resave: false,
    saveUninitialized: false,
  })
);

app.use(passport.initialize());
app.use(passport.session());
require("./middlewares/passport")(app);
app.use(cors());
handlebars(app);
if (process.env.NODE_ENV === "development") {
  app.use(morgan("dev"));
} else {
  app.use(morgan("combined"), {
    skip(req, res) {
      return res.statusCode < 400;
    },
  });
}

app.get("/", function (req, res) {
  console.log(req.cookies);
  res.render("home", {
    cssP: () => "css",
    username: req.cookies.username,
    // scriptP: () => "empty",
    // navP: () => "nav",
    footerP: () => "footer",
  });
});
route(app);

app.use(express.static(path.join(__dirname + "/public")));
app.all("*", (req, res, next) => {
  next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;
