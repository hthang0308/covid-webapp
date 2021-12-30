const router = require("express").Router();
const listUser = require("../models/user.M");

// 1.2.1
// Chua co Update thong tin khac ngoai Fx
// [GET] /user?sort=date
router.get("/", async (req, res) => {
  arr = await listUser.all();
  if (req.query.sort === "date") sortByDate(arr);
  if (req.query.sort === "id") sortByID(arr);
  if (req.query.sort === "name") sortByName(arr);
  res.render("users/all", {
    users: arr,
  });
});

// [GET] /user/search/:id
router.get("/search/:id", async (req, res) => {
  tmpUser = await listUser.searchByID(req.params.id);
  res.render("users/all", {
    users: tmpUser,
  });
});
const sortByDate = (array) => {
  array.sort(function (a, b) {
    return new Date(b.f_Birthday) - new Date(a.f_Birthday);
  });
};
const sortByID = (array) => {
  array.sort(function (a, b) {
    return a.f_ID - b.f_ID;
  });
};
const sortByName = (array) => {
  array.sort(function (a, b) {
    return a.f_Name.localeCompare(b.f_Name);
  });
};

// 1.2.2

// [GET] /user/create
router.get("/create", async (req, res) => {
  res.render("users/form_adduser");
});

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
// [POST] /user/create
router.post("/create", async (req, res) => {
  //validate
  var err = "";
  if (!isValidName(req.body.f_Name)) err = "Name is not valid";
  if (!isValidFx(req.body.f_Fx)) err = "Fx is not valid";
  if (!isNumber(req.body.f_ID)) err = "Id is not valid";
  if (err !== "") return res.render("users/form_adduser", { err });
  listUser.create(req.body);
  res.redirect("./");
  //done
});

// [GET] /user/:id/edit
router.get("/:id/edit", async (req, res) => {
  tmpUser = await listUser.getById(req.params.id);
  res.render("users/single", {
    user: tmpUser,
  });
});

// [GET] /user/:id/change_covid_address
router.get("/:id/change_covid_address", async (req, res) => {
  tmpUser = await listUser.getById(req.params.id);
  res.render("users/form_change_covid_address", {
    user: tmpUser,
  });
});

// [POST] /user/:id/edit
// increase Fx
router.post("/:id/edit", async (req, res) => {
  //Get this ID and Update
  tmpUser = await listUser.getById(req.params.id);
  var currentdate = new Date();
  var currentTime = `${currentdate.getMonth() + 1}/${currentdate.getFullYear()} ${currentdate.getHours()}:${currentdate.getMinutes()} `;
  if (tmpUser.f_History === null) tmpUser.f_History = [];
  if (req.body.f_CovidAddress !== undefined) {
    tmpUser.f_CovidAddress = req.body.f_CovidAddress;
    tmpUser.f_History.push(currentTime + `Change Covid Address To ${tmpUser.f_CovidAddress}`);
    listUser.update(tmpUser.f_ID, tmpUser);
    return;
  }
  if (tmpUser.f_Fx > 0) {
    //Get Related ID and Update
    if (tmpUser.f_RelatedID !== null)
      for (const anotherID of tmpUser.f_RelatedID) {
        tmpUser2 = await listUser.getById(anotherID);
        if (tmpUser2.f_Fx > 0) {
          tmpUser2.f_Fx--;
          tmpUser2.f_History.push(currentTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
          listUser.update(tmpUser2.f_ID, tmpUser2);
        }
      }
    //Update this ID
    tmpUser.f_Fx--;
    tmpUser.f_History.push(currentTime + `From F${tmpUser.f_Fx + 1} To F${tmpUser.f_Fx}`);
    listUser.update(tmpUser.f_ID, tmpUser);
  }
});

module.exports = router;
