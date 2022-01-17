const accountModel = require('../models/account.M');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const adminId = 1000;
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

exports.addBalance = async (req, res, next) => {
    if (req.user) {
        const account = await accountModel.getAccountById(req.user.AccID);
        const addMoney = parseFloat(req.body.money);

        if (isNaN(addMoney) || addMoney <= 0) {
            const formatedBal = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(req.user.Balance);
            res.render('home', {
                balance: formatedBal,
                accid: req.user.AccID,
                msg: 'Nạp tiền thất bại'
            });
            return;
        }
        const newBalance = parseFloat(req.body.money) + account.Balance;
        const acc = {
            AccID: req.user.AccID,
            Password: account.Password,
            Balance: newBalance
        }
        //const colName = "Balance"
        const rs = await accountModel.updateAccount(acc.AccID, acc);
        const formatedBal = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(newBalance);
        const formatedAddBal = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(req.body.money);
        res.render('home', {
            balance: formatedBal,
            accid: req.user.AccID,
            msg: `Nạp ${formatedAddBal} vào tài khoản thành công`
        });
        return;
    }
    res.redirect('/');
}

exports.getChangePass = async (req, res, next) => {
    if (req.user) {
        res.render('changePass', {
            AccID: req.user.AccID
        });
        return;
    }
    res.redirect('/')
}

exports.handleChangePass = async (req, res, next) => {
    if (req.user) {
        const account = await accountModel.getAccountById(req.user.AccID);
        const checkPass = await bcrypt.compare(req.body.password, account.Password);
        if (checkPass && account.Password) {
            const saltRound = 10;
            const passHashed = await bcrypt.hash(req.body.newpass, saltRound);
            const acc = {
                AccID: account.AccID,
                Password: passHashed,
                Balance: account.Balance
            }
            await accountModel.updateAccount(acc.AccID, acc);
            res.render('changePass', {
                AccID: req.user.AccID,
                msg: 'Thay đổi mật khẩu thành công',
                color: 'success'
            })
            return;
        }
        res.render('changePass', {
            AccID: req.user.AccID,
            msg: 'Sai mật khẩu',
            color: 'danger'
        })
        return;
    }
    res.redirect('/')
}

exports.transfer = async (req, res, next) => {
    var response = {
        Response: 'false'
    }
    if (req.body && req.body.access_token) {
        var decoded = await jwt.verify(req.body.access_token, process.env.JWT_SECRET)
        if (!decoded) {
            response.Error = 'Verify failed'
            res.json(response);
            return;
        }
        const accId = req.body.accid;
        const money = req.body.money;
        try {
            var acc = await accountModel.getAccountById(accId);
            var accAdmin = await accountModel.getAccountById(adminId);
            acc.Balance = acc.Balance - money;
            if (acc.Balance < 0) {
                response.Error = "Not enough money";
                res.json(response);
                return;
            }
            accAdmin.Balance = accAdmin.Balance + money;
            await accountModel.updateAccount(adminId, accAdmin);
            await accountModel.updateAccount(acc.AccID, acc);
            response.Response = 'true';
            response.newBalance = acc.Balance;
            res.json(response);
            return;

        } catch (error) {
            console.log('Error transfer money');
            response.Error = 'Error transfer money';
            res.json(response);
        }
    }
}