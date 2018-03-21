var express = require('express');
var router = express.Router();
var date = require('date-and-time');

const chats = require('../model/chats');

var count = 0;
var $ipsConnected = [];

router.get('/', function(req, res, next) {
    io.sockets.once('connection', function(socket) {
        var $ipAddress = socket.handshake.address;

        if (!$ipsConnected.hasOwnProperty($ipAddress)) {
            $ipsConnected[$ipAddress] = 1;
            count++;
            io.sockets.emit('counter', { count: count });

        }

        socket.on('send messages', function(data) {
            let user = data.user;
            let mess = data.mess;
            let nowDate = new Date();
            date.format(nowDate, 'YYYY-MM-DD HH:mm:ss');
            chats.insertDataMessagerUser(user, mess, nowDate, function() {
                io.sockets.emit('server respone', { username: user, messages: mess, time: nowDate });
            });
        });

        socket.on('get all messages', function() {
            chats.getDataMessagerUser(function(result) {
                io.sockets.emit('reveice all messages', result);
            });
        });


        /* Disconnect socket */
        socket.on('disconnect', function() {
            console.log('you disconnected');
            if ($ipsConnected.hasOwnProperty($ipAddress)) {
                delete $ipsConnected[$ipAddress];
                count--;
                io.sockets.emit('counter', { count: count });
            }

        });
        socket.on('disconnecting', () => {
            console.log('you disconnecting');
        });
    });

    res.render('chat.ejs');
});

module.exports = router;