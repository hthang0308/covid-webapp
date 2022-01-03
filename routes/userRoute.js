const express = require("express");
const userCtrl = require("../controllers/user.C");

const router = express.Router();

router.route("/").get(userCtrl.getAllUsers).post(userCtrl.createUser);
router.get("/search", userCtrl.searchUser); //user/search?id=2333
router.get("/create", userCtrl.getCreateForm);
router.get("/:id/change_covid_address", userCtrl.getChangeCovidAddressForm);
router.route("/:id").get(userCtrl.getUser).put(userCtrl.editUser);

module.exports = router;
