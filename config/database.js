const config   = require('./config');
const dbConfig = config.db_config;

const mysql = require('mysql');
const connection = {
  mysql_pool : mysql.createPool({
    host     : dbConfig.options.host,
    user     : dbConfig.username,
    password : dbConfig.password,
    database : dbConfig.database,
    multipleStatements : true
  })
};

module.exports = connection;