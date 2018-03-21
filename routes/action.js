var express = require('express');
var router = express.Router();
var date = require('date-and-time');

const users = require('../model/users');

router.get('/add', function(req, res, next) {
    io.sockets.once('connection', function(socket) {
        socket.on('requestServer', function(data) {
            console.log('hi you !!!');
            let user = data.user;
            let email = data.email;
            users.insertDataAdmin(user, email, function(result) {
                if (result) {
                    console.log('add success');
                    socket.emit('responseClient', true);
                }
            });

            users.getAllDataAdmins(null, null, function(resutl) {
                io.sockets.emit("sendToClient", resutl);
            });
        });
    });
    res.render('add');
});

module.exports = router;