const packageRouter = require("./packageRoute");
const productRouter = require("./productRoute");
const userRouter = require("./userRoute");
const statRouter = require("./statisticRoute");
const authRouter = require("./authRouter");
const passport = require("passport");

function route(app) {
  app.use("/account", authRouter);
  app.use("/user", passport.authenticate("jwt", { session: false }), userRouter);
  app.use("/statistic", passport.authenticate("jwt", { session: false }), statRouter);
  app.use("/products", passport.authenticate("jwt", { session: false }), productRouter);
  app.use("/packages", passport.authenticate("jwt", { session: false }), packageRouter);
}

module.exports = route;
