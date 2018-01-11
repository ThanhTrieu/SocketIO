const db = require('../config/database').mysql_pool;


module.exports.getDataMessagerUser = function (callback) {
  db.getConnection(function(err, connection) {
    db.query('call getDataMessagerUser()', function (err, result) {
      if (err) {
        return console.error(err.message);
      }
      if(result)
        return callback(result[0]);
      return;
    });
  });
}


module.exports.insertDataMessagerUser = function (username,message,timeChat,callback) {
  db.getConnection(function(err, connection) {
    db.query('call insertDataMessagerUser(?,?,?)', [username,message,timeChat], function (err, result) {
      if (err) {
        return console.error(err.message);
      }
      if(result)
        return callback(true);
      return;
    });
  });
}