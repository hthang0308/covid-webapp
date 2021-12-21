const express = require('express');
const userCtrl = require('../controllers/userCtrl');

const router = express.Router()

router.get('/', userCtrl.getAllUsers)
router.route('/:id').get(userCtrl.getUser).patch(userCtrl.editUser).delete(userCtrl.deleteUser)
router.post('/add', userCtrl.addUser)


module.exports = router