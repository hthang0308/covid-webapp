const userModel = require('../models/userModel');

exports.sortUser = async (req, res) => {
    arr = await userModel.getAllUsers();
    if (req.query.sort === "date") sortByDate(arr);
    if (req.query.sort === "id") sortById(arr);
    if (req.query.sort === "name") sortByName(arr);
    res.render('/all', {
        users: arr
    })
}

exports.searchUser = async (req, res) => {
    tmpUser = await userModel.searchById(req.params.id);
    res.render('/all', {
        users: tmpUser
    })
}

const sortByDate = (array) => {
    array.sort(function (a, b) {
        return new Date(b.f_Birthday) - new Date(a.f_Birthday);
    })
}

const sortById = (array) => {
    array.sort(function (a, b) {
        return a.f_ID - b.f_ID;
    })
}

const sortByName = (array) => {
    array.sort(function (a, b) {
        return a.f_Name.localeCompare(b.f_Name);
    })
}

exports.getCreateForm = async (req, res) => {
    res.render('form_adduser');
}

exports.postCreateForm = async (req, res) => {
    userModel.createUser(req.body);
    res.redirect('./');
}

exports.getEditForm = async (req, res) => {
    tmpUser = await userModel.getUserById(req.params.id);
    res.render('/single', {
        user: tmpUser
    })
}

exports.postEditForm = async (req, res) => {
    tmpUser = await userModel.getUserById(req.params.id);
    if (tmpUser.f_Fx > 0) {
        var curDate = new Date();
        if (tmpUser.f_RelatedID !== null) {
            for (const anotherID of tmpUser.f_RelatedID) {
                tmpUser2 = await userModel.getUserById(anotherID);
                if (tmpUser2.f_Fx > 0) {
                    tmpUser2.f_Fx--;

                    userModel.updateUser(tmpUser2.f_ID, tmpUser2);
                }
            }
        }

        tmpUser.f_Fx--;
        userModel.updateUser(tmpUser.f_ID, tmpUser);
    }
}