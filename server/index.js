//imports
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const Game = require('./models/Game');
const getSentence = require("./api/getSentence");


//create a server
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require('socket.io')(server);

//middle ware
app.use(express.json());


//listening to socket io  events
io.on('connection', (socket) => {
    console.log("socket id " + socket.id);

    socket.on('test', (data) => {
        console.log("data" + data);
    });

    socket.on('create-game', async ({ nickName }) => {
        try {
            let game = new Game();
            const sentence = await getSentence();
            game.words = sentence;
            let player = {
                socketId: socket.id,
                nickName,
                isPartyLeader: true,
            }
            game.players.push(player);
            game = await game.save();
        } catch (e) {
            console.log(e);
        }
    });


});



// connect to mongodb
const DB = "mongodb+srv://tanvir34:12345678asdf@cluster0.x0fblrq.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(DB).then(() => {
    console.log("DB Connection Successfull");
}).catch((e) => {
    console.log(e);
});

//listening server
server.listen(port, "0.0.0.0", () => {
    console.log("server started and running on port " + port);
});
