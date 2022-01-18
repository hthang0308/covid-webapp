const packageRouter = require("./packageRoute");
const productRouter = require("./productRoute");
const userRouter = require("./userRoute");
const statRouter = require("./statisticRoute");
const authRouter = require("./authRouter");
const accountRouter = require("./accountRouter");
const passport = require("passport");

function route(app) {
  app.use("/auth", authRouter);
  app.use("/user", passport.authenticate("jwt", { session: false }), userRouter);
  app.use("/statistic", passport.authenticate("jwt", { session: false }), statRouter);
  app.use("/product", passport.authenticate("jwt", { session: false }), productRouter);
  app.use("/package", passport.authenticate("jwt", { session: false }), packageRouter);
  app.use("/account", passport.authenticate("jwt", { session: false }), accountRouter);
}

module.exports = route;
