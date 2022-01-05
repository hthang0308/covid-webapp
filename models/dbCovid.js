const pgp = require('pg-promise')({
    capSQL: true
});
const schema = "public";
const cn = {
    host: 'localhost',
    port: 5432,
    database: 'qlCovid',
    user: 'postgres',
    password: '123456',
};

const db = pgp(cn);

exports.load = async (tbName) => {
    const tableName = new pgp.helpers.TableName({
        table: tbName,
        schema: schema
    })
    const qStr = pgp.as.format('SELECT * FROM ${tableName} ORDER BY ${stt~} ASC', { tableName: tableName, stt: 'stt' });
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('Error load table');
    }
}

exports.statistic = async (tbName, fieldName, staField, value) => {
    const tableName = new pgp.helpers.TableName({
        table: tbName,
        schema: schema
    })
    const qStr = pgp.as.format('SELECT ${fieldName~}, count(*) as "soluong" FROM ${tableName} WHERE ${staField~}=${value} GROUP BY ${fieldName~} ORDER BY ${fieldName~} ASC', {
        tableName: tableName,
        fieldName,
        value,
        staField
    });
    console.log('Qstr: ', qStr);
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('Error statistics');
    }
}

exports.simpleStatistic = async (tbName, fieldName,staField, orderField) => {
    const tableName = new pgp.helpers.TableName({
        table: tbName,
        schema: schema
    })
    const qStr = pgp.as.format('SELECT ${fieldName~}, ${staField~} FROM ${tableName} ORDER BY ${orderField~} ASC', {
        tableName: tableName,
        fieldName,
        staField,
        orderField
    });
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('Error s/statistics');
    }
}