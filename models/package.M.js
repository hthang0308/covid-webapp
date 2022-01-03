const factory = require('../utils/handlerFactory');
const TableName = "Packages";

module.exports = {
    getAllPackages: async () => factory.getAll(TableName),
    getPackageByName: async (_f_name) => factory.getOne(TableName, 'f_Name', _f_name),
    getPackageById: async (_f_ID) => factory.getOne(TableName, 'f_ID', _f_ID),
    searchPackageByName: async (_f_name) => factory.search(TableName, 'f_Name', _f_name),
    addPackage: async (_pack) => factory.createOne(TableName, _pack),
    editPackage: async (_f_ID, _pack) => factory.updateOne(TableName, 'f_ID', _f_ID, _pack),
    deletePackage: async (_f_ID) => factory.deleteOne(TableName, 'f_ID', _f_ID)
}