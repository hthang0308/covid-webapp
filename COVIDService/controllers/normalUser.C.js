const userModel = require("../models/user.M");
const orderModel = require("../models/order.M");
const jwt = require("jsonwebtoken");

// GetHomePage for Users
exports.getHome = async (req, res) => {
  tmpUser = await userModel.getUserByID(req.user.f_ID);
  if (!tmpUser) {
    return res.redirect("/");
  }
  const ward = await userModel.getWardByID(tmpUser.f_Ward);
  console.log("ward", ward);
  if (!ward) {
    return res.redirect("/");
  }
  const district = await userModel.getDistrictByID(ward.f_District);
  console.log("district", district);
  if (!district) {
    return res.redirect("/");
  }
  const city = await userModel.getCityByID(district.f_City);
  console.log("city", city);
  if (!city) {
    return res.redirect("/");
  }
  const fulladdress = ward.f_Name + ", " + district.f_Name + ", " + city.f_Name;
  const qlocation = await userModel.getQLByID(tmpUser.f_QuarantineID);
  tmpUser.f_DOB = tmpUser.f_DOB.toISOString().split("T")[0];
  res.render("normaluser/single", {
    user: tmpUser,
    title: "Thông tin tài khoản",
    address: fulladdress,
    qlocation: qlocation.f_Address,
  });
  //   if (user === undefined) return;
  //   res.render("normaluser/single", {
  //     user: user,
  //     title: "Thông tin tài khoản",
  //   });
};

exports.getHistory = async (req, res) => {
  user = await userModel.getUserByID(req.user.f_ID);
  var result = await user.f_History.filter((item) => item.includes("Manager"));
  console.log(result);
  var histories = [];
  try {
    result.forEach((result) => {
      let stringleft = result.replace(result.split(" ")[0], "").replace(result.split(" ")[1], "").trim();
      histories.push({
        date: result.split(" ")[0],
        time: result.split(" ")[1],
        action: stringleft,
      });
    });
  } catch (err) {
    console.log(err);
  }
  res.render("normaluser/history", {
    histories,
    title: "Lịch sử quản lý người dùng",
  });
};

exports.getOrder = async (req, res) => {
  // user = await userModel.getUserByID(req.user.f_ID);
  var result = await orderModel.searchOrderByAccountID(req.user.f_ID);
  for (const element of result) {
    element.f_Buyer = req.user.f_Fullname;
    const tmpPackage = await orderModel.getPackageNameByID(element.f_PackageID);
    element.f_PackageName = tmpPackage.f_Name;
  }
  res.render("normaluser/order", {
    histories: result,
    title: "Lịch sử tiêu thụ nhu yếu phẩm",
  });
};

exports.getBalance = async (req, res) => {
  try {
    const id = req.user.f_ID;
    const token = jwt.sign({ id: id }, process.env.JWT_SECRET);
    let data = {};
    if (token) {
      data = await userModel.getPayment(id, token);
    }
    res.render("normaluser/balance", {
      title: "Số dư hiện tại",
      data: data.Balance,
    });
  } catch (error) {
    res.render("normaluser/balance", {
      title: "Số dư hiện tại",
      data: 0,
    });
  }
};

exports.deposit = async (req, res) => {
  //Step 1: Check user
  const id = req.user.f_ID;

  //Step 2: Pass id to payment
  const token = jwt.sign({ id: id }, process.env.JWT_SECRET);
  if (token) {
    return res.redirect(`${API_URL}/`);
  }
};
