const config   = require('./config');
const dbConfig = config.db_config;

const mysql = require('mysql');
var connection = mysql.createConnection({
  host     : dbConfig.options.host,
  user     : dbConfig.username,
  password : dbConfig.password,
  database : dbConfig.database,
  multipleStatements : true,
});
connection.connect();
module.exports = connection;