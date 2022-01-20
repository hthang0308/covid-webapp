const userModel = require("../models/user.M");
const AppError = require("../utils/appError");
const { promisify } = require("util");
const jwt = require("jsonwebtoken");
const sendResponse = require("../utils/sendResponse");
const bcrypt = require("bcryptjs");
const saltRounds = 10;
const accountM = require("../models/account.M");

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
    // if (!roles.includes(req.user.f_Permission)) {
    //   return next(new AppError("You do not have permission to perform this action", 403));
    // }
    return next();
  };

exports.createAndSendToken = (user, statusCode, res) => {
  const token = jwt.sign({ id: user.f_ID }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

  return sendResponse({ token }, statusCode, res);
};

exports.getSignUp = async (req, res) => {
  //chuyen huong khi da co jwt
  console.log("123");
  if (req.cookies.jwt !== null && req.cookies.jwt !== undefined) {
    res.redirect("/");
  }
  const allUser = await userModel.getAllUsers();
  console.log(allUser.length);
  if (allUser.length > 0) {
    return res.redirect("login");
  }
  return res.render("auth/signup", {
    layout: "authBG",
    title: "Đăng ký",
  });
};

exports.getSignIn = async (req, res) => {
  //chuyen huong khi da co jwt
  if (req.cookies.jwt !== null && req.cookies.jwt !== undefined) {
    res.redirect("/");
  }
  res.render("auth/login", {
    layout: "authBG",
    title: "Đăng nhập",
  });
};

exports.getSignOut = async (req, res) => {
  //chuyen huong khi da co jwt
  if (req.cookies.jwt !== null) {
    res.clearCookie("jwt");
  }
  res.redirect("/auth/login");
};

exports.signin = async (req, res) => {
  let user = await userModel.getUserByUsername(req.body.username);
  // console.log(user);
  if (user === null || user === undefined) {
    return res.render("auth/login", {
      layout: "authBG",
      title: "Đăng nhập",
      msg: "Không tồn tại username",
    });
  }
  // console.log(user);
  if (user.f_Permission < 0) {
    return res.render("auth/login", {
      layout: "authBG",
      title: "Đăng nhập",
      msg: "Tài khoản đã bị khóa",
    });
  }
  // console.log(user);
  const challengeResult = await bcrypt.compare(req.body.password, user.f_Password);
  if (challengeResult) {
    const token = jwt.sign({ id: user.f_ID }, process.env.JWT_SECRET, {
      expiresIn: process.env.JWT_EXPIRES_IN,
    });
    //res.cookie("token", token, { httpOnly: true });
    // const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "1d" });
    res.cookie("jwt", token);
    // Send the response with 200 status code (ok) and the user object + the token
    // The client will send the token with every future request
    // against secured API endpoints.
    // TODO: Return to dashboard after login
    // return res.status(200).send({
    //   user: user,
    //   token: token,
    // });
    return res.redirect("/");
  }
  return res.render("auth/login", {
    layout: "authBG",
    title: "Đăng nhập",
    msg: "Tài khoản hoặc mật khẩu sai",
  });
};

exports.signup = async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  let user = await accountM.getAccountByUsername(username);
  if (user) {
    res.redirect("./login");
    return;
  }
  const passwordHashed = await bcrypt.hash(password, saltRounds);
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${
    currentDate.getMonth() + 1
  }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
  const tmpUser = {
    f_Username: username,
    f_Password: passwordHashed,
    f_Permission: 1,
    f_History: [`${currentTime} Manager Create User`],
  };

  await accountM.addAccount(tmpUser);
  res.redirect("./login");
};

exports.getChangePassword = async (req, res) => {
  return res.render("normaluser/changepassword", {
    layout: "manager",
  });
};

exports.changePassword = async (req, res) => {
  if (req.user.f_Password !== "" && req.user.f_Password !== null) {
    let checkOld = false;
    try {
      checkOld = await bcrypt.compare(req.body.oldPassword, req.user.f_Password);
    } catch (err) {
      console.log(err);
    }
    if (!checkOld) {
      return res.render("normaluser/changepassword", {
        layout: "manager",
        data: req.body,
        err: "Old password not match",
      });
    }
  }
  const checkSame = req.body.newPassword === req.body.confirmNewPassword;
  if (!checkSame) {
    return res.render("normaluser/changepassword", {
      layout: "manager",
      data: req.body,
      err: "Confirm new password is wrong!",
    });
  }
  const passwordHashed = await bcrypt.hash(req.body.newPassword, saltRounds);
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${
    currentDate.getMonth() + 1
  }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
  req.user.f_Password = passwordHashed;
  req.user.f_History.push(`${currentTime} Change password`);
  await accountM.editAccount(req.user.f_ID, req.user);
  console.log(req.user);
  return res.render("normaluser/changepassword", {
    layout: "manager",
    data: req.body,
    err: "Change password successfully!",
  });
};

exports.getForgotPassword = async (req, res) => {};

exports.forgotPassword = async (req, res) => {};
