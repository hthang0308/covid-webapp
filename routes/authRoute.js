const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
// GET /account/login
router.get('/login', authController.login)

// GET /account/signup
router.get('/signup', authController.signup)

// GET /account/forgotpassword
router.get('/forgotpassword', authController.forgotpassword)


// POST /account/login
router.post('/login', authController.postLogin)

// POST /account/signup
router.post('/signup', authController.postSignup)

// POST /account/forgotpassword
router.post('/forgotpassword', authController.postForgotPassword)

module.exports = router;