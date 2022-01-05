const port = 3000;
const app = require('./app');
const express = require('express');
// Handlebar
const exphbs = require('express-handlebars');
const hbs = exphbs.create({
    extname: '.hbs'
})
app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
app.set('views', './views');
//
const server = app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});

const  router = require('./routes/statistic');
app.use('/',router);
process.on('uncaughtException', (error) => {
    console.log('UNCAUGHT EXCEPTION - Shutting down...');
    console.log(error);
    process.exit(1);
});

process.on('unhandledRejection', (error) => {
    console.log(error);
    console.log('Unhandled promise rejections - Shutting down...');

    server.close(() => {
        process.exit(1);
    });
});

app.use(express.static(__dirname + '/public'));
