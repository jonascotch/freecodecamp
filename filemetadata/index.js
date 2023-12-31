const express = require("express");
const app = express();
const cors = require("cors");
const dotenv = require("dotenv");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });

dotenv.config({ path: "sample.env" });

app.use(cors());
//app.use("/public", express.static(process.cwd() + "/public"));
app.use(express.static("public"));
app.use(express.json());

app.get("/", function (req, res) {
  res.sendFile(process.cwd() + "/views/index.html");
});

app.post("/api/fileanalyse", upload.single("upfile"), (req, res) => {
  res.json({
    name: req.file.originalname,
    type: req.file.mimetype,
    size: req.file.size
  });
});

const port = process.env.PORT || 3000;

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log("Your app is listening on port " + listener.address().port);
});
