const db = require("../utils/db");
const userModel = require("../models/user.M");

exports.statistic = async (req, res) => {
  let tableName = "Users";
  let fieldName = "f_Fx";
  // Ngày thống kê sẽ lấy từ req
  let value = "1/2022";
  if (req.body && req.body.filter_by) {
    value = req.body.filter_by;
  }
  const data = await db.newStatistic(tableName, fieldName, value);
  console.log("data: ", data);
  const chart_data = [];
  data.forEach((element) => {
    chart_data.push(parseInt(element.soluong));
  });

  console.log("Chart data: ", chart_data);
  var layout = "manager";
  if (req.cookies.role === "0") {
    layout = "admin";
  } else if (req.cookies.role === "1") layout = "user";
  res.render("statistics/people", {
    title: "Thống kê người liên quan Covid 19",
    layout,
    status: data,
    data: chart_data,
  });
};

exports.simpleStatistic = async (req, res) => {
  let tableName = "Orders";
  let fieldName = "f_PackageID";
  // let staField = "Sold";
  let data = await db.simpleStatistic(tableName, fieldName, "f_Quantity");
  var chart_data = [];
  var label = [];
  data.forEach((element) => {
    chart_data.push(parseInt(element.sum));
    label.push(element.f_PackageID);
  });
  console.log("chart: ", chart_data);
  var layout = "manager";
  if (req.cookies.role === "0") {
    layout = "admin";
  } else if (req.cookies.role === "1") layout = "user";
  res.render("statistics/products", {
    layout,
    status: data,
    label: label,
    data: chart_data,
  });
};
