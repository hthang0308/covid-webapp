const express = require('express')
const productCtrl = require('../controllers/productCtrl')

const router = express.Router()

router.get('/', productCtrl.getAllProducts)
router.route('/:id').get(productCtrl.getProduct).patch(productCtrl.editProduct).delete(productCtrl.deleteProduct)
router.post('/add', productCtrl.addProduct)

module.exports = router