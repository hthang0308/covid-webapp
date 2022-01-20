const pgp = require("pg-promise")({
  capSQL: true,
});

const schema = "public";
const conn = {
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
  max: 30,
};

const db = pgp(conn);

// LOADING
exports.load = async (tableName) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format("SELECT * from $1", table);
  try {
    const res = await db.any(queryStr);
    return res;
  } catch (error) {
    console.log("Error loading: ", error);
  }
};

// LOADING WITH SORTING
exports.loadSort = async (tbName) => {
  const tableName = new pgp.helpers.TableName({
    table: tbName,
    schema: schema,
  });
  const qStr = pgp.as.format("SELECT * FROM ${tableName} ORDER BY ${stt~} ASC", { tableName: tableName, stt: "stt" });
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {
    console.log("Error load table");
  }
};

// READING
exports.get = async (tableName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format(`SELECT * from $1 where "${fieldName}" = '${value}'`, table);
  try {
    const res = await db.any(queryStr);
    return res;
  } catch (error) {
    console.log("Error getting: ", error);
  }
};

// SEARCHING
exports.search = async (tableName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format(`SELECT * from $1 where "${fieldName}"::text like '%${value}%'`, table);
  try {
    const res = await db.any(queryStr);
    return res;
  } catch (error) {
    console.log("Error searching: ", error);
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
  tmpEntity = JSON.parse(JSON.stringify(newEntity));
  if (tmpEntity.f_ID != null) delete tmpEntity.f_ID;
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const condition = pgp.as.format(` WHERE "${fieldId}" = '${id}'`, tmpEntity);
  const queryStr = pgp.helpers.update(tmpEntity, null, table) + condition;
  try {
    db.none(queryStr);
  } catch (error) {
    console.log("Error updating: ", error);
  }
};

// DELETING
exports.delete = async (tableName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tableName, schema: schema });
  const queryStr = pgp.as.format(`DELETE from $1 where "${fieldName}" = '${value}'`, table);
  try {
    const res = await db.result(queryStr);
    return res;
  } catch (error) {
    console.log("Error getting: ", error);
  }
};

// STATISTICS
exports.statistic = async (tbName, fieldName, staField, value) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.as.format(
    `SELECT ${fieldName}, count(*) as "soluong" FROM $1 WHERE "${staField}"='${value}' 
                              GROUP BY ${fieldName} ORDER BY ${fieldName} ASC`,
    table
  );
  console.log("Qstr: ", qStr);
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {
    console.log("Error statistics");
  }
};

// SIMPLE STATISTICS
exports.simpleStatistic = async (tbName, fieldName, staField, orderField) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.as.format(`SELECT ${fieldName}, ${staField} FROM $1 ORDER BY ${orderField} ASC`, table);
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {
    console.log("Error s/statistics");
  }
};
