const db = require("../utils/db");
const userModel = require("../models/user.M");

exports.statistic = async (req, res) => {
  let tableName = "Users";
  let fieldName = "f_Fx";
  // Ngày thống kê sẽ lấy từ req
  let value = "3/1/2022";
  if (req.body) {
    value = req.body.filter_by
  }
  const data = await db.newStatistic(tableName, fieldName, value);
  console.log("data: ", data);
  const chart_data = [];
  data.forEach(element => {
    chart_data.push(parseInt(element.soluong));
  })

  console.log("Chart data: ",chart_data);

  res.render("statistics/people", {
    title: "Thống kê người liên quan Covid 19",
    layout: "manager",
    status: data,
    data: chart_data,
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
