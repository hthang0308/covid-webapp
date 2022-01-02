const express = require('express')
const productCtrl = require('../controllers/product.C')

const router = express.Router()

router.get('/', productCtrl.getAllProducts)
router.route('/:id').get(productCtrl.getProduct).patch(productCtrl.editProduct).delete(productCtrl.deleteProduct)
router.post('/add', productCtrl.createProduct)

module.exports = router