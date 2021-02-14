const express = require("express");
const { model } = require("mongoose");
const User = require("../models/users.model");
const config = require("../config");
const jwt = require("jsonwebtoken");
const md = require("../middleware");

const router = express.Router();
const userController = require('../controllers/user.controller')


router.get("/:username", md.checkToken, userController.findUser);


router.get("/checkusername/:username", userController.checkUsername);


router.post("/login", userController.logIn);


router.post('/register', userController.signup);


router.patch("/update/:username", md.checkToken, userController.updatePassword);


router.delete("/delete/:username", md.checkToken, userController.deleteUser);


module.exports = router;