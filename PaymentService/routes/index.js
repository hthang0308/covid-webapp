const express = require("express");
const signinController = require('../controllers/signin.C');
const homeController = require('../controllers/home.C');

const router = express.Router();

router.get('/', homeController);
router.route('/signin').get(signinController.getSignIn).post(signinController.postSignIn);

module.exports = router;