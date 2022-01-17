const jwt = require('jsonwebtoken');
const db = require('../utils/db');
const accountModel = require('../models/account.M');

exports.getHome = (req, res) => {
    if (req.user) {
        const formatedBal = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(req.user.Balance);
        res.render('home', {
            balance: formatedBal,
            accid: req.user.AccID
        });
        return;
    }
    res.redirect('/signin')
}

exports.getBalance = async (req, res) => {
    var response = {
        Response: 'false'
    }
    if (req.body) {
        if (req.body.access_token && req.body.accid) {
            try {
                var decoded = await jwt.verify(req.body.access_token, process.env.JWT_SECRET)
                if (decoded) {
                    try {
                        const acc = await accountModel.getAccountById(req.body.accid);
                        if (acc) {
                            response.Response = 'true';
                            response.Balance = acc.Balance;
                        }
                    } catch (error) {
                        response.Error = "Can not get Balance from Database"
                        res.json(response);
                        return;
                    }
                }
                res.json(response);
                return;
            }
            catch (err) {
                response.Error = "Error jwt verify";
                res.json(response);
                return;
            }
        }
        res.json(response);
        return;
    }
    res.json(response);
}