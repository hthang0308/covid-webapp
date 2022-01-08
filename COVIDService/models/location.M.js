const factory = require('../utils/handlerFactory');
const TableName = 'Locations';

module.exports = {
    getAllLocations: async () => factory.getAll(TableName),
    getLocationById: async (_f_ID) => factory.getOne(TableName, 'f_ID', _f_ID),
    searchLocationById: async (_f_ID) => factory.search(TableName, 'f_ID', _f_ID),
    addLocation: async (_addr) => factory.createOne(TableName, _addr),
    editLocation: async (_addr, _f_ID) => factory.updateOne(TableName, 'f_ID', _f_ID, _addr),
    deleteLocation: async (_f_ID) => factory.deleteOne(TableName, 'f_ID', _f_ID)
}