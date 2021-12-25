const express = require('express');
const userCtrl = require('../controllers/userCtrl');

const router = express.Router()

router.get('/', userCtrl.sortUser);
router.get('/search/:id', userCtrl.searchUser);
router.route('/create').get(userCtrl.getCreateForm).post(userCtrl.postCreateForm);
router.route('/:id/edit').get(userCtrl.getEditForm).post(userCtrl.postEditForm);


module.exports = router