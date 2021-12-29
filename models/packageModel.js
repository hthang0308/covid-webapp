const db = require('../utils/db');
const TableName = "Packages";

exports.getAllPackages = async () => {
    const res = await db.load(TableName);
    return res;
}

exports.getPackageById = async (f_ID) => {
    const res = await db.get(TableName, "f_ID", f_ID);
    if (!res) return null; return res;
}

exports.getPackageByName = async (_f_Name) => {
    const res = await db.get(TableName, "f_Name", _f_Name);
    if (!res) return null; return res;
}

exports.searchPackageByName = async (_f_Name) => {
    const res = await db.search(TableName, "f_Name", _f_Name);
    if (!res) return null; return res;
}

exports.addPackage = async (_package) => {
    const res = await db.create(TableName, _package);
    return res;
}

exports.editPackage = async (_f_ID, _package) => {
    await db.update(TableName, "f_ID", _f_ID, _package);
}

exports.deletePackage = async (_f_ID) => {
    const res = await db.delete(TableName, "f_ID", _f_ID);
    return res;
}