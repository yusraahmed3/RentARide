var mongoose = require('mongoose');
const Car = require("../models/cars.model");

exports.getAllCars = (req, res) => {

    Car.find({}, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        res.json({
            data: result,
        });
    });
}

exports.getOneCar = (req, res) => {
    Car.findOne({ _id: req.params.model }, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        res.json({
            data: result,
            model: req.params.model,
        });
    });

}

exports.updatePrice = async(req, res) => {
    console.log("Inside update");
    Car.findByIdAndUpdate({ _id: req.params.price }, { $set: { price: req.body.price } },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "Price successfully updated",
                price: req.params.price,
            };
            return res.json(msg);
        });
}

exports.addCar = async(req, res) => {
    console.log("Inside the register");
    const car = await new Car({
        brand: req.body.brand,
        model: req.body.model,
        price: req.body.price,
        rentperiod: req.body.rentperiod,
        image: req.file.path,
    });
    car
        .save()
        .then(() => {
            console.log("car registered");
            res.status(200).json("ok");
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
}

exports.deleteCar = async(req, res) => {
    Car.findByIdAndDelete({ _id: req.params.brand },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "Car deleted",
                brand: req.params.brand,
            };
            return res.json(msg);
        });
}