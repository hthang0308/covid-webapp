const packageRouter = require('./packageRoute');
const productRouter = require('./productRoute');
const userRouter = require('./userRoute');
const statRouter = require('./statisticRoute');
const authRouter = require('./authRouter');

function route(app) {
    app.use('/', authRouter);
    app.use('/user', userRouter);
    app.use('/statistic', statRouter);
    app.use('/products', productRouter);
    app.use('/packages', packageRouter);
}

module.exports = route;