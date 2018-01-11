// Example model
const db = require('../config/database').mysql_pool;

module.exports.adnrpt_adx_banner_report_all  = function (fdate,tdate,callback) {
  db.getConnection(function(err, connection) {
    db.query('call adnrpt_adx_banner_report_all(?,?)',[fdate,tdate], function (err, result) {
      if (err) {
        return console.error(err.message);
      }
      if(result)
        return callback(result[0]);
      return;
    });
  });
}