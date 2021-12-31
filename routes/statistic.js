const  express = require('express');
const router = express.Router();
const staController = require('../controllers/statisticCtrl');
router.get('/ssta', staController.simpleStatistic);
router.get('/sta', staController.statistic);
module.exports = router;