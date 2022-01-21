const express = require("express");
const statCtrl = require("../controllers/statistic.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

router.get("/ssta", statCtrl.simpleStatistic);
router.get("/sta", statCtrl.statistic);
router.post("/sta", statCtrl.statistic);

module.exports = router;
