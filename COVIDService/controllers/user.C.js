const userModel = require("../models/user.M");
const sort = require("../utils/sort");
const { isNumber, isValidFx, isValidName } = require("../utils/validate");

// Route
// GetHomePage for Users
exports.getHome = (req, res) => {
  res.render('users/dashboard', {
    title: 'Trang chủ',
  })
}


// For managers
exports.getAllUsers = async (req, res) => {
  arr = await userModel.getAllUsers();
  arr = arr.filter((user) => user.f_Fullname !== null);
  if (req.query.sort === "date") sort.sortByDate(arr);
  if (req.query.sort === "id") sort.sortByID(arr);
  if (req.query.sort === "name") sort.sortByName(arr);
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
  var currentDate = new Date();
  var currentTime = `${currentDate.getMonth() + 1}/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
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
  var currentDate = new Date();
  var currentTime = `${currentDate.getMonth() + 1}/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
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
