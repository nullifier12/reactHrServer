const express = require("express");

const cors = require("cors");

const passport = require("passport");

const router = require("./routes/route");

var bodyParser = require("body-parser");

const flash = require("express-flash");

const auth = require("./Auth/passport-config");
const session = require("express-session");

const cookie = require("cookie-parser");

const cookiesMiddleware = require("universal-cookie-express");
const app = express();

app.use(flash());
app.use(cookiesMiddleware());
app.use(
  session({
    secret: "shhhh",
    resave: true,
    rolling: true,
    saveUninitialized: false,
    // cookie: { expires: 300 * 1000 },
  })
);
// app.use(
//   cors({
//     origin: "http://119.81.209.6:8082",
//     // "http://localhost:3000/",
//     credentials: true,
//   })
// );
// app.use(cookie("shhhh"));

app.use(passport.initialize());
app.use(passport.session());
auth(passport);
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));

app.use(express.json());

app.use(router);

const port = 5000;
app.get("/data", (req, res) => {
  res.send("hi");
});
app.listen(port, () => {
  console.log(`Listening to port ${port}`);
});
module.exports = app;
