const express = require("express");
const productCtrl = require("../controllers/product.C");
const authCtrl = require("../controllers/auth.C");
const upload = require("../middlewares/multer");

const router = express.Router();

// Login to access
router.use(authCtrl.protect);

// 0: Admin, 1:User, 2: Manager. Admin creates Manager. Manager creates User.

router.use(authCtrl.restrictTo(2));
router.get("/", productCtrl.getAllProducts);
router.get("/search", productCtrl.searchProduct);

const productModel = require("../models/product.M");

router.get("/edit/:id", async (req, res, next) => {
    const product = await productModel.getProductById(req.params.id);
    console.log(product);
    res.render("products/edit", {
      product: product,
      title: "Thông tin nhu yếu phẩm",
      layout: "manager",
    });
});

router.route("/add").get(productCtrl.createProduct).post(upload.array("images", 5), productCtrl.createProduct);
router.route("/:id").get(productCtrl.getProduct).patch(productCtrl.editProduct).delete(productCtrl.deleteProduct);

module.exports = router;
