const qlModel = require("../models/ql.M");
// Route
exports.getAllQL = async (req, res) => {
  console.log("all ql");
  console.log(req.query);
  if (req.query.id !== null && req.query.id !== undefined) {
    return res.redirect("/ql/" + req.query.id);
  }
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
  qlModel.addQL(quarantineLocation);
  res.redirect("/ql");
  //done
};
exports.getQL = async (req, res) => {
  tmpQL = await qlModel.getQLByID(req.params.id);
  if (tmpQL != null)
    return res.render("ql/single", {
      ql: tmpQL,
    });
  return res.redirect("/ql");
};
exports.getEditForm = async (req, res) => {
  tmpQL = await qlModel.getQLByID(req.params.id);
  if (tmpQL != null)
    return res.render("ql/form_edit", {
      ql: tmpQL,
    });
  return res.redirect("/ql");
};
exports.editQL = async (req, res) => {
  const quarantineLocation = {
    f_Address: req.body.address,
    f_Capacity: req.body.capacity,
    f_CurrentCapacity: req.body.currentCapacity,
  };
  qlModel.editQL(req.params.id, quarantineLocation);
  return res.redirect("/ql/" + req.params.id + "/edit");
};
exports.deleteQL = async (req, res) => {
  tmpQL = await qlModel.deleteQL(req.params.id);
  return res.redirect("/ql");
};
