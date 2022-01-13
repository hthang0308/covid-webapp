const factory = require("../utils/handlerFactory");
const axios = require('axios');
const { API_URL } = require("../utils/constant");
const { getName } = require("../middlewares/getTransaction");

const TableName = "Users";

module.exports = {
  // Factories
  getAllUsers: async () => factory.getAll(TableName),
  getUserByName: async (_f_Name) => factory.getOne(TableName, "f_Name", _f_Name),
  getUserByID: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
  searchUserByID: async (_f_ID) => factory.search(TableName, "f_ID", _f_ID),
  addUser: async (_user) => factory.createOne(TableName, _user),
  editUser: async (_f_ID, _user) => factory.updateOne(TableName, "f_ID", _f_ID, _user),
  deleteUser: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),

  // Self-defined
  getPayment: async (_f_ID, token) => {
    let { data } = await axios({
      method: 'GET',
      url: `${API_URL}/api/transactions/history/${_f_ID}`,
      headers: {
        Authorization: `Bearer ${token}`
      }
    }).then(res => res.data)
      .catch(err => console.log(err));

    data = data.map(item => ({
      ...item,
      action: getName(item.action),
      date: moment
    }))
    return { data };
  },

  getBalance: async (_f_ID, token) => {
    let { data } = await axios({
      method: 'GET',
      url: `${API_URL}/api/accounts/${_f_ID}/get-balance`,
      headers: {
        Authorization: `Bearer ${token}`
      }
    }).then(res => res.data)
      .catch(err => console.log(err))
    return { data };
  },

  checkVerification: async (_f_ID) => {
    let res = await axios({
      method: 'POST',
      url: `${API_URL}/auth/verify`,
      data: { _f_ID }
    }).then(res => res.data)
      .catch(err => console.log(err));

    return { data: res.verified };
  },

  deposit: async (send_id, amount, token) => {
    let data = await axios({
      method: 'POST',
      url: `${API_URL}/api/transactions/deposit`,
      headers: {
        Authorization: `Bearer ${token}`
      },
      data: { send_id, amount }
    }).then(res => res.data)
      .catch(err => console.log(err));

    return { data };
  }
};
