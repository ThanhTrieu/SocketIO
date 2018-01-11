var express = require('express');
var router = express.Router();
//var date    = require('date-and-time');
var dateFormat = require('dateformat');

const users = require('../model/users');

/* GET home page. */
router.get('/', function(req, res, next) {
  io.sockets.on('connection', function(socket){
    socket.on('reviceFromClient', function (data) {
        console.log('co thang goi vao - lay du lieu')
        let nowDate = new Date();
        let today = dateFormat(nowDate,"yyyy-mm-dd");
        let fromDate = (data.frdate !== null) ? data.frdate : today;
        let toDate   = (data.tdate !== null) ? data.tdate : today;

        users.adnrpt_adx_banner_report_all(fromDate, toDate, function (resutl) {
            io.sockets.emit("sendToClient", resutl);
        });
    });

    // socket.on('disconnect', function() {
    //     console.log('a user has left our page ');
    // });
  });
  res.render('index');
});

module.exports = router;
