const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Car = Schema({


    brand: {
        type: String,
        required: true,

    },
    model: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    period: {
        type: String,
        required: true,
    },
    // image: {
    //     type: String,
    //     default: "",
    // },

});


module.exports = mongoose.model("Car", Car);