const db = require('../utils/db');
const accountModel = require('../models/account.M');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
//const { JsonWebTokenError } = require('jsonwebtoken');
class SignUpController {
    getSignUp(req, res) {
        if (req.user) {
            res.redirect('/');
            return
        }
        res.render('signup');

    }

    async postSignUp(req, res) {
        // if (req.session.user) {
        //     res.redirect('/');
        //     return
        // }
        var id = 1000;
        let rows = await db.load("Accounts", "AccID");
        for (var i = 0; i < rows.length; i++) {
            if (id !== rows[i].AccID) {
                break;
            }
            id++;
        }
        if (id === 0) {
            id = rows.length;
        }
        // const pass = req.body.password;
        // const saltRounds = 10;
        // const passHashed = await bcrypt.hash(pass, saltRounds);
        const acc = {
            AccID: id,
            Password: null,
            Balance: 0,
        };
        const newAcc = await accountModel.addAccount(acc);
        res.json(newAcc);
    }

    async addAccount(req, res, next) {
        var response = {
            Response: 'false'
        }
        if (req.body && req.body.access_token) {
            try {
                var decoded = await jwt.verify(req.body.access_token, process.env.JWT_SECRET);
                if (decoded) {
                    var acc = {
                        AccID: decoded.id,
                        Password: null,
                        Balance: 0
                    }
                    await accountModel.addAccount(acc);
                    response.Response = 'true';
                    response.AccID = decoded.id;
                    res.json(response);
                    return
                }
            } catch (error) {
                response.Error = 'Error verify JWT';
                res.json(response);
                return;
            }
        }
        response.Error = 'No access_token'
        res.json(response);
    }
}
module.exports = new SignUpController();