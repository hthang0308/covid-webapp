const   express = require('express'),
        path = require('path'),
        hbs = require('express-handlebars'),
        bodyParser = require('body-parser'),
        morgan = require('morgan'),
        express_handlebars_sections = require('express-handlebars-sections')

// const mathRouter = require('./routes/mathRouter');
// const meetRouter = require('./routes/meetingRouter');
// const userRouter = require('./routes/userRouter');
const authRouter = require('./routes/authRoute');
const managerRouter = require('./routes/managerRoute');

const app = express();
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.engine('hbs', hbs.engine({
    extname: '.hbs',
    defaultLayout: 'main',
    layoutsDir: __dirname + '/views/layouts',
    partialsDir: __dirname + '/views/partials',
    helpers: {
        section: express_handlebars_sections(),

    }
}));
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(morgan('dev'));

// app.use('/', userRouter);
// app.use('/math/', mathRouter);
// app.use('/meeting/', meetRouter);

// app.use('/', authRouter)
app.use('/account', authRouter)
app.use('/manager', managerRouter)

app.all('*', (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;