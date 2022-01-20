const sortByDate = (array) => {
  array.sort(function (a, b) {
    return new Date(b.f_DOB) - new Date(a.f_DOB);
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
const sortByFullName = (array) => {
  array.sort(function (a, b) {
    return a.f_Fullname.localeCompare(b.f_Fullname);
  });
};

const sortByPrice = (array) => {
  array.sort(function (a, b) {
    return a.f_Price - b.f_Price;
  });
};

module.exports = { sortByDate, sortByID, sortByName, sortByFullName, sortByPrice };
