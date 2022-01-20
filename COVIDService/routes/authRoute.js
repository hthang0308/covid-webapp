const express = require("express");
const authCtrl = require("../controllers/auth.C");
const { route } = require("./packageRoute");

const router = express.Router();

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. Manager creates User.

router.route("/login").get(authCtrl.getSignIn).post(authCtrl.signin);
router.route("/signup").get(authCtrl.getSignUp).post(authCtrl.signup);
router.route("/signout").get(authCtrl.getSignOut);

// Forgot Password
router.route("/forget-password").get(authCtrl.getForgotPassword).put(authCtrl.forgotPassword);

// Change password inside user, means login
router.use(authCtrl.protect);
router.route("/changepassword").get(authCtrl.getChangePassword).put(authCtrl.changePassword);
module.exports = router;
