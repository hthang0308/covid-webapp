const passport = require("passport");
const JwtStrategy = require("passport-jwt").Strategy;

const userM = require("../models/user.M");

var opts = {};
opts.secretOrKey = process.env.JWT_SECRET;
opts.jwtFromRequest = function (req) {
  var token = null;
  if (req && req.cookies) {
    token = req.cookies["jwt"];
  }
  return token;
};

module.exports = (app) => {
  passport.use(
    new JwtStrategy(opts, async function (jwt_payload, done) {
      try {
        let user = await userM.getUserByID(jwt_payload.id);
        if (!user) {
          return done(null, false, { message: "Incorrect username." });
        } else return done(null, user, { message: "Successfully" });
      } catch (err) {
        return done(err, false);
      }
    })
  );
  passport.serializeUser(function (user, done) {
    done(null, user);
  });

  passport.deserializeUser(async (user, done) => {
    try {
      const u = await userM.get(user.f_Username);
      done(null, u);
    } catch (error) {
      done(new Error("err"), null);
    }
  });
  app.use(passport.initialize());
};
