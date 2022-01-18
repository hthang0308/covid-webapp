const express = require("express");
const qlCtrl = require("../controllers/ql.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// Manager access
router.use(authCtrl.restrictTo(2));

router.route("/").get(qlCtrl.getAllQL);
//.post(qlCtrl.createQL);

router.get("/create", qlCtrl.getCreateForm);
//router.route("/:id").get(accountCtrl.getAccount).put(qlCtrl.editQL).delete(qlCtrl.deleteQL); //.put(userCtrl.editUser);

module.exports = router;
