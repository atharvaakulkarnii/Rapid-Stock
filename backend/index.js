const express = require("express");
const bodyParser = require("body-parser");
require("dotenv").config();

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const getData = require("./controllers/getdata.js");

app.get("/", (req, res) => {
    res.send("STOCK data APP");
});

app.get("/getdata", getData);
const PORT = process.env.PORT || 3000;
app.listen(PORT);
