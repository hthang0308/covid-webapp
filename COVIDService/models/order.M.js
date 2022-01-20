const factory = require("../utils/handlerFactory");
const TableName = "Orders";

module.exports = {
    getAllOrders: async () => factory.getAll(TableName),
    getOrderByAccountID: async (account_ID) => factory.getOne(TableName, "f_UserID", account_ID)
}