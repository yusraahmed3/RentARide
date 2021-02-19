const e = require('express');
var mongoose = require('mongoose');
const Car = require("../models/cars.model");


// exports.addImage = async(req, res) => {
//     await Car.findOneAndUpdate({ model: req.params.model }, {
//         $set: {
//             image: req.file.path,
//         },
//     }, { new: true }, (err, car) => {
//         if (err) return res.status(500).send(err);
//         const response = {
//             msg: "Image added successfully",
//             data: car,
//         };
//         return res.status(200).send(response);
//     });
// }

exports.getAllCars = (req, res) => {
    console.log("Inside get method");
    Car.find({}, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        res.json(
            result,
        );
        console.log(result);
    });
    // Car.findOne({ _id: req.params.model }, (err, result) => {
    //     if (err) {
    //         return res.json({ err: err });
    //     }
    //     if (result == null) {
    //         return res.json({ data: [] });
    //     } else {
    //         return res.json({ data: result });
    //     }
    // });
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

exports.updateCar = async(req, res) => {
    try {
        const car_model = req.params.model
        const car = await Car.findOne({
            model: car_model
        })
        const newCar = {
            brand: req.body.brand,
            model: req.body.model,
            price: req.body.price,
            period: req.body.period,
        }
        await Car.updateOne({ model: car.model }, newCar);
        return res.status(200).json(newCar)

    } catch (error) {
        res.status(400).json({
            error: true,
            message: error.message
        })
    }

}

// exports.updateCar = async(req, res) => {
//         console.log("Inside update");
//         Car.findOneAndUpdate({ model: req.params.model },
//             (err, result) => {
//                 if (err) return res.status(500).json({ msg: err });
//                 const msg = {
//                     msg: "successfully updated",
//                 };
//                 return res.status(200).json(msg);
//             });
//     }
// Car.findByIdAndUpdate({ _id: req.params.model }, { $set: { price: req.body.price } },
//     (err, result) => {
//         if (err) return res.status(500).json({ msg: err });
//         const msg = {
//             msg: "Price successfully updated",
//             price: req.params.price,
//         };
//         return res.json(msg);
//     });
//}

exports.addCar = async(req, res) => {
    console.log("Inside the register");
    const car = await new Car({
        brand: req.body.brand,
        model: req.body.model,
        price: req.body.price,
        period: req.body.period,
    });
    car
        .save()
        .then(() => {
            console.log("car registered");
            return res.status(200).json(car);
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
}

exports.deleteCar = async(req, res) => {
    Car.findOneAndDelete({ model: req.params.model },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "Car deleted",
                brand: req.params.brand,
            };
            return res.status(200).json(msg);
        });
}