const express = require("express");
const accountCtrl = require("../controllers/account.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// Manager access
router.use(authCtrl.restrictTo(2));

router.route("/").get(accountCtrl.getAllAccounts).post(accountCtrl.createAccount); //username,password,role,Islocked=true,AccountHistory

//router.get("/search", userCtrl.searchUser); //user/search?id=2333
router.get("/create", accountCtrl.getCreateForm);
router.route("/create_quarantinelocation").get(accountCtrl.getCreateQuarantineLocationForm).post(accountCtrl.createQuarantineLocation);
router.route("/:id").get(accountCtrl.getAccount).post(accountCtrl.lockAccount); //.put(userCtrl.editUser);

module.exports = router;
