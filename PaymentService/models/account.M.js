const db = require('./db');
const tbName = "Accounts";
const idFieldName = "AccID";
module.exports = {
    all: async () => {
        const res = await db.load(tbName);
        return res;
    },

    get: async accId => {
        const res = await db.get(tbName, idFieldName, accId);
        return res;
    },

    add: async account => {
        const res = await db.add(tbName, account);
        return res;
    },

    update: async (acc, colName) => {
        var value = acc.AccID;
        const res = await db.update(tbName, acc, idFieldName, value, colName);
        return res;
    }
}