const express = require('express')
const packCtrl = require('../controllers/package.C')
const authCtrl = require('../controllers/auth.C');
const router = express.Router()

// Login to access
router.use(authCtrl.protect);

// Manager access
router.use(authCtrl.restrictTo(2));
router.get('/', packCtrl.getAllPackages);
router.route('/:id')
    .get(packCtrl.getPackage)
    .patch(packCtrl.editPackage)
    .delete(packCtrl.deletePackage);
router.post('/add', packCtrl.createPackage);

module.exports = router