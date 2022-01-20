const packModel = require("../models/package.M");
const productModel = require("../models/product.M");
const sort = require("../utils/sort");

//Routes
exports.getAllPackages = async (req, res) => {
  arr = await packModel.getAllPackages();
  if (req.query.search) arr = await packModel.searchPackageByName(req.query.search);
  if (req.query.sort === "name") sort.sortByName(arr);
  if (req.query.sort === "time") sort.sortByTime(arr);

  res.render("packages/all", {
    packages: arr,
    layout: "manager",
    title: "Danh sách gói nhu yếu phẩm",
  });
};

exports.searchPackages = async (req, res) => {
  console.log(123);
  tmpPack = await packModel.searchPackageByName(req.params.search);
  res.render("packages/search", {
    package: tmpPack,
  });
};

exports.getPackage = async (req, res) => {
  // Step 1: Find the correct package
  tmpPack = await packModel.getPackageById(req.params.id);
  // console.log(tmpPack);
  if (tmpPack === undefined) return;

  // Step 2: Render each product inside the package
  // for (const product of tmpPack.f_Products) {
  // productInfo = await productModel.getProductById(product.f_id);
  // if (productInfo === undefined) return;
  // console.log(productInfo);
  // }

  // Step 3: Render the package
  res.render("packages/single", {
    package: tmpPack,
    // products: productInfo,
    layout: "manager",
    title: "Thông tin gói",
  });
};

exports.createPackage = async (req, res) => {
  if (req.method === "POST") {
    const _package = { ...req.body };
    _package.products = _package.products
      .split(",")
      .filter((product) => product !== "")
      .map((product) => {
        return {
          necessary_id: product.split("-")[0],
          max_per_package: product.split("-")[1],
        };
      });

    await packModel.addPackage(_package);
    res.redirect("packages/package-success", {
      messages: "Thêm gói nhu yếu phẩm thành công",
    });
  }
  res.render("packages/add", {
    title: "Thêm gói nhu yếu phẩm",
    layouts: "manager",
  });
};

exports.editPackage = async (req, res) => {
  tmpPack = await packModel.getPackageById(req.params.id);
  if (req.method === "PATCH") {
    const _package = { ...req.body };
    _package.products = _package.products
      .split(",")
      .filter((product) => product !== "")
      .map((product) => {
        return {
          necessary_id: product.split("-")[0],
          max_per_package: product.split("-")[1],
        };
      });

    await packModel.editPackage(req.params.id, _package);
    res.redirect("packages/package-success", {
      messages: "Chỉnh sửa gói nhu yếu phẩm thành công",
    });
  }
  res.render("packages/edit", {
    package: tmpPack,
    title: "Chỉnh sửa gói nhu yếu phẩm",
    layouts: "manager",
  });
};

exports.deletePackage = async (req, res) => {
  if (req.method == "DELETE") {
    await packModel.deletePackage(req.params.id);
    res.redirect("packages/package-success", {
      messages: "Xóa gói nhu yếu phẩm thành công",
    });
  }
};
