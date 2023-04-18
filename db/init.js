const knex = require("knex");
const config = require("../conn");
const client = knex(config.db);

module.exports = client;
