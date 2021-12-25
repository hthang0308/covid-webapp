const db = require('../utils/db');
const TableName = "Users";

exports.getAllUsers = async () => {
    const res = await db.load(TableName);
    return res;
}

exports.getUserByName = async (_f_Name) => {
    const res = await db.get(TableName, "f_Name", _f_Name);
    if (!res) return null;
    return res;
}

exports.getUserById = async (_f_ID) => {
    const res = await db.get(TableName, "f_ID", _f_Name);
    if (!res) return null;
    return res;
}

exports.searchById = async (_f_ID) => {
    const res = await db.search(TableName, "f_ID", _f_Name);
    if (!res) return null;
    return res;
}

exports.createUser = async (_user) => {
    const res = await db.create(TableName, _user);
    return res;
}

exports.updateUser = async (_f_ID, _user) => {
    await db.update(TableName, "f_ID", _f_ID, _user);
}

exports.deleteUser = async (_f_ID) => {
    const res = await db.delete(TableName, "f_ID", _f_ID);
    return res;
}