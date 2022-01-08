// const userModel = require('./user.M');
const factory = require('../utils/handlerFactory');
const TableName = 'Managers';

module.exports = {
    addManager: async (_manager) => factory.createOne(TableName, _manager)
}