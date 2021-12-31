const express = require("express");
const path = require("path");

const userRouter = require("./routes/userRoute");

const app = express();
require("./middlewares/handlebars")(app);
// app.set('view engine', 'ejs');
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
app.use("/user", userRouter);

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
