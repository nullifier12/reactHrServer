const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require("bcrypt");
const sql = require("../db/init");

// function initialize(passport, getUserByEmail, getUserById) {
//   console.log(1);
//   const authenticateUser = async (username, password, done) => {
//     console.log(1);
//     console.log("dad");
//     const user = getUserByEmail(username);
//     if (user == null) {
//       return done(null, false, { message: "Email not found" });
//     }
//     try {
//       let data = await bcrypt.compare(password, user.emp_password);
//       if (data) {
//         return done(null, user);
//       } else {
//         return done(null, false, { message: "Password incorrect" });
//       }
//     } catch (e) {
//       return done(e);
//     }
//   };
//   passport.use(new LocalStrategy({ usernameField: "email" }, authenticateUser));

//   passport.serializeUser((user, done) => done(null, user.emp_empnum));

//   passport.deserializeUser((emp_empnum, done) => {
//     return done(null, getUserById(emp_empnum));
//   });
// }

// module.exports = initialize;

module.exports = function (passport) {
  // let username = req.body.emp_email;
  passport.use(
    new LocalStrategy((username, password, done) => {
      sql("tbl_accounts")
        .where("emp_email", username)
        .then(async (result) => {
          if (result.length === 0) {
            return done(null, false);
          }
          await bcrypt.compare(password, result[0].emp_password).then((res) => {
            // console.log(res);
            if (res) {
              return done(null, result[0]);
            } else {
              return done(null, false);
            }
          });
        })
        .catch((err) => {
          console.log("this is done");
          console.log(err);
        });
    })
  );
  passport.serializeUser((user, done) => {
    // console.log(user.emp_empnum);
    done(null, user.emp_empnum);
  });
  passport.deserializeUser((emp_empnum, done) => {
    // console.log(emp_empnum);
    sql("tbl_accounts")
      .where("emp_empnum", emp_empnum)
      .then((result) => {
        // console.log(result);
        const infoOfUser = {
          id: result[0].emp_empnum,
          emp_email: result[0].emp_email,
          name: result[0].emp_fname,
        };
        done(null, infoOfUser);
      });
    // console.log("this is no error");
  });
};
