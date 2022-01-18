const express = require("express");
const productCtrl = require("../controllers/product.C");
const authCtrl = require("../controllers/auth.C");
const upload = require("../middlewares/multer");

const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// Manager access
router.use(authCtrl.restrictTo(2));
router.get("/", productCtrl.getAllProducts);
router.route("/:id").get(productCtrl.getProduct).patch(upload.array("images", 5), productCtrl.editProduct).delete(productCtrl.deleteProduct);
router.route("/add").get(productCtrl.createProduct).post(upload.array("images", 5), productCtrl.createProduct);

module.exports = router;
