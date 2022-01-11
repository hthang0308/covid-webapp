const pgPromise = require('pg-promise');

const pgp = require('pg-promise')({
    capSQL: true
})

const schema = 'public';
const cn = {
    user: 'postgres',
    host: 'localhost',
    database: 'qltt',
    password: '123456',
    port: 5432,
}

const db = pgp(cn);

exports.load = async (tName, orderField) => {
    const table = new pgp.helpers.TableName({
        table: tName, schema: schema
    });
    const qStr = pgp.as.format('SELECT * FROM ${table} ORDER BY ${orderField~} ASC', { table, orderField });
    try {
        const res = await db.any(qStr, orderField);
        return res;
    } catch (error) {
        console.log('error db/load', error);
    }
}


exports.get = async (tbName, fieldName, value) => {
    const table = new pgp.helpers.TableName({
        table: tbName, schema: schema
    });
    const qStr = pgp.as.format(`SELECT * FROM $1 WHERE "${fieldName}"='${value}'`, table);
    try {
        const res = await db.any(qStr);
        if (res.length > 0) {
            return res[0];
        }
        return null;
    } catch (error) {
        console.log('error db/get', error);
    }
}

exports.getAll = async (tbName, fieldName, value, orderField) => {
    const table = new pgp.helpers.TableName({
        table: tbName,
        schema: schema
    })
    const qStr = pgp.as.format('SELECT * FROM ${table} WHERE ${fieldName~}=${value} ORDER BY ${orderField~} ASC', {
        table,
        fieldName,
        value,
        orderField
    })
    try {
        const res = await db.any(qStr);
        if (res.length > 0) {
            return res;
        }
        return null;
    } catch (error) {
        console.log('error db/getAll', error);
    }
}

// exports.getAll = async (tbName, fieldName, value, orderField) => {
//     const table = new pgp.helpers.TableName({
//         table: tbName, schema: schema
//     });
//     const qStr = pgp.as.format(`SELECT * FROM $1 WHERE "${fieldName}"='${value}' ORDER BY "${orderField}" ASC`, table);
//     try {
//         const res = await db.any(qStr);
//         if (res.length > 0) {
//             return res;
//         }
//         return null;
//     } catch (error) {
//         console.log('error db/getAll', error);
//     }
// }

exports.add = async (tbName, entity) => {
    const table = new pgp.helpers.TableName({
        table: tbName, schema: schema
    });
    const qStr = pgp.helpers.insert(entity, null, table) + " RETURNING *";
    try {
        const res = await db.one(qStr);
        return res;
    } catch (error) {
        console.log('error db/add', error);
    }
}

// exports.update = async (tbName, obj, idField) => {
//     const table = new pgp.helpers.TableName({
//         table: tbName, schema: schema
//     });
//     const condition = pgp.as.format(' WHERE ${idField~} = ${CatID}', {
//         CatID: obj.CatID,
//         idField: idField
//     });
//     const qStr = pgp.helpers.update(obj, ['CatName'], table) + condition + "RETURNING *";
//     console.log('Qstr: ',qStr);
//     try {
//         const res = db.one(qStr);
//         return res;
//     } catch (error) {
//         console.log('error db/update', error);
//     }
// }
exports.update = async (tbName, obj, idField, value, colName) => {
    const table = new pgp.helpers.TableName({
        table: tbName, schema: schema
    });
    const condition = pgp.as.format(' WHERE ${idField~} = ${value}', {
        value,
        idField
    });
    const qStr = pgp.helpers.update(obj, [colName], table) + condition + " RETURNING *";
    try {
        const res = db.one(qStr);
        return res;
    } catch (error) {
        console.log('error db/update', error);
    }
}

exports.delete = async (tbName, idField, value) => {
    const table = new pgp.helpers.TableName({
        table: tbName, schema: schema
    })
    const qStr = pgp.as.format(`DELETE FROM $1 WHERE "${idField}" = '${value}'`, table) + "RETURNING *";
    try {
        const res = db.one(qStr);
        return res;
    } catch (error) {
        console.log('error db/delete', error);
    }

}