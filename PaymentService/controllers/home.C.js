const jwt = require('jsonwebtoken');
const db = require('../utils/db');
const accountModel = require('../models/account.M');

exports.getHome = (req, res) => {
    if (req.user) {
        const formatedBal = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(req.user.Balance);
        if (req.user.AccID === 1000) {
            return res.render('home', {
                balance: formatedBal,
                accid: req.user.AccID
            });
        }
        return res.render('home', {
            balance: formatedBal,
            accid: req.user.AccID,
            notadmin: 'true'
        });

    }
    res.redirect('/signin')
}
