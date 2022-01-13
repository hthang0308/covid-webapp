const factory = require('../utils/handlerFactory');
const tbName = "Accounts";
const idFieldName = "AccID";
module.exports = {
    getAllAccounts: async () => factory.getAll(tbName),
    getAccountById: async (accID) => factory.getOne(tbName, idFieldName, accID),
    getAccountByUsername: async (username) => factory.getOne(tbName, 'username', username),
    addAccount: async (account) => factory.createOne(tbName, account),
    updateAccount: async (accID, acc) => factory.updateOne(tbName, idFieldName, accID, acc)
}