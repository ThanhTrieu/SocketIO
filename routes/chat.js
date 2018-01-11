var express = require('express');
var router  = express.Router();
var date    = require('date-and-time');

const chats = require('../model/chats');


router.get('/', function(req, res, next) {
    io.sockets.on('connection', function(socket) {
        socket.on('send messages', function(data){
            let user = data.user;
            let mess = data.mess;
            let nowDate = new Date();
            date.format(nowDate, 'YYYY-MM-DD HH:mm:ss');
            chats.insertDataMessagerUser(user,mess,nowDate,function(){
                io.sockets.emit('server respone', {username : user, messages : mess});
            });
        });

        socket.on('get all messages',function(){
            chats.getDataMessagerUser(function(result){
                io.sockets.emit('reveice all messages',result);
            });
        });
    });
    res.render('chat.ejs');
});

module.exports = router;