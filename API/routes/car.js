const express = require("express");
const multer = require("multer");

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'images')
    },
    filename: function(req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + file.originalname)
    },
})

const upload = multer({ storage: storage })

const router = express.Router();

const carController = require("../controllers/car.controller")

router.get('/', carController.getAllCars);

router.get('/:model', carController.getOneCar);

router.post("/", upload.single("image"), carController.addCar)

router.patch("/update/:price", carController.updatePrice);

router.delete("/delete/:brand", carController.deleteCar);

module.exports = router;