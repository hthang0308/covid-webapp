const userModel = require('../models/user.M');
const { promisify } = require('util');
const jwt = require('jsonwebtoken');

exports.protect = async (req, res, next) => {
    // Checking token
    let token;
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
        token = req.headers.authorization.split(' ')[1];
    }
    if (!token) {
        return next('You are not logged in!!!');
    }

    // Checking user
    const verified = await promisify(jwt.verify)(
        token,
        process.env.JWT_SECRET,
    );
    const user = await userModel.getUserByID(verified.id);
    if (!user) return next('This user does no longer exist.');

    // Assigning user
    req.user = user;
    return next();
}

exports.restrictTo = (...roles) => (req, res, next) => {
    if (!roles.includes(req.user.f_Role)) {
        return next('You do not have permission to perform', 403);
    }
    return next();
}