const factory = require("../utils/handlerFactory");
const TableName = "Order";

module.exports = {
    getAllOrders: async () => factory.getAll(TableName),
    getOrderByAccountID: async (account_ID) => factory.getOne(TableName, "f_AccountID", account_ID)
}