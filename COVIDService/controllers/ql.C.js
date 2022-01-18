const qlModel = require("../models/ql.M");
// Route
exports.getAllQL = async (req, res) => {
  arr = await qlModel.getAllQL();
  res.render("ql/all", {
    qls: arr,
  });
};
exports.getCreateForm = async (req, res) => {
  res.render("ql/form_add");
};
exports.createQL = async (req, res) => {
  const quarantineLocation = {
    f_Address: req.body.address,
    f_Capacity: req.body.capacity,
    f_CurrentCapacity: req.body.currentCapacity,
  };
  accountModel.addQuanrantineLocation(quarantineLocation);
  res.redirect("/account");
  //done
};
