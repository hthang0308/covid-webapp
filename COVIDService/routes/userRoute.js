const express = require("express");
const userCtrl = require("../controllers/user.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. User signs up.

// User roles
// router.use(authCtrl.restrictTo(1))
router.route("/").get(userCtrl.getHome);
router.route('/getBalance/:id').get(userCtrl.getBalance);
router.route("/history").get(userCtrl.getHistory);

// Manager roles
router.use(authCtrl.restrictTo(0, 2));
router.route("/all").get(userCtrl.getAllUsers);
router.get("/search", userCtrl.searchUser); //user/search?id=2333
router.route("/create").get(userCtrl.getCreateForm).post(userCtrl.createUser);
router.get("/:id/change_covid_address", userCtrl.getChangeCovidAddressForm);
router.route("/:id").get(userCtrl.getUser).put(userCtrl.editUser);

// Admin roles
router.use(authCtrl.restrictTo(0));

module.exports = router;
