const exhbs = require("express-handlebars");
const exhbs_sections = require("express-handlebars-sections");

module.exports = (app) => {
  const hbs = exhbs.create({
    defaultLayout: "homes",
    extname: "hbs",
    helpers: {
      ifEquals(s1, s2, options) {
        if (s1 == s2) return options.fn(this);
        return options.inverse(this);
      },
      ifNotEquals(s1, s2, options) {
        if (s1 != s2) {
          return options.fn(this);
        }
        return options.inverse(this);
      },
      select(value, options) {
        return options.fn(this).replace(new RegExp(' value="' + value + '"'), '$& selected="selected"');
      },
    },
  });
  exhbs_sections(hbs);
  app.engine("hbs", hbs.engine);
  app.set("view engine", "hbs");
  app.set("views", "./views");
};
