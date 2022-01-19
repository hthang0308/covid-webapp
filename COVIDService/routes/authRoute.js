const express = require("express");
const authCtrl = require("../controllers/auth.C");

const router = express.Router();

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. User signs up.

router.route("/login").get(authCtrl.getSignIn).post(authCtrl.signin);
router.route("/signup").get(authCtrl.getSignUp).post(authCtrl.signup);
router.route("/signout").get(authCtrl.getSignOut);
module.exports = router;
