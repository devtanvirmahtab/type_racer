//imports
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const Game = require('./models/games.model');


// create server
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require('socket.io')(server);

app.use(express.json());

//connect to mongoDB
const DB = "";

mongoose.connect(DB)
  .then(() => {
    console.log('Connected!');
  })
  .catch((e)=> {
    console.log(e);
  });


// listening to socket io events from client(flutter)
io.on("connection",(socket) => {
    console.log(socket.id);
//    socket.on('test',(data)=>{
//        console.log(data);
//    })

    socket.on("create-game",async ({nickname}) =>{
        try{
            let game = new Game();
        }catch(e){
            console.log(e);
        }
    });
});


// listen to server
server.listen(port,"0.0.0.0",()=>{
    console.log("server started and running on "+port);
});
