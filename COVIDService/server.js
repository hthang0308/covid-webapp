const port = 3000;
const https = require('https');
// var sslRootCAs = require('ssl-root-cas')
// sslRootCAs.inject()
//const {app, credentials} = require('./app');
const app = require('./app');
const server = app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});
// https.createServer(credentials, app).listen(port, () => {
//     console.log(`Server started on port ${port}`);
// });

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
