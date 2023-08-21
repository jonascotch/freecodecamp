// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
app.get("/api/hello", function (req, res) {
  res.json({greeting: 'hello API'});
});

app.get("/api/", function(req, res){

  let today = Date.now()

  let date = new Date(today)
  
    res.json({unix: today, "utc": date.toUTCString()})
})

app.get("/api/:date?", function(req, res){
  let dateValue = req.params.date;

  let realDate = new Date(dateValue)

  if (!realDate.getFullYear()){
    realDate = new Date(parseInt(dateValue))
  }
  console.log(dateValue.length);

  if (!realDate.getFullYear()){
    res.json({error:"Invalid Date"})
  } else {
    let unixDate = new Date(realDate).getTime()
 res.json({"unix": unixDate , "utc": realDate.toUTCString()});    
  }  
});

// listen for requests :)
var listener = app.listen(process.env.PORT, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
