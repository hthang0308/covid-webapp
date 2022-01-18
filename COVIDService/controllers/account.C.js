const accountModel = require("../models/account.M");
const bcrypt = require("bcrypt");
const saltRounds = 10;
// Route
exports.getAllAccounts = async (req, res) => {
  arr = await accountModel.getAllAccounts();
  res.render("accounts/all", {
    accounts: arr,
  });
};
exports.createAccount = async (req, res) => {
  let tmp = await accountModel.getAccountByUsername(req.body.username);
  if (tmp !== null && tmp !== undefined) {
    return res.render("accounts/form_add", { msg: "Username already exist!", color: "danger" });
  }
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  const f_Password = await bcrypt.hash(req.body.password, saltRounds);
  const tmpUser = {
    f_Username: req.body.username,
    f_Password,
    f_History: [`${currentTime} Create User`],
    f_Permission: 2,
  };
  accountModel.addAccount(tmpUser);
  return res.render("accounts/form_add", { msg: "Create account successfully!", color: "success" });
  //done
};
exports.getCreateForm = async (req, res) => {
  res.render("accounts/form_add");
};
exports.lockAccount = async (req, res) => {
  const tmpAccount = await accountModel.getAccountByID(req.params.id);
  if (tmpAccount.f_Permission != null) tmpAccount.f_Permission *= -1;
  var tmpID = tmpAccount.f_ID;
  delete tmpAccount.f_ID;
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  if (tmpAccount.f_Permission < 0) tmpAccount.f_History.push(`${currentTime} Lock User`);
  else tmpAccount.f_History.push(`${currentTime} Unlock User`);
  accountModel.editAccount(tmpID, tmpAccount);
};
exports.getAccount = async (req, res) => {
  tmpAccount = await accountModel.getAccountByID(req.params.id);
  let msg = "";
  if (tmpAccount != null && tmpAccount.f_Permission < 0) msg = "This account is disabled!";
  res.render("accounts/single", {
    account: tmpAccount,
    msg,
  });
};
// exports.getChangeCovidAddressForm = async (req, res) => {
//   tmpUser = await userModel.getUserByID(req.params.id);
//   res.render("users/form_change_covid_address", {
//     user: tmpUser,
//   });
// };
// exports.editUser = async (req, res) => {
//   //Get this ID and Update
//   const tmpUser = await userModel.getUserByID(req.params.id);
//   if (tmpUser === undefined) return;
//   var currentdate = new Date();
//   var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
//   //If in form has covid address
//   if (req.body.f_CovidAddress !== undefined) {
//     tmpUser.f_CovidAddress = req.body.f_CovidAddress;
//     tmpUser.f_History.push(currentTime + `Change Covid Address To: ${tmpUser.f_CovidAddress}`);
//     userModel.editUser(tmpUser.f_ID, tmpUser);
//   }
//   //Update Fx
//   else if (tmpUser.f_Fx > 0) {
//     //Get Related ID and Update
//     if (tmpUser.f_RelatedID !== null)
//       for (const anotherID of tmpUser.f_RelatedID) {
//         tmpUser2 = await userModel.getUserByID(anotherID);
//         if (tmpUser2.f_Fx > 0) {
//           tmpUser2.f_Fx--;
//           tmpUser2.f_History.push(currentTime + `From F${tmpUser2.f_Fx + 1} To F${tmpUser2.f_Fx}`);
//           userModel.editUser(tmpUser2.f_ID, tmpUser2);
//         }
//       }
//     //Update this ID
//     tmpUser.f_Fx--;
//     tmpUser.f_History.push(currentTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
//     userModel.editUser(tmpUser.f_ID, tmpUser);
//   }
// };
