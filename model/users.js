// Example model
const db = require('../config/database');

// module.exports.adnrpt_adx_banner_report_all  = function (fdate,tdate,callback) {
//     db.query('call adnrpt_adx_banner_report_all(?,?)',[fdate,tdate], function (err, result) {
//       if (err) {
//         return console.error(err.message);
//       }
//       if(result)
//         return callback(result[0]);
//       return;
//     });
// }

module.exports.getAllDataAdmins = function(fdate, tdate, callback) {
    db.query('call getAllDataAdmins()', function(err, result) {
        if (err) {
            return console.error(err.message);
        }
        if (result)
            return callback(result[0]);
        return;
    });
}

module.exports.insertDataAdmin = function(username, email, callback) {
    db.query('call 	addAdmin(?,?)', [username, email], function(err, result) {
        if (err) {
            return console.error(err.message);
        }
        if (result) {
            return callback(true);
        }
        return;
    });
}