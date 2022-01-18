module.exports = (data, statusCode, res) => {
    res.status(statusCode).json({
        status: 'Success',
        data,
    })
}