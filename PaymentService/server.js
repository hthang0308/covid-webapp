const port = 5000;
const app = require('./app');
const https = require("https");

// https.createServer(credentials, app).listen(port, () => {
//     console.log(`Server started on port ${port}`);
// });
const server = app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});

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