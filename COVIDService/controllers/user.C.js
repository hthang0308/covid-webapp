const userModel = require("../models/user.M");
const orderModel = require("../models/order.M");
const sort = require("../utils/sort");
const jwt = require('jsonwebtoken');
const { isNumber, isValidFx, isValidName } = require("../utils/validate");

// Route
// GetHomePage for Users
exports.getHome = async (req, res) => {
  user = await userModel.getUserByID(req.user.f_ID);
  console.log(user);
};

exports.getHistory = async (req, res) => {
  user = await userModel.getUserByID(req.user.f_ID);
  var result = await user.f_History.filter((item) => item.includes("Manage User"));
  console.log(result);
};

exports.getOrder = async (req, res) => {
  // user = await userModel.getUserByID(req.user.f_ID);
  var result = await orderModel.getOrderByAccountID(req.user.f_ID);
  console.log(result);
};

exports.getBalance = async (req, res) => {
  const id = req.params.id;
  console.log('ID: ',id);
  //const { data: user } = await userModel.getUserByID(id);
  const user = await userModel.getUserByID(id);
  console.log("User: ",user);
  // const { banking_token: token } = user;
  const token = jwt.sign({id: id}, process.env.JWT_SECRET);
  let data = {};
  // let userBankingDetail = {};

  if (token) {
    data = await userModel.getPayment(id, token);
    console.log("data:", data);
  }
  return res.json(data)
}

// For managers
exports.getAllUsers = async (req, res) => {
  arr = await userModel.getAllUsers();
  arr = arr.filter((user) => user.f_Fullname !== null);
  if (req.query.sort === "date") sort.sortByDate(arr);
  if (req.query.sort === "id") sort.sortByID(arr);
  if (req.query.sort === "name") sort.sortByFullName(arr);
  console.log(arr);
  res.render("users/all", {
    users: arr,
    title: "Danh sách người liên quan COVID-19",
    layout: "manager",
  });
};

exports.searchUser = async (req, res) => {
  tmpUser = await userModel.searchUserByNationalID(req.query.natid);
  if (tmpUser === undefined) return;
  res.render("users/all", {
    users: tmpUser,
    title: "Tìm kiếm người liên quan COVID-19",
    layout: "manager",
  });
};

exports.getCreateForm = async (req, res) => {
  if (req.query.city !== undefined) {
    var districts = await userModel.searchDistrictByCityID(req.query.city);
    districts = districts.filter((item) => item.f_City == req.query.city);
    sort.sortByName(districts);
    return res.json(districts);
  }
  if (req.query.district !== undefined) {
    var wards = await userModel.searchWardByDistrictID(req.query.district);
    //wards = wards.filter((item) => item.f_District == req.query.district);
    sort.sortByName(wards);
    return res.json(wards);
  }
  const cities = await userModel.getAllCities();
  const qls = await userModel.getAllQL();
  res.render("users/form_adduser", {
    layout: "tmp",
    cities,
    qls,
  });
};

exports.createUser = async (req, res) => {
  //validate
  var err = "";
  let source = null;
  if (req.body.sourcenatid !== "") {
    source = await userModel.getUserByNationalID(req.body.sourcenatid);
    console.log("source is ", source);
  }
  if (req.body.natid !== "") {
    const tmp = await userModel.getUserByNationalID(req.body.natid);
    if (tmp) {
      err = "National ID already exists!";
    }
  }
  if (!isValidFx(req.body.fx)) err = "Fx is not valid";
  if (!isNumber(req.body.natid)) err = "Id is not valid";
  if (!isValidName(req.body.fullname)) err = "Fullname is not valid";
  if (!req.body.ward) err = "No Address!";
  if (!req.body.ql) err = "No Quarantine Location!";
  const username = await userModel.getUserByUsername(req.body.username);
  if (username !== null && username !== undefined) err = "Username already exists";

  const cities = await userModel.getAllCities();
  const qls = await userModel.getAllQL();
  if (err !== "") return res.render("users/form_adduser", { layout: "manager", data: req.body, cities, qls, err });
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${
    currentDate.getMonth() + 1
  }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
  const newUser = {
    f_Username: req.body.username,
    f_Password: "",
    f_Permission: 1,
    f_Fullname: req.body.fullname,
    f_NatID: req.body.natid,
    f_DOB: req.body.birthday,
    f_Fx: req.body.fx,
    f_QuarantineID: req.body.ql,
    f_Ward: req.body.ward,
    f_History: [`${currentTime} Manager Create User`],
  };
  var quarantineLocation = await userModel.getQLByID(req.body.ql);
  if (quarantineLocation.f_CurrentCapacity >= quarantineLocation.f_Capacity) {
    err = "Quarantine Location Already Full!";
  } else {
    quarantineLocation.f_CurrentCapacity++;
    await userModel.editQL(quarantineLocation.f_ID, quarantineLocation);
  }
  const result = await userModel.addUser(newUser);
  if (!result) {
    err = "Can't add this user";
  }
  if (err !== "") return res.render("users/form_adduser", { layout: "manager", data: req.body, cities, qls, err });

  if (source) {
    console.log(source.f_RelatedID);
    if (source.f_RelatedID === null) source.f_RelatedID = [newUser.f_NatID * 1];
    else {
      source.f_RelatedID.push(newUser.f_ID);
    }
    await userModel.editUser(source.f_ID, source);
  }
  return res.render("users/form_adduser", { layout: "manager", cities, data: req.body, qls, err: "Successfully" });
  //done
};

