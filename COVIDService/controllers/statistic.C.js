const db = require("../utils/db");
const userModel = require("../models/user.M");
exports.statistic = async (req, res) => {
  let tableName = "Users";
  let fieldName = "f_Fx";
  // Ngày thống kê sẽ lấy từ req
  let value = "2021-12-12";
  let staField = "ngaythem";

  //   foreach (item in datas)
  //   {
  //       if (f_Fx===0)
  //   }
  //   console.log(data);
  res.render("statistics/products", {
    layout: "manager",
    status: data,
  });
};

exports.simpleStatistic = async (req, res) => {
  let tableName = "Products";
  let fieldName = "ProName";
  let staField = "Sold";
  data = await db.simpleStatistic(tableName, fieldName, staField, "ProID");
  res.render("simpleSta", {
    status: data,
  });
};
