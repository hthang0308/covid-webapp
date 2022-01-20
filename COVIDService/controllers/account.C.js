const accountModel = require("../models/account.M");
const bcrypt = require("bcryptjs");
const saltRounds = 10;
// Route
exports.getAllAccounts = async (req, res) => {
  arr = await accountModel.getAllAccounts();
  arr = arr.filter((item) => item.f_Permission === 2);
  res.render("accounts/all", {
    accounts: arr,
    length: arr.length,
  });
};
exports.createAccount = async (req, res) => {
  let tmp = await accountModel.getAccountByUsername(req.body.username);
  if (tmp !== null && tmp !== undefined) {
    return res.render("accounts/form_add", { msg: "Username already exist!", color: "danger" });
  }
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${currentDate.getMonth() + 1
    }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
  const f_Password = await bcrypt.hashSync(req.body.password, saltRounds);
  const tmpUser = {
    f_Username: req.body.username,
    f_Password,
    f_History: [`${currentTime} Manager Create User`],
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
  var currentDate = new Date();
  var currentTime = `${currentDate.getDay()}/${currentDate.getMonth() + 1
    }/${currentDate.getFullYear()} ${currentDate.getHours()}:${currentDate.getMinutes()} `;
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
