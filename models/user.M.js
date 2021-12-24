const db = require("./db");
const tbName = "Users";
module.exports = {
  all: async () => {
    const res = await db.load(tbName);
    return res;
  },
  getByName: async (_f_Name) => {
    const res = await db.get(tbName, "f_Name", _f_Name);
    if (!res) return null;
    return res;
  },
  getById: async (_f_ID) => {
    const res = await db.get(tbName, "f_ID", _f_ID);
    if (!res) return null;
    return res[0];
  },
  searchByID: async (_f_ID) => {
    const res = await db.search(tbName, "f_ID", _f_ID);
    if (!res) return null;
    return res;
  },
  create: async (_user) => {
    const res = await db.create(tbName, _user);
    return res;
  },
  //update khong co id
  update: async (_f_ID, _user) => {
    await db.update(tbName, "f_ID", _f_ID, _user);
  },
  delete: async (_f_ID) => {
    const res = await db.delete(tbName, "f_ID", _f_ID);
    return res;
  },
};
