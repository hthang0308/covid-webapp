const factory = require("../utils/handlerFactory");
const TableName = "Orders";

module.exports = {
  getAllOrders: async () => factory.getAll(TableName),
  searchOrderByAccountID: async (account_ID) => factory.search(TableName, "f_UserID", account_ID),
  getPackageNameByID: async (account_ID) => factory.getOne("Packages", "f_ID", account_ID),
};
