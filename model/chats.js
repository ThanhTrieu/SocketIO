const db = require('../config/database');


module.exports.getDataMessagerUser = function (callback) {
    db.query('call getDataMessagerUser()', function (err, result) {
      if (err) {
        return console.error(err.message);
      }
      if(result)
        return callback(result[0]);
      return;
    });
}


module.exports.insertDataMessagerUser = function (username,message,timeChat,callback) {
    db.query('call insertDataMessagerUser(?,?,?)', [username,message,timeChat], function (err, result) {
      if (err) {
        return console.error(err.message);
      }
      if(result)
        return callback(true);
      return;
    });
}