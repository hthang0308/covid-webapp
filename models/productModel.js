const factory = require('../middlewares/handlerFactory');

const TableName = "Products";
const prodName = _f_Name, prodId = _f_ID, product = _prod;

exports.getAllProducts = factory.getAll(TableName);
exports.getProductByName(prodName) = factory.getOne(TableName, 'f_Name', prodName);
exports.getProductById(prodId) = factory.getOne(TableName, "f_ID", prodId);
exports.searchProductByName(prodName) = factory.search(TableName, 'f_Name', prodName);
exports.addProduct(product) = factory.createOne(TableName, product);
exports.editProduct(product) = factory.updateOne(TableName, prodId, product);
exports.deleteProduct(prodId) = factory.deleteOne(TableName, 'f_ID', prodId);