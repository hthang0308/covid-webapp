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
      if (!roles.includes(req.user.f_Permission)) {
        return next(new AppError("You do not have permission to perform this action", 403));
      }
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
  if (req.cookies.jwt !== null && req.cookies.jwt !== undefined) {
    res.redirect("/");
  }
  res.render("auth/signup", {
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
  let user = await userModel.getUserByName(req.body.username);
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
    return res.status(200).send({
      user: user,
      token: token,
    });
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
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;

  const tmpUser = {
    f_Username: username,
    f_Password: passwordHashed,
    f_Permission: 1,
    f_History: [`${currentTime} Create User`],
  };

  await accountM.addAccount(tmpUser);
  res.redirect("./login");
};

exports.getChangePassword = async (req, res) => {

}

exports.changePassword = async (req, res) => {
  const tmpUser = await accountM.getAccountByID(req.params.id);
  if (tmpUser === undefined) return;
  // const passwordOld = req.body.oldPassword;

  // Step1: Check the new password and compare to old password
  const checkOld = bcrypt.compare(req.body.newPassword, tmpUser.f_Password);
  if (checkOld) {
    res.render('user/form_change_password', {
      msg: 'Mật khẩu mới không được trùng với mật khẩu trước đó'
    })
  }

  // Step 2: Check for the similarities between the new Password and confirm password 
  const checkConfirm = bcrypt.compare(req.body.confirmPassword, req.body.newPassword);
  if (!checkConfirm) {
    res.render('user/form_change_password', {
      msg: 'Vui lòng xác nhận lại mật khẩu'
    });
  }

  // Step 3: Hash password
  const passwordHashed = bcrypt.hash(req.body.password, saltRounds);
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;

  const newUser = {
    f_Username: username,
    f_Password: passwordHashed,
    f_Permission: 1,
    f_History: [`${currentTime} Change password`],
  };

  // Step 4: Delete token, Update and redirect to login
  await accountM.editAccount(req.params.id, newUser);
  res.clearCookie("jwt");
  res.redirect('./login')
}

exports.getForgotPassword = async (req, res) => {

}

exports.forgotPassword = async (req, res) => {

}