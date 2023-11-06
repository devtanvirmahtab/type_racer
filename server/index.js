//imports
const { Socket } = require("dgram");
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");


//create a server
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require('socket.io')(server);

//middle ware
app.use(express.json());


//listening to socket io  events
io.on('connection',(socket) => {
    console.log(socket.id);
});


//connect to mongodb
const DB = "mongodb+srv://tanvir34:12345678asdf@cluster0.x0fblrq.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(DB).then(() => {
     console.log("Connection Successfull");
}).catch((e) => {
    console.log(e);
});

//listening server
server.listen(port,"0.0.0.0",()=>{
    console.log("server started and running on port "+port);
});
