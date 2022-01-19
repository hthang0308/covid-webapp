const express = require("express");
const accountCtrl = require("../controllers/account.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. User signs up.
router.use(authCtrl.restrictTo(0));

router.route("/").get(accountCtrl.getAllAccounts).post(accountCtrl.createAccount); //username,password,role,Islocked=true,AccountHistory

router.get("/create", accountCtrl.getCreateForm);
router.route("/:id").get(accountCtrl.getAccount).post(accountCtrl.lockAccount); //.put(userCtrl.editUser);

module.exports = router;
