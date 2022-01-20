const productModel = require("../models/product.M");
const packageModel = require("../models/package.M");
const sort = require("../utils/sort");
const { uploadFiles } = require("../middlewares/firebase");

// Route
exports.getAllProducts = async (req, res) => {
  products = await productModel.getAllProducts();
  if (req.query.sort === "name") sort.sortByName(products);
  if (req.query.sort === "id") sort.sortByID(products);
  if (req.query.sort === "price") sort.sortByPrice(products);
  var images=[]
  products.forEach((element) => {
    images.push(element.f_Images ? element.f_Images[0] : '/img/products/no_image.png')
  });
  res.render("products/all", {
    products: products,
    images: images,
    title: "Nhu yếu phẩm",
    layout: "manager",
  });
};

exports.searchProduct = async (req, res) => {
  var products = await productModel.searchProductByName(req.params.name);

  res.render("products/all", {
    products: products,
    title: "Tìm kiếm nhu yếu phẩm",
    layout: "manager",
  });
};

exports.getProduct = async (req, res) => {
  const product = await productModel.getProductById(req.params.id);
  res.render("products/single", {
    product: product,
    title: "Thông tin nhu yếu phẩm",
    layout: "manager",
  });
};

exports.createProduct = async (req, res) => {
  if (req.method === "POST") {
    if(!Array.isArray(product.f_Images)) {
      product.f_Images = [product.f_Images]
    }
    const product = { ...req.body};
    await productModel.createProduct(product);
    res.redirect("/product");
    return;
  }
  
  res.render("products/add", {
    title: "Thêm nhu yếu phẩm",
    layout: "manager",
  });
};

exports.editProduct = async (req, res) => {
    const product = { ...req.body };
    if(!Array.isArray(product.f_Images)) {
      product.f_Images = [product.f_Images]
    }
    await productModel.editProduct(req.params.id, product);
    console.log(product);
    res.redirect(`/product/${req.params.id}`);
    return;
};

exports.deleteProduct = async (req, res) => {
  var tmpProd = await productModel.getProductById(req.params.id);
  if (tmpProd === undefined) return;
  var pack = await packageModel.getAllPackages();
  console.log(pack);
  for (const eachPack of pack) {
    for (const product of eachPack.f_Products) {
      if (tmpProd === product) return;
    }
  }
  await productModel.deleteProduct(req.params.id);
  // res.redirect("products/all", {
  //   messages: "Xóa sản phẩm thành công",
  // });

  res.send('"Xóa sản phẩm thành công"')
};
