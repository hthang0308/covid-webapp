const express = require('express');
const path = require('path');

// const mathRouter = require('./routes/mathRouter');
// const meetRouter = require('./routes/meetingRouter');
// const userRouter = require('./routes/userRouter');


const app = express();
// app.set('view engine', 'ejs');
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

// app.use('/', userRouter);
// app.use('/math/', mathRouter);
// app.use('/meeting/', meetRouter);

app.use(express.static(path.join(__dirname + '/public')));
app.all('*', (req, res, next) => {
    next(console.log(`Can't find ${req.originalUrl} on this server`, 404));
});

module.exports = app;