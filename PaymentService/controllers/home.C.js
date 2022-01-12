module.exports = (req, res) => {
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