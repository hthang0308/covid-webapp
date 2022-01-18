const userModel = require("../models/user.M");
const AppError = require("../utils/appError");
const { promisify } = require("util");
const jwt = require("jsonwebtoken");

exports.protect = async (req, res, next) => {
  // Checking token
  let token;
  if (req.cookies.token !== null) req.headers.authorization = "Bearer " + req.cookies.jwt;
  //
  if (req.headers.authorization && req.headers.authorization.startsWith("Bearer")) {
    token = req.headers.authorization.split(" ")[1];
  }
  if (!token) {
    return next(new AppError("You are not logged in!!!", 401));
  }

  // Checking user
  const verified = await promisify(jwt.verify)(token, process.env.JWT_SECRET);
  const user = await userModel.getUserByID(verified.id);
  if (!user) return next(new AppError("This user does no longer exist.", 404));

  // Change password after token issued

  // Assigning user
  req.user = user;
  return next();
};

exports.restrictTo =
  (...roles) =>
  (req, res, next) => {
    if (!roles.includes(req.user.f_Permission)) {
      return next(new AppError("You do not have permission to perform this action", 403));
    }
    return next();
  };

exports.createAndSendToken = (user, statusCode, res) => {
  const token = jwt.sign({ id: user.f_ID }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

exports.getSignUp = async (req, res) => {
  res.render("auth/signup", {
    layout: "authBG",
    title: "Đăng ký",
  });
};

exports.getSignIn = async (req, res) => {
  res.render("auth/login", {
    layout: "authBG",
    title: "Đăng nhập",
  });
};

exports.signin = async (req, res) => {
  //TODO: chuyen huong khi da co jwt
  let user = await userModel.getUserByName(req.body.username);
  console.log(user);
  if (user === undefined || user === null) {
    //TODO: render error
    return res.render("auth/login", {
      layout: "authBG",
      title: "Đăng nhập",
    });
  }
  if (user.f_Password == req.body.password) {
    const token = jwt.sign({ id: user.f_ID }, process.env.JWT_SECRET, {
      expiresIn: process.env.JWT_EXPIRES_IN,
    });
    //res.cookie("token", token, { httpOnly: true });
    // const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "1d" });
    res.cookie("jwt", token);
    // Send the response with 200 status code (ok) and the user object + the token
    // The client will send the token with every future request
    // against secured API endpoints.
    res.status(200).send({
      user: user,
      token: token,
    });
  }
};

exports.signup = async (req, res) => {
  console.log(req.params);
  console.log(req.query);
};
