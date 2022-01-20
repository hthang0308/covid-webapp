const factory = require('../utils/handlerFactory');
const TableName = "Products";

module.exports = {
    getAllProducts: async () => factory.getAll(TableName),
    getProductByName: async (_f_Name) => factory.getOne(TableName, 'f_Name', _f_Name),
    getProductById: async (_f_ID) => factory.getOne(TableName, "f_ID", _f_ID),
    searchProductByName: async (_f_Name) => factory.search(TableName, 'f_Name', _f_Name),
    createProduct: async (_product) => factory.createOne(TableName, _product),
    editProduct: async (_f_ID, _product) => factory.updateOne(TableName, 'f_ID', _f_ID, _product),
    deleteProduct: async (_f_ID) => factory.deleteOne(TableName, 'f_ID', _f_ID)
}