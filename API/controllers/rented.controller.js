const e = require('express');
var mongoose = require('mongoose');
const RentedCar = require("../models/rentedcar.model");

exports.getRentedCars = async(req, res) => {
    const rentalist = await RentedCar.findById(req.params.id);
    if (!rentalist) {
        res.status(404).json({ msg: "Not found" });
    }
    res.send(rentalist);
}

exports.rentCar = async(req, res) => {
    console.log("Inside rent");
    const rent = new RentedCar({

    })
}