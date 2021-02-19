const express = require("express");
const multer = require("multer");

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'images')
    },
    filename: function(req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + file.originalname)
    },
});

const fileFilter = (req, file, cb) => {
    if (file.mimetype == "image/jpeg" || file.mimetype == "image/png") {
        cb(null, true);
    } else {
        cb(null, false);
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 6,
    },
    fileFilter: fileFilter
});

const router = express.Router();

const carController = require("../controllers/car.controller")

router.get('/getData', carController.getAllCars);

router.get('/:model', carController.getOneCar);

// router.patch('/addCar/image', carController.addImage);

router.post("/addCar", carController.addCar)

router.put("/update/:model", carController.updateCar);

router.delete("/delete/:model", carController.deleteCar);

module.exports = router;