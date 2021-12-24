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

// [POST] /user/create
router.post("/create", async (req, res) => {
  //TODO validate?
  listUser.create(req.body);
  res.redirect("./");
});

// [GET] /user/:id/edit
router.get("/:id/edit", async (req, res) => {
  tmpUser = await listUser.getById(req.params.id);
  res.render("users/single", {
    user: tmpUser,
  });
});

// [POST] /user/:id/edit
// increase Fx
router.post("/:id/edit", async (req, res) => {
  //Get this ID and Update
  tmpUser = await listUser.getById(req.params.id);
  if (tmpUser.f_Fx > 0) {
    var currentdate = new Date();
    //Get Related ID and Update
    if (tmpUser.f_RelatedID !== null)
      for (const anotherID of tmpUser.f_RelatedID) {
        tmpUser2 = await listUser.getById(anotherID);
        if (tmpUser2.f_Fx > 0) {
          tmpUser2.f_Fx--;

          listUser.update(tmpUser2.f_ID, tmpUser2);
        }
      }
    //Update this ID
    tmpUser.f_Fx--;
    listUser.update(tmpUser.f_ID, tmpUser);
  }
});

module.exports = router;
