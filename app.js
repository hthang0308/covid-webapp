const express = require('express');
const path = require('path');

const userRouter = require('./routes/userRoute');
const packRouter = require('./routes/packageRoute');
const productRouter = require('./routes/productRoute');


const app = express();
// app.set('view engine', 'ejs');
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use('/', userRouter);
app.use('/products', productRouter);
app.use('/packages', packRouter);

app.use(express.static(path.join(__dirname + '/public')));
app.all('*', (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;