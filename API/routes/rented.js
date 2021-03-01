const express = require("express");
const multer = require("multer");

const router = express.Router();
const rentedController = require('../controllers/rented.controller')

router.get("/getRentedCar", rentedController.getRentedCars);


module.exports = router;