require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const app = express();
const dns = require("dns");
const mongoose = require("mongoose");

// Basic Configuration
const port = process.env.PORT || 3000;

const DB = process.env.DBURL.replace("<password>", process.env.DB_PASS);

const shortURLSchema = new mongoose.Schema({
  short_url: Number,
  original_url: String,
});

const Short_url = mongoose.model("short_url", shortURLSchema);

app.use(cors());

app.use("/public", express.static(`${process.cwd()}/public`));

app.use(bodyParser.urlencoded({ extended: false }));

// DB connection
mongoose.connect(DB).then(() => console.log("DB connected"));

app.get("/", function (req, res) {
  res.sendFile(process.cwd() + "/views/index.html");
});

// Your first API endpoint
app.get("/api/hello", function (req, res) {
  res.json({ greeting: "hello API" });
});

app.post("/api/shorturl", function (req, res) {
  var hostname = req.body.url.replace(/http?s:\/\//, "");
  hostname = hostname.replace(/\/.*$/, "");
  console.log(hostname);
  dns.lookup(hostname, (error, address, family) => {
    var length;
    if (error) {
      console.log(error);
      return res.json({ error: "Invalid URL" });
    }
    Short_url.findOne(
      { original_url: req.body.url },
      { original_url: 1, short_url: 1, _id: 0 }
    ).then((data) => {
      if (data) {
        return res.json(data);
      }
      Short_url.find().then((data) => {
        length = (data.length + 1) * 1;
        const newDocument = { original_url: req.body.url, short_url: length };
        Short_url.create(newDocument).then((data) => {
          console.log(data);
          return res.send(newDocument);
        });
      });
    });
  });
});

app.get("/api/shorturl/:id", function (req, res) {
  Short_url.findOne({ short_url: `${req.params.id}` }).then((data) => {
    res.status(301).redirect(`${data.original_url}`);

    //res.send(`You will be shown the website with short_url ${req.params.id}, whose original_url is ${data.original_url}`)
  });
});

app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});

// const length = await Short_url.find().length + 1 || 1;
// const newDocument = { original_url: req.body.url, short_url: length };
// return res.status(200).json(newDocument);
// return Short_url.find().then(data => res.send(`${data.length }`))}