exports.getUser = async (req, res) => {
  tmpUser = await userModel.getUserByID(req.params.id);
  console.log("user", tmpUser);
  if (tmpUser === null || tmpUser === undefined) {
    return res.redirect("/user/all");
  }
  const ward = await userModel.getWardByID(tmpUser.f_Ward);
  console.log("ward", ward);
  if (ward === null || ward === undefined) {
    return res.redirect("/user/all");
  }
  const district = await userModel.getDistrictByID(ward.f_District);
  console.log("district", district);
  if (district === null || district === undefined) {
    return res.redirect("/user/all");
  }
  const city = await userModel.getCityByID(district.f_City);
  console.log("city", city);
  if (city === null || city === undefined) {
    return res.redirect("/user/all");
  }
  const fulladdress = ward.f_Name + ", " + district.f_Name + ", " + city.f_Name;
  res.render("users/single", {
    user: tmpUser,
    address: fulladdress,
  });
};

exports.getChangeCovidAddressForm = async (req, res) => {
  const qls = await userModel.getAllQL();
  tmpUser = await userModel.getUserByID(req.params.id);
  const oldql = await userModel.getQLByID(tmpUser.f_QuarantineID);
  res.render("users/form_change_covid_address", {
    user: tmpUser,
    oldql,
    qls,
  });
};

exports.editUser = async (req, res) => {
  //Get this ID and Update
  const tmpUser = await userModel.getUserByID(req.params.id);
  if (tmpUser === undefined) return;
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${
    currentDate.getMonth() + 1
  }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `; //If in form has covid address
  if (req.body.ql !== undefined) {
    tmpUser.f_QuarantineID = req.body.ql;
    const tmpNewCovidAddress = await userModel.getQLByID(tmpUser.f_QuarantineID);
    if (tmpNewCovidAddress.f_CurrentCapacity >= tmpNewCovidAddress.f_Capacity) {
      return res.json({ Err: "Quarantine Location Already Full!" });
    } else {
      tmpNewCovidAddress.f_CurrentCapacity++;
      const oldCovidAddress = await userModel.getQLByID(req.body.oldql);
      oldCovidAddress.f_CurrentCapacity--;
      await userModel.editQL(req.body.oldql, oldCovidAddress);
      await userModel.editQL(tmpNewCovidAddress.f_ID, tmpNewCovidAddress);
    }
    tmpUser.f_History.push(currentTime + `Manager Change Covid Address To: ${tmpNewCovidAddress.f_Address}`);
    userModel.editUser(tmpUser.f_ID, tmpUser);
  }
  //Update Fx
  else if (tmpUser.f_Fx > 0) {
    //Get Related ID and Update
    if (tmpUser.f_RelatedID !== null)
      for (const anotherID of tmpUser.f_RelatedID) {
        tmpUser2 = await userModel.getUserByID(anotherID);
        if (tmpUser2.f_Fx > 0) {
          tmpUser2.f_Fx--;
          tmpUser2.f_History.push(currentTime + `Manager Change From F${tmpUser2.f_Fx + 1} To F${tmpUser2.f_Fx}`);
          userModel.editUser(tmpUser2.f_ID, tmpUser2);
        }
      }
    //Update this ID
    tmpUser.f_Fx--;
    tmpUser.f_History.push(currentTime + `Manager Change From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
    userModel.editUser(tmpUser.f_ID, tmpUser);
  }
};
