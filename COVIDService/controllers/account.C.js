const accountModel = require("../models/account.M");

// Route
exports.getAllAccounts = async (req, res) => {
  arr = await accountModel.getAllAccounts();
  res.render("accounts/all", {
    accounts: arr,
  });
};
exports.createAccount = async (req, res) => {
  if (accountModel.getAccountByUsername(req.body.f_Username) != null) {
    return res.render("accounts/form_addaccount", { err: "Username already exist!" });
  }
  //validate
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  req.body.f_History = [];
  req.body.f_History.push(`${currentTime} Create User`);
  req.body.f_Permission = 1;
  accountModel.addAccount(req.body);
  res.redirect("/account");
  //done
};
exports.getCreateForm = async (req, res) => {
  res.render("accounts/form_addaccount");
};
exports.getCreateQuarantineLocationForm = async (req, res) => {
  res.render("accounts/form_addquarantinelocation");
};
exports.createQuarantineLocation = async (req, res) => {
  // if (accountModel.getAccountByUsername(req.body.f_Username) != null) {
  //   return res.render("accounts/form_addaccount", { err: "Username already exist!" });
  // }
  //validate
  accountModel.addQuanrantineLocation(req.body);
  res.redirect("/account");
  //done
};
exports.lockAccount = async (req, res) => {
  const tmpAccount = await accountModel.getAccountByID(req.params.id);
  tmpAccount.f_Permission *= -1;
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
  res.render("accounts/single", {
    account: tmpAccount,
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
