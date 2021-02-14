var mongoose = require('mongoose');
const User = require("../models/users.model");
const config = require("../config");
const jwt = require("jsonwebtoken");
const md = require("../middleware");


exports.findUser = (req, res) => {
    User.findOne({ username: req.params.username }, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        res.json({
            data: result,
            username: req.params.username,
        });
    });
}

exports.checkUsername = (req, res) => {
    User.findOne({ username: req.params.username }, (err, result) => {
        if (result !== null) {
            return res.json({
                Status: true,
            });
        } else return res.json({
            Status: false,
        });
    });
}

exports.logIn = (req, res) => {
    User.findOne({ username: req.body.username }, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        if (result == null) {
            res.status(403).json("username or password incorrect");
        }
        if (result.password == req.body.password) {
            let token = jwt.sign({ username: req.body.username }, config.key, {
                expiresIn: "24h",
            });
            res.json({
                token: token,
                msg: "success",
            });
        } else {
            res.status(403).json("password is incorrect");
        }
    });
}


exports.updatePassword = (req, res) => {
    User.findOneAndUpdate({ username: req.params.username }, { $set: { password: req.body.password } },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "password successfully updated",
                username: req.params.username,
            };
            return res.json(msg);
        });
}


exports.deleteUser = (req, res) => {
    User.findOneAndDelete({ username: req.params.username },
        (err, result) => {
            if (err) return res.status(500).json({ msg: err });
            const msg = {
                msg: "user deleted",
                username: req.params.username,
            };
            return res.json(msg);
        });
}

exports.signup = (req, res) => {
    console.log("Inside the register");
    const user = new User({
        username: req.body.username,
        password: req.body.password,
        email: req.body.email,
    });
    user
        .save()
        .then(() => {
            console.log("user registered");
            res.status(200).json("ok");
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
}