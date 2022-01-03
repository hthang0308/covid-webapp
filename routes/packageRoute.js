const express = require('express')
const packCtrl = require('../controllers/package.C')

const router = express.Router()

router.get('/', packCtrl.getAllPackages);
router.route('/:id').get(packCtrl.getPackage).patch(packCtrl.editPackage).delete(packCtrl.deletePackage);
router.post('/add', packCtrl.addPackage);

module.exports = router