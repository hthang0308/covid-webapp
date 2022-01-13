module.exports = (req, res) => {
    if (req.user) {
        req.logout();
    }
    res.redirect("/signin");
}