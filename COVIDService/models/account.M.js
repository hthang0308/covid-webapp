const factory = require("../utils/handlerFactory");

const TableName = "Users";
const QuarantineLocationTableName = "QuarantineLocations";

module.exports = {
  getAllAccounts: async () => factory.getAll(TableName),
  getAccountByUsername: async (f_Username) => factory.getOne(TableName, "f_Username", f_Username),
  getAccountByID: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
  addAccount: async (_account) => factory.createOne(TableName, _account),
  addQuanrantineLocation: async (_quarantineLocation) => factory.createOne(QuarantineLocationTableName, _quarantineLocation),
  editAccount: async (_f_ID, _account) => factory.updateOne(TableName, "f_ID", _f_ID, _account),
  deleteAccount: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),
};
