const express = require("express");
const authCtrl = require("../controllers/auth.C");
const normalCtrl = require("../controllers/normalUser.C");
const router = express.Router();

router.use(authCtrl.protect);

router.route("/").get(normalCtrl.getHome);

router.route("/balance").get(normalCtrl.getBalance);
router.route("/history").get(normalCtrl.getHistory);
router.route("/order").get(normalCtrl.getOrder);
router.route("/deposit").get(normalCtrl.deposit);

module.exports = router;
