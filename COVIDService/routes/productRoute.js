const express = require('express')
const productCtrl = require('../controllers/product.C')
const authCtrl = require('../controllers/auth.C');

const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// Manager access
router.use(authCtrl.restrictTo('manager'));
router.get('/', productCtrl.getAllProducts)
router.route('/:id').get(productCtrl.getProduct).patch(productCtrl.editProduct).delete(productCtrl.deleteProduct)
router.post('/add', productCtrl.createProduct)

module.exports = router