const express = require("express");
const signinController = require('../controllers/signin.C');
const signupController = require('../controllers/signup.C');
const signoutController = require('../controllers/signout.C');
const homeController = require('../controllers/home.C');
const manageController = require('../controllers/manage.C');

const router = express.Router();
router.post('/signinPass',signinController.postSignInWithId);
router.route('/signin').get(signinController.getSignIn).post(signinController.postSignIn);
router.get('/signup', signupController.postSignUp);
router.get('/signout', signoutController);
router.route('/firstSignIn').get(signinController.getFirstSignIn).post(signinController.postFirstSignIn);

router.route('/changePass').get(manageController.getChangePass).post(manageController.handleChangePass);
router.post('/balance', manageController.getBalance);

router.post('/addBalance', manageController.addBalance);
router.post('/transfer', manageController.transfer);
router.post('/addAccount',signupController.addAccount);
//router.get('/signup', signupController.getSignUp);
router.get('/', homeController.getHome);

module.exports = router;