const express = require("express");
const app = express();
const cors = require("cors");
const User = require("./models/user");
const Exercise = require("./models/exercise");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config({ path: "./sample.env" });

const DB = process.env.DB_URI.replace("<password>", process.env.DB_PASS);

mongoose
  .connect(DB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("Database connection OK"));

app.use(cors());
app.use(express.static("public"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/views/index.html");
});

app.post("/api/users", async (req, res) => {
  const exists = await User.find({ username: req.body.username }).select({
    __v: false,
  });
  if (exists.length > 0) return res.status(200).json(exists);

  const data = await User.create({ username: req.body.username });
  res.status(200).json({
    username: data.username,
    _id: data.id,
  });
});

app.get("/api/users", async (req, res) => {
  const data = await User.find().select({ __v: false });
  res.status(200).send(data);
});

app.post("/api/users/:id/exercises", async (req, res) => {
  const user = await User.findById(req.params.id);
  req.body.userid = req.params.id;

  if (!req.body.date) {
    req.body.date = new Date(Date.now());
  } else {
    req.body.date = new Date(req.body.date);
  }
  const newExercise = await Exercise.create(req.body);

  res.status(200).json({
    username: user.username,
    description: newExercise.description,
    duration: newExercise.duration,
    date: new Date(newExercise.date).toDateString(),
    _id: user.id,
  });
});

app.get("/api/users/:id/logs", async (req, res) => {
  // const log = await Exercise.find({
  //   userid: req.params.id,
  //   date: { $gte: req.query.from },
  // })
  //   .select({ _id: false, userid: false, __v: false })
  //   .limit(req.query.limit);
  var query;

  if (req.query.from && req.query.to) {
    query = Exercise.find({
      userid: req.params.id,
      date: { $gte: new Date(req.query.from), $lte: new Date(req.query.to) },
    })
      .select({ _id: false, userid: false, __v: false })
      .limit(req.query.limit);
  } else if (req.query.from) {
    query = Exercise.find({
      userid: req.params.id,
      date: { $gte: new Date(req.query.from) },
    })
      .select({ _id: false, userid: false, __v: false })
      .limit(req.query.limit);
  } else if (req.query.to) {
    query = Exercise.find({
      userid: req.params.id,
      date: { $lte: new Date(req.query.to) },
    })
      .select({ _id: false, userid: false, __v: false })
      .limit(req.query.limit);
  } else {
    query = Exercise.find({
      userid: req.params.id,
    })
      .select({ _id: false, userid: false, __v: false })
      .limit(req.query.limit);
  }

  var log = await query.exec();
  const user = await User.findById(req.params.id);
  const newLog = log.map( el =>  ({description: el.description, date:  new Date(el.date).toDateString(), duration: el.duration}));

  res.json({
    username: user.username,
    count: log.length,
    _id: req.params.id,
    log: newLog,
  });
});

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log("Your app is listening on port " + listener.address().port);
});
