const express = require("express");
const path = require("path");

// const mathRouter = require('./routes/mathRouter');
// const meetRouter = require('./routes/meetingRouter');
// const userRouter = require('./routes/userRouter');

const app = express();
require("./middlewares/handlebars")(app);

// app.set('view engine', 'ejs');
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use("/user", require("./controllers/user.C"));

app.get("/", (req, res) => {
  res.render("home", {
    cssP: () => "css",
    scriptP: () => "empty",
    navP: () => "nav",
    footerP: () => "footer",
  });
});

app.use(express.static(path.join(__dirname + "/public")));
app.all("*", (req, res, next) => {
  next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;
