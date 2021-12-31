const factory = require("../utils/handlerFactory");

const TableName = "Users";

module.exports = {
  getAllUsers: async () => factory.getAll(TableName),
  getUserByName: async (_f_Name) => factory.getOne(TableName, "f_Name", _f_Name),
  getUserByID: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
  searchUserByID: async (prodName) => factory.search(TableName, "f_ID", prodName),
  addUser: async (_user) => factory.createOne(TableName, _user),
  editUser: async (_f_ID, _user) => factory.updateOne(TableName, "f_ID", _f_ID, _user),
  deleteUser: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),
};
