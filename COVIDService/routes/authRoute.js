const express = require("express");
const authCtrl = require("../controllers/auth.C");

const router = express.Router();

router.route("/login").get(authCtrl.getSignIn).post(authCtrl.signin);
router.route("/signup").get(authCtrl.getSignUp).post(authCtrl.signup);
router.route("/signout").get(authCtrl.getSignOut);
module.exports = router;
