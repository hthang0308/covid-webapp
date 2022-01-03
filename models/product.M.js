const factory = require('../utils/handlerFactory');
const TableName = "Products";

exports.getAllProducts = async () => {
    return await factory.getAll(TableName);
}

exports.getProductByName = async (_f_Name) => {
    return await factory.getOne(TableName, 'f_Name', _f_Name);
}

exports.getProductById = async (_f_ID) => {
    return await factory.getOne(TableName, "f_ID", _f_ID);
}
exports.searchProductByName = async (_f_Name) => {
    return await factory.search(TableName, 'f_Name', _f_Name);
}

exports.addProduct = async (_product) => {
    return await factory.createOne(TableName, _product);
}

exports.editProduct = async (_f_ID, _product) => {
    return await factory.updateOne(TableName, 'f_ID', _f_ID, _product);
}

exports.deleteProduct = async (_f_ID) => {
    return await factory.deleteOne(TableName, 'f_ID', _f_ID);
}