const factory = require('../utils/handlerFactory');
const tbName = "Transactions";
const idFieldName = "TraID";
module.exports = {
    getAllTransactions: async () => factory.getAll(tbName, idFieldName),
    getTransactionById: async (traID) => factory.getOne(tbName, idFieldName, traID),
    getTransactionByAccId: async(accID) => factory.getAllByFieldName(tbName, "AccID", accID, idFieldName),
    //getAccountByUsername: async (username) => factory.getOne(tbName, idFieldName, username),
    addTransaction: async (tra) => factory.createOne(tbName, tra),
    //updateTransaction: async (accID, acc) => factory.updateOne(tbName, idFieldName, accID, acc)
}