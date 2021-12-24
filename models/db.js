const pgp = require("pg-promise")({
  capSQL: true,
});
const schema = "public";
const cn = {
  user: "postgres",
  host: "localhost",
  database: "qlnguoi",
  password: "1234",
  port: 5432,
  max: 30,
};
const db = pgp(cn);

exports.load = async (tbName) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.as.format("Select * FROM $1", table);
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {
    console.log("error load: ", error);
  }
};

exports.get = async (tbName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  //SELECT * FROM USERS WHERE "f_User" = 'User'
  const qStr = pgp.as.format(`Select * FROM $1 WHERE "${fieldName}"='${value}'`, table);
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {}
};

exports.search = async (tbName, fieldName, value) => {
  //SELECT * FROM USERS WHERE "f_UserID"::text LIKE 'abc'
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.as.format(`Select * FROM $1 WHERE "${fieldName}"::text LIKE '${value}%'`, table);
  try {
    const res = await db.any(qStr);
    return res;
  } catch (error) {}
};

exports.create = async (tbName, entity) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.helpers.insert(entity, null, table) + " RETURNING *";
  try {
    const res = await db.one(qStr);
    return res;
  } catch (error) {
    console.log("error create: ", error);
  }
};

exports.delete = async (tbName, fieldName, value) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const qStr = pgp.as.format(`DELETE FROM $1 WHERE "${fieldName}"='${value}'`, table);
  try {
    const res = await db.result(qStr);
    return res;
  } catch (error) {}
};
exports.update = async (tbName, fieldId, id, newEntity) => {
  const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
  const condition = pgp.as.format(` WHERE "${fieldId}"=${id}`, newEntity);
  const qStr = pgp.helpers.update(newEntity, null, table) + condition;
  try {
    db.none(qStr);
  } catch (error) {
    console.log("error update: ", error);
  }
};
