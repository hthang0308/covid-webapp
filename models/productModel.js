const db = require('../utils/db');
const TableName = "Products"

exports.getAllProducts = async () => {
    const res = await db.load(TableName);
    return res;
}

exports.getProductByName = async (_f_Name) => {
    const res = await db.get(TableName, "f_Name", _f_Name);
    if (!res) return null; return res;
}

exports.getProductById = async (_f_ID) => {
    const res = await db.get(TableName, "f_ID", _f_ID);
    if (!res) return null; return res;
}

exports.searchProductByName = async (_f_Name) => {
    const res = await db.search(TableName, "f_Name", _f_Name);
    if (!res) return null;
    return res;
}

exports.addProduct = async (_product) => {
    const res = await db.create(TableName, _product);
    return res;
}

exports.editProduct = async (_f_ID, _product) => {
    await db.update(TableName, "f_ID", _f_ID, _product);
}

exports.deleteProduct = async (_f_ID) => {
    const res = await db.delete(TableName, "f_ID", _f_ID);
    return res;
}