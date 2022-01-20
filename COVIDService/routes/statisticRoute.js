const express = require("express");
const statCtrl = require("../controllers/statistic.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. Manager creates User.

// This route is for manager (PID 2) only
router.use(authCtrl.restrictTo(0, 1, 2));
router.get("/ssta", statCtrl.simpleStatistic);
router.get("/sta", statCtrl.statistic);

module.exports = router;
