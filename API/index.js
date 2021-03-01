const express = require("express");
const mongoose = require("mongoose");
const app = express();

mongoose.connect("mongodb://localhost:27017/myapp", {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
});

const connection = mongoose.connection;
connection.once("open", () => {
    console.log("MongoDb connected");
});

app.use(express.json());
const userRoute = require("./routes/user");
const carRoute = require("./routes/car");

app.use("/user", userRoute);

app.use("/car", carRoute);

//const port = process.env.port || 5000;

app.route("/").get((req, res) => res.json("hello world"));

app.listen(5000, '10.6.198.36' || 'localhost', () => console.log('listening on port 5000'));