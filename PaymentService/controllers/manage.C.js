const accountModel = require('../models/account.M');
const bcrypt = require('bcryptjs');
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