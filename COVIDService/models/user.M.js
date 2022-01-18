const factory = require("../utils/handlerFactory");
const axios = require("axios");
const { API_URL } = require("../utils/constant");
// const { getName } = require("../middlewares/getTransaction");

const TableName = "Users";

module.exports = {
  // Factories
  getAllUsers: async () => factory.getAll(TableName),
  getUserByName: async (_f_Name) => factory.getOne(TableName, "f_Username", _f_Name),
  getUserByID: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
  searchUserByID: async (_f_ID) => factory.search(TableName, "f_ID", _f_ID),
  addUser: async (_user) => factory.createOne(TableName, _user),
  editUser: async (_f_ID, _user) => factory.updateOne(TableName, "f_ID", _f_ID, _user),
  deleteUser: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),

  // Self-defined
  blockManager: async (_f_ID, _manager) => {
    let tmpManager = await factory.getOne(TableName, "f_ID", _f_ID);
    if (tmpManager === undefined) return;
    factory.updateOne(TableName, "f_ID", _f_ID, _manager);
  },

  getPayment: async (_f_ID, token) => {
    let { data } = await axios({
      method: "GET",
      url: `${API_URL}/api/transactions/history/${_f_ID}`,
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
      .then((res) => res.data)
      .catch((err) => console.log(err));

    data = data.map((item) => ({
      ...item,
      action: getName(item.action),
      date: moment,
    }));
    return { data };
  },

  getBalance: async (_f_ID, token) => {
    let { data } = await axios({
      method: "GET",
      url: `${API_URL}/${_f_ID}/balance`,
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
      .then((res) => res.data)
      .catch((err) => console.log(err));
    return { data };
  },
};
