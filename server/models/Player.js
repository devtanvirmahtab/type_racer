const mongoose = require('mongoose');
const playerSchema = new mongoose.Schema({
    nickName: {
        type: String
    },
    currentWordIndex: {
        type: Number,
        default: 0,
    },
    WPM: {
        type: Number,
        default: -1,

    },

    socketId: {
        type: String,
    },
    isPartyLeader: {
        type: Boolean,
        default: false,
    },

});

module.exports = playerSchema;