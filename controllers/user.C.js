const userModel = require("../models/user.M");

//Utils Function
const sortByDate = (array) => {
  array.sort(function (a, b) {
    return new Date(b.f_Birthday) - new Date(a.f_Birthday);
  });
};
const sortByID = (array) => {
  array.sort(function (a, b) {
    return a.f_ID - b.f_ID;
  });
};
const sortByName = (array) => {
  array.sort(function (a, b) {
    return a.f_Name.localeCompare(b.f_Name);
  });
};
const isValidName = (name) => {
  if (!name) return false;
  let firstLetters = name.split(/\s/).reduce((response, word) => (response += word.slice(0, 1)), "");
  for (const letter of firstLetters) if (letter != letter.toUpperCase()) return false;
  return true;
};
const isValidFx = (x) => {
  return x >= 0 && x <= 3;
};
const isNumber = (str) => {
  return /^\d+$/.test(str);
};
// Route
exports.getAllUsers = async (req, res) => {
  arr = await userModel.getAllUsers();
  if (req.query.sort === "date") sortByDate(arr);
  if (req.query.sort === "id") sortByID(arr);
  if (req.query.sort === "name") sortByName(arr);
  res.render("users/all", {
    users: arr,
  });
};
exports.searchUser = async (req, res) => {
  tmpUser = await userModel.searchUserByID(req.query.id);
  res.render("users/all", {
    users: tmpUser,
  });
};
exports.getCreateForm = async (req, res) => {
  res.render("users/form_adduser");
};
exports.createUser = async (req, res) => {
  //validate
  var err = "";
  if (!isValidName(req.body.f_Name)) err = "Name is not valid";
  if (!isValidFx(req.body.f_Fx)) err = "Fx is not valid";
  if (!isNumber(req.body.f_ID)) err = "Id is not valid";
  if (err !== "") return res.render("users/form_adduser", { err });
  //set user history
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  req.body.f_History = [];
  req.body.f_History.push(`${currentTime} Create User`);
  userModel.addUser(req.body);
  res.redirect("/user");
  //done
};
exports.getUser = async (req, res) => {
  tmpUser = await userModel.getUserByID(req.params.id);
  res.render("users/single", {
    user: tmpUser,
  });
};
exports.getChangeCovidAddressForm = async (req, res) => {
  tmpUser = await userModel.getUserByID(req.params.id);
  res.render("users/form_change_covid_address", {
    user: tmpUser,
  });
};
exports.editUser = async (req, res) => {
  //Get this ID and Update
  const tmpUser = await userModel.getUserByID(req.params.id);
  if (tmpUser === undefined) return;
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  //If in form has covid address
  if (req.body.f_CovidAddress !== undefined) {
    tmpUser.f_CovidAddress = req.body.f_CovidAddress;
    tmpUser.f_History.push(currentTime + `Change Covid Address To: ${tmpUser.f_CovidAddress}`);
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
          tmpUser2.f_History.push(currentTime + `From F${tmpUser2.f_Fx + 1} To F${tmpUser2.f_Fx}`);
          userModel.editUser(tmpUser2.f_ID, tmpUser2);
        }
      }
    //Update this ID
    tmpUser.f_Fx--;
    tmpUser.f_History.push(currentTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
    userModel.editUser(tmpUser.f_ID, tmpUser);
  }
};