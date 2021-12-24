const { Pool } = require('pg');

const pool = new Pool({
    host: process.env.PGHOST,
    user: process.env.PGUSER,
    max: 30,
    password: process.env.PGPASSWORD,
    database: process.env.PGDATABASE,
    port: process.env.PGPORT,
})

module.exports = {
    async query(text, params) {
        const start = Date.now();
        const res = await pool.query(text, params);
        const duration = Date.now() - start;
        console.log('Executed query: ', { text, duration, rows: res.rowCount });
        return res;
    },

    async getClient() {
        const client = await pool.connect();
        const query = client.query;
        const release = client.release;

        const timeout = setTimeout(() => {
            console.log('A client has been checked out for more than 5s!');
            console.log(`Last executed query: ${client.lastQuery}`)
        }, 5000)

        client.query = (...args) => {
            client.lastQuery = args;
            return query.apply(client, args)
        }

        client.release = () => {
            clearTimeout(timeout)
            client.query = query
            client.release = release
            return release.apply(client)
        }

        return client
    }
}