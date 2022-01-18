const factory = require("../utils/handlerFactory");

const TableName = "QuarantineLocations";

module.exports = {
  getAllQL: async () => factory.getAll(TableName),
  getQLByID: async (f_Username) => factory.getOne(TableName, "f_ID", f_ID),
  addQL: async (_ql) => factory.createOne(TableName, _ql),
  editQL: async (_f_ID, _ql) => factory.updateOne(TableName, "f_ID", _f_ID, _ql),
  deleteQL: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),
};
