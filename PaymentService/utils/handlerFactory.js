const db = require("./db");

exports.getAll = async (TableName, orderField) => {
  const res = await db.load(TableName, orderField);
  return res;
};

exports.getAllByFieldName = async(TableName, fieldName, value, orderField) => {
  const res = await db.getAll(TableName, fieldName, value, orderField);
  return res;
}

exports.getOne = async (TableName, entity, value) => {
  const res = await db.get(TableName, entity, value);
  if (!res) return null;
  return res;
};

exports.createOne = async (TableName, object) => {
  const res = await db.create(TableName, object);
  return res;
};

exports.updateOne = async (TableName, entity, value, object) => {
  await db.update(TableName, entity, value, object);
};

exports.deleteOne = async (TableName, entity, value) => {
  const res = await db.delete(TableName, entity, value);
  return res;
};

// exports.search = async (TableName, entity, value) => {
  // const res = await db.search(TableName, entity, value);
  // if (!res) return null;
  // return res;
// };
