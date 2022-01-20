const express = require("express");
const qlCtrl = require("../controllers/ql.C");
const authCtrl = require("../controllers/auth.C");
const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. Manager creates User.

router.use(authCtrl.restrictTo(0));

router.route("/").get(qlCtrl.getAllQL).post(qlCtrl.createQL);

router.get("/create", qlCtrl.getCreateForm);
router.get("/:id/edit", qlCtrl.getEditForm);
router.route("/:id").get(qlCtrl.getQL).put(qlCtrl.editQL).delete(qlCtrl.deleteQL);

module.exports = router;
