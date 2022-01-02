const factory = require('../utils/handlerFactory');
const TableName = "Packages";

exports.getAllPackages = async () => {
    return await factory.getAll(TableName);
}

exports.getPackagesByName = async (_f_Name) => {
    return await factory.getOne(TableName, 'f_Name', _f_Name);
}

exports.getPackagesById = async (_f_ID) => {
    return await factory.getOne(TableName, 'f_ID', _f_ID);
}

exports.searchPackagesByName = async (_f_Name) => {
    return await factory.search(TableName, 'f_Name', _f_Name);
}

exports.addPackage = async (_package) => {
    return await factory.createOne(TableName, _package);
}

exports.editPackage = async (_f_ID, _package) => {
    return await factory.updateOne(TableName, 'f_ID', _f_ID, _package);
}

exports.deletePackage = async (_f_ID) => {
    return await factory.deleteOne(TableName, 'f_ID', _f_ID);
}