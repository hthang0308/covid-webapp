const exhbs = require("express-handlebars");
const hbs_section = require("express-handlebars-sections");

module.exports = (app) => {
  const hbs = exhbs.create({
    defaultLayout: "homes",
    extname: ".hbs",
    layoutsDir: "views/layouts",
    partialsDir: "views/partials",
    helpers: {
      calculate(op1, op2, opt, choice) {
        var opts = {
          eq: function (l, r) {
            return l == r;
          },
          noteq: function (l, r) {
            return l != r;
          },
          gt: function (l, r) {
            return Number(l) > Number(r);
          },
          or: function (l, r) {
            return l || r;
          },
          and: function (l, r) {
            return l & r;
          },
          "%": function (l, r) {
            return l % r === 0;
          },
        },
          result = opts[opt](op1, op2);

        if (result) return choice.fn(this);
        else return choice.inverse(this);
      },
      select(value, options) {
        return options.fn(this).replace(new RegExp(' value="' + value + '"'), '$& selected="selected"');
      },
      json: (obj) => {
        const keys = Object.keys(obj);
        let a = "{";
        keys.forEach((key) => (a += "'" + key + "':'" + obj[key] + "',"));
        a = a.slice(0, -1) + "}";
        return a;
      },
      // section: hbs_section(),
      sum: function (a, b) {
        return a + b;
      },
      _toInt: function (str) {
        return parseInt(str, 10);
      }
    },
  });
  hbs_section(hbs);
  app.engine("hbs", hbs.engine);
  app.set("view engine", "hbs");
  app.set("views", "./views");
};
