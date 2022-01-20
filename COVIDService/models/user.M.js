const factory = require("../utils/handlerFactory");
const axios = require("axios");
const { API_URL } = require("../utils/constant");
// const { getName } = require("../middlewares/getTransaction");

const TableName = "Users";

module.exports = {
  // Factories
  getAllUsers: async () => factory.getAll(TableName),
  getUserByUsername: async (_f_Username) => factory.getOne(TableName, "f_Username", _f_Username),
  getUserByID: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
  searchUserByID: async (_f_ID) => factory.search(TableName, "f_ID", _f_ID),
  searchUserByNationalID: async (_f_ID) => factory.search(TableName, "f_NatID", _f_ID),
  addUser: async (_user) => factory.createOne(TableName, _user),
  editUser: async (_f_ID, _user) => factory.updateOne(TableName, "f_ID", _f_ID, _user),
  deleteUser: async (_f_ID) => factory.deleteOne(TableName, "f_ID", _f_ID),
  getAllCities: async () => factory.getAll("Cities"),
  searchDistrictByCityID: async (_f_ID) => factory.search("Districts", "f_City", _f_ID),
  searchWardByDistrictID: async (_f_ID) => factory.search("Wards", "f_District", _f_ID),
  getAllQL: async (_f_ID) => factory.getAll("QuarantineLocations"),
  getQLByID: async (_f_ID) => factory.getOne("QuarantineLocations", "f_ID", _f_ID),
  getWardByID: async (_f_ID) => factory.getOne("Wards", "f_ID", _f_ID),
  getDistrictByID: async (_f_ID) => factory.getOne("Districts", "f_ID", _f_ID),
  getCityByID: async (_f_ID) => factory.getOne("Cities", "f_ID", _f_ID),
  getUserByNationalID: async (_f_NatID) => factory.getOne(TableName, "f_NatID", _f_NatID),
  editQL: async (_f_ID, _user) => factory.updateOne("QuarantineLocations", "f_ID", _f_ID, _user),
  // Self-defined
  blockManager: async (_f_ID, _manager) => {
    let tmpManager = await factory.getOne(TableName, "f_ID", _f_ID);
    if (tmpManager === undefined) return;
    factory.updateOne(TableName, "f_ID", _f_ID, _manager);
  },

  getPayment: async (_f_ID, token) => {
    // let { data } = await axios({
    //   method: "POST",
    //   url: `${API_URL}/balance`,
    //   headers: {
    //     Authorization: `Bearer ${token}`,
    //   },
    //   data: {
    //     access_token: token,
    //     accid: _f_ID
    //   }
    // })
    //   await axios.get('https://incomplete-chain.badssl.com')
    // .then(function (response) {
    //   console.log(response);
    // })
    // .catch(function (error) {
    //   console.log(error);
    // });
    var response = await axios.post(`https://localhost:5000/balance`, {
      access_token: token,
      accid: _f_ID
    })
    return response.data;
    // .then((res) => {
    //   console.log("Res: ", res.data);
    //   if (res.data.Response === 'true') {
    //     console.log("true");
    //     return res.data;
    //   }
    // })
    // .catch((err) => {
    //   console.log("Error Balance: ", err)
    //   return err;
    // }
    //   );

    // data = data.map((item) => ({
    // ...item,
    // action: getName(item.action),
    // date: moment,
    // }));
  },

  deposit: async (_f_ID, token) => {

  },
};
