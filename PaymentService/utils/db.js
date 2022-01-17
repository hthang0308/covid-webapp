const pgp = require('pg-promise')({
  capSQL: true
});

const schema = 'public';

const conn = {
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
  max: 30,
}

const db = pgp(conn);

// THIS CODE RUN FOR PAYMENT, please don't change my code
exports.load = async (tableName, orderField) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const qStr = pgp.as.format('SELECT * FROM ${table} ORDER BY ${orderField~} ASC', { table, orderField });
    try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {
    console.log("Error loading: ", error);
  }
};

// READING
exports.get = async (tableName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format('SELECT * from ${table} where ${fieldName~} = ${value}', {table, fieldName, value});
  try {
    const res = await db.any(queryStr);
    if (res.length > 0) {
      return res[0];
    }
    return null;
  } catch (error) {
    console.log("Error getting: ", error);
  }
};

// READING (ALL)
exports.getAll = async (tableName, fieldName, value, orderField) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format(`SELECT * from $1 where "${fieldName}"='${value}' ORDER BY ${orderField} ASC`, table);
  try {
    const res = await db.any(queryStr);
    if (res.length > 0) {
      return res;
    }
    return null;
  } catch (error) {
    console.log("Error getting all: ", error);
  }
};

// CREATING
exports.create = async (tableName, entity) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.helpers.insert(entity, null, table) + " RETURNING *";
  try {
    const res = await db.one(queryStr);
    return res;
  } catch (error) {
    console.log("Error creating: ", error);
  }
};

// UPDATING
exports.update = async (tableName, fieldId, id, newEntity) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const condition = pgp.as.format(` WHERE "${fieldId}" = '${id}'`, newEntity);
  const queryStr = pgp.helpers.update(newEntity, null, table) + condition + " RETURNING *";
  try {
    db.none(queryStr);
  } catch (error) {
    console.log("Error updating: ", error);
  }
};

// DELETING
exports.delete = async (tableName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format(`DELETE from $1 where "${fieldName}" = '${value}'`, table) + "RETURNING *";
  try {
    const res = await db.result(queryStr);
    return res;
  } catch (error) {
    console.log("Error getting: ", error);
  }
};
