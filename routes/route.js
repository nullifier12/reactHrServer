const express = require("express");

const adminController = require("../controllers/admin");

const router = express.Router();

const passport = require("passport");

const sql = require("../db/init");
const e = require("express");
// const initializePassport = require("../Auth/passport-config");
// sql("tbl_accounts")
//   .select()
//   .then((result) => {
//     initializePassport(
//       passport,
//       (username) => result.find((user) => user.emp_email === username),
//       (password) => result.find((user) => user.emp_empnum === password)
//     );
//   });

// function dummy(req, res, next) {
//   return next();
// }

function checkAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    // console.log("authenticated");
    return next();
  }
  req.universalCookies.remove("authCookie");
  res.redirect("/");
}

// function checkAuthenticated(req, res, next) {
//   if (req.isAuthenticated()) {
//     return next();
//   }
//   res.redirect("/adminLogin");
// }
// function checkNotAuthenticated(req, res, next) {
//   if (req.isAuthenticated()) {
//     console.log("authenticated");
//     return res.redirect("/dashboard/maindashboard");
//   } else {
//     console.log("not auth");
//     next();
//   }
// }

// router.route("/adminLogin").post(
//   passport.authenticate("local", {
//     successRedirect: "/dashboard",
//     failureRedirect: "/",
//     failureFlash: true,
//   })
// );
// router.route("/adminInfo").get(dummy, adminController.getUser);
router.route("/adminLogin").post((req, res, next) => {
  passport.authenticate("local", (err, user, info) => {
    if (err) {
      throw err;
    }
    if (!user) {
      res.send(user);
    } else {
      req.login(user, (err) => {
        if (err) {
          throw err;
        }
        res.status(200).send("logged");
        // console.log(req.session);
      });
    }
  })(req, res, next);
});
// router.route("/adminLogin").post(checkNotAuthenticated, adminController.logIn);
router
  .route("/getUserLogged")
  .get(checkAuthenticated, adminController.showLoggedUser);
router
  .route("/employee")
  .get(checkAuthenticated, adminController.fetchEmployee);
router.route("/events").get(checkAuthenticated, adminController.calendarEvents);
router
  .route("/addEvent")
  .post(checkAuthenticated, adminController.addEventToCal);
router
  .route("/employeeAttendance")
  .get(checkAuthenticated, adminController.employeeCalendar);
router
  .route("/employeeInformation")
  .post(checkAuthenticated, adminController.viewEmployee);
router
  .route("/employeeAddress")
  .post(checkAuthenticated, adminController.viewAddress);
router
  .route("/employeeEducation")
  .post(checkAuthenticated, adminController.viewEducation);
router
  .route("/employeeGovdetails")
  .post(checkAuthenticated, adminController.viewGov);
router.route("/addEmp").post(checkAuthenticated, adminController.addEmployee);
router.route("/delete").post(checkAuthenticated, adminController.dataDelete);
router.route("/search").post(checkAuthenticated, adminController.searchEmp);
router.route("/city").get(checkAuthenticated, adminController.cityList);
router
  .route("/getMunicipal")
  .post(checkAuthenticated, adminController.municipalList);
router
  .route("/barangay")
  .post(checkAuthenticated, adminController.barangayList);
router.route("/getzip").post(checkAuthenticated, adminController.zipCode);
// router.route("/logOut").post(dummy, adminController.logout);

module.exports = router;
