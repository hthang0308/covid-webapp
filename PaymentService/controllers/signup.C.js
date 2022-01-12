const db = require('../models/db');
const accountModel = require('../models/account.M');
const bcrypt = require('bcrypt');
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
        const newAcc = await accountModel.add(acc);
        res.json(newAcc);
    }
}
module.exports = new SignUpController();