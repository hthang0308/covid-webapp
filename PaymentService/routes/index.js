const express = require("express");
const router = express.Router();

const signinController = require('../controllers/signin.C');
const homeController = require('../controllers/home.C');
router.get('/signin',signinController.getSignIn);
router.post('/signin',signinController.postSignIn);
router.get('/',homeController);
module.exports = router;