const axios = require("axios");
require("dotenv").config();

module.exports = function (req, res, next) {
    var company = req.query.company;

    axios({
        method: "GET",
        url: "https://www.alphavantage.co/query",
        headers: {
            "content-type": "application/octet-stream",
            useQueryString: true,
        },
        params: {
            symbol: company,
            function: "GLOBAL_QUOTE",
            apikey: process.env.API_KEY,
        },
    })
        .then((response) => {
            return res.status(200).json(response.data);
        })
        .catch((error) => {
            return res.status(400).json(error);
        });
};
