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
    tmpUser = await userModel.searchUserById(req.params.id);
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

const isValidName = (name) => {
    if (!name) return false;
    let firstLetters = name.split(/\s/).reduce((response, word) => (response += word.slice(0, 1)), "");
    for (const letter of firstLetters) if (letter != letter.toUpperCase()) return false;
    return true;
};

const isValidFx = (x) => {
    return x >= 0 && x <= 3;
};

const isNumber = (str) => {
    return /^\d+$/.test(str);
};

exports.postCreateForm = async (req, res) => {
    //validate
    var err = "";
    if (!isValidName(req.body.f_Name)) err = "Name is not valid";
    if (!isValidFx(req.body.f_Fx)) err = "Fx is not valid";
    if (!isNumber(req.body.f_ID)) err = "Id is not valid";
    if (err !== "") return res.render("users/form_adduser", { err });
    userModel.createUser(req.body);
    res.redirect('./');
}

exports.getEditForm = async (req, res) => {
    tmpUser = await userModel.getUserById(req.params.id);
    res.render('/single', {
        user: tmpUser
    })
}

exports.changeAddress = async (req, res) => {
    listUser.getById(req.params.id);
    res.render("users/form_change_covid_address", {
        user: tmpUser,
    });
}

exports.postEditForm = async (req, res) => {
    tmpUser = await userModel.getUserById(req.params.id);
    var curDate = new Date();
    var curTime = `${curDate.getMonth() + 1}/${curDate.getFullYear()} ${curDate.getHours()}:${curDate.getMinutes()} `;
    if (tmpUser.f_History === null) tmpUser.f_History = [];
    if (req.body.f_CovidAddress !== undefined) {
        tmpUser.f_CovidAddress = req.body.f_CovidAddress;
        tmpUser.f_History.push(curTime + `Change Covid Address To ${tmpUser.f_CovidAddress}`);
        listUser.update(tmpUser.f_ID, tmpUser);
        return;
    }

    if (tmpUser.f_Fx > 0) {
        if (tmpUser.f_RelatedID !== null) {
            for (const anotherID of tmpUser.f_RelatedID) {
                tmpUser2 = await userModel.getUserById(anotherID);
                if (tmpUser2.f_Fx > 0) {
                    tmpUser2.f_Fx--;
                    tmpUser2.f_History.push(curTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
                    userModel.updateUser(tmpUser2.f_ID, tmpUser2);
                }
            }
        }

        tmpUser.f_Fx--;
        tmpUser.f_History.push(curTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
        userModel.updateUser(tmpUser.f_ID, tmpUser);
    }
}