const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const RentedCar = Schema({
    user: {
        type: new Schema({
            name: {
                type: String,
                required: true,
            },
        }),
        required: true,
    },
    car: {
        type: new Schema({
            name: {
                type: String,
                required: true,
            },
            dailyRentalRate: {
                type: Number,
                required: true,
            }
        }),
        required: true
    }
});

module.exports = mongoose.model("RentedCar", RentedCar);