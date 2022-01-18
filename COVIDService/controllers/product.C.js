const productModel = require("../models/product.M");
const packageModel = require("../models/package.M");
const sort = require("../utils/sort");
const { uploadFiles } = require("../middlewares/firebase");

// Route
exports.getAllProducts = async (req, res) => {
  arr = await productModel.getAllProducts();
  if (req.query.sort === "name") sort.sortByName(arr);
  if (req.query.sort === "id") sort.sortByID(arr);
  if (req.query.sort === "price") sort.sortByPrice(arr);
  res.render("products/all", {
    products: arr,
  });
};

exports.searchProduct = async (req, res) => {
  tmpProd = await productModel.searchProductByName(req.params.name);
  res.render("products/all", {
    products: tmpProd,
  });
};

exports.getProduct = async (req, res) => {
  tmpProd = await productModel.getProductById(req.params.id);
  res.render("products/single", {
    tmpProd,
  });
};

exports.createProduct = async (req, res) => {
  if (req.method === "POST") {
    const files = await uploadFiles(req.files);
    const product = { ...req.body, images: files };
    await productModel.createProduct(product);
    res.redirect("products/product_success", {
      messages: "Thêm sản phẩm vào cơ sở dữ liệu thành công"
    });
  }
  res.render("products/add");
};

exports.editProduct = async (req, res) => {
  tmpProd = await productModel.getProductById(req.params.id);
  if (req.method === "PATCH") {
    const files = await uploadFiles(req.files);
    const product = { ...req.body, images: files };
    await productModel.editProduct(req.params.id, product);
    res.redirect("products/product_success", {
      messages: "Chỉnh sửa sản phẩm thành công"
    });
  }
  res.render("products/edit", {
    product: tmpProd,
  });
};
exports.deleteProduct = async (req, res) => {
  tmpProd = await productModel.getProductById(req.params.id);
  if (tmpProd === undefined) return;
  pack = await packageModel.getAllPackages();
  for (const eachPack of pack) {
    for (const product of eachPack.f_List) {
      if (tmpProd === product) return;
    }
  }
  await productModel.deleteProduct(req.params.id);
  res.redirect("products/product_success", {
    messages: "Xóa sản phẩm thành công"
  });
};
