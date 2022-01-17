const express = require("express");
const signinController = require('../controllers/signin.C');
const signupController = require('../controllers/signup.C');
const homeController = require('../controllers/home.C');

const router = express.Router();

router.route('/signin').get(signinController.getSignIn).post(signinController.postSignIn);
router.get('/signup', signupController.postSignUp);
router.post('/balance', homeController.getBalance);
router.route('/firstSignIn').get(signinController.getFirstSignIn).post(signinController.postFirstSignIn);
//router.get('/signup', signupController.getSignUp);
router.get('/', homeController.getHome);

module.exports = router;