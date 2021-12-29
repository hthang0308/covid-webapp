const factory = require('../middlewares/handlerFactory');

const TableName = "Packages";
const packID = _f_ID, packName = _f_Name, pack = _package;

exports.getAllPackages = factory.getAll(TableName);
exports.getPackageById(packID) = factory.getOne(TableName, 'f_ID', packID);
exports.getPackageByName(packName) = factory.getOne(TableName, 'f_Name', packName);
exports.searchPackageByName(packName) = factory.search(TableName, 'f_Name', packName);
exports.addPackage(pack) = factory.createOne(TableName, pack);
exports.editPackage(packID, pack) = factory.updateOne(TableName, 'f_ID', packID, pack);
exports.deletePackage(packID) = factory.deleteOne(TableName, 'f_ID', packID);