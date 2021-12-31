const db = require('../models/dbCovid');

exports.statistic = async (req, res) => {
    let tableName = 'relatedcovid';
    let fieldName = 'trangthai';
    // Ngày thống kê sẽ lấy từ req
    let value = '2021-12-12';
    let staField = 'ngaythem'
    data = await db.statistic(tableName, fieldName, staField, value);
    res.render('statistic', {
        status: data
    });
}

exports.simpleStatistic = async (req, res) => {
    let tableName = 'Products';
    let fieldName = 'ProName';
    let staField = 'Sold'
    data = await db.simpleStatistic(tableName,fieldName,staField,"ProID");
    res.render('simpleSta', {
        status: data
    });
}