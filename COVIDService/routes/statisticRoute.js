const express = require('express');
const statCtrl = require('../controllers/statistic.C');

const router = express.Router();

router.get('/ssta', statCtrl.simpleStatistic);
router.get('/sta', statCtrl.statistic);

module.exports = router;