const sql = require("../db/init");
// const moment = require("moment");
// const passport = require("passport");]
const phil = require("phil-reg-prov-mun-brgy");
const passport = require("passport");
const zip = require("zipcodes-ph");
module.exports = {
  fetchEmployee: (req, res) => {
    sql("tbl_employee")
      .select()
      // .limit(10)
      .then((result) => {
        res.send(result);
        // console.log(result.length);
      });
  },
  calendarEvents: async (req, res) => {
    // console.log(req.session);

    await sql("tbl_events")
      .select()
      .then((result) => {
        let data = [];
        result.forEach((d) => {
          // console.log(moment(d.event_start).format('YYYY-MM-DD hh:mm:ss'))
          data.push({
            id: d.ID,
            title: d.event_title,
            start: d.event_start,
            end: d.event_end,
            extendedProps: {
              department: d.event_title,
            },
            description: d.event_title,
            allDay: false,
          });
        });
        res.send(data);
      });
  },
  addEventToCal: async (req, res) => {
    await sql("tbl_events")
      .insert({
        event_title: req.body.title,
        event_start: req.body.start,
        event_end: req.body.end,
      })
      .then((result) => {
        let data = [];
        result.forEach((d) => {
          data.push({
            id: d.ID,
            title: d.event_title,
            start: d.event_start,
            end: d.event_end,
          });
        });
        res.send(data);
      });
  },
  employeeCalendar: async (req, res) => {
    await sql
      .raw(
        `SELECT tbl_in.time_in, tbl_in.emp_fname, tbl_in.emp_empnum, tbl_out.emp_empnum, tbl_out.time_out \
     FROM 
     tbl_in INNER JOIN tbl_out 
     WHERE \
      tbl_in.emp_empnum = tbl_out.emp_empnum 
     AND
      DAYOFMONTH(tbl_in.time_in) = DAYOFMONTH(tbl_out.time_out) \
     AND 
      MONTH(tbl_in.time_in) = MONTH(tbl_out.time_out)`
      )
      .then((result) => {
        // console.log(result[0])
        let data = [];
        result[0].forEach((d) => {
          data.push({
            title: d.emp_fname,
            start: d.time_in,
            end: d.time_out,
            color: "#379237",
            allDay: false,
            extendedProps: {
              department: "IT",
            },
            description: "Attendance",
          });
        });
        // console.log(data)
        res.send(data);
      });
  },
  viewEmployee: async (req, res) => {
    // console.log(req.body);
    await sql("tbl_employee")
      .select()
      .where("emp_empnum", req.body.id)
      .then((result) => {
        // let newEntity = [];
        // result.forEach((d) => {
        //   newEntity.push({
        //     emp_fname: d.emp_fname,
        //     emp_mname: d.emp_mname,
        //     emp_lname: d.emp_lname,
        //     emp_sufix: d.emp_sufix,
        //     emp_gender: d.emp_gender,
        //     emp_cstatus: d.emp_cstatus,
        //     emp_bday: moment(d.emp_bday).format("LL"),
        //     emp_birthplace: d.emp_birthplace,
        //     emp_religion: d.emp_religion,
        //     emp_nationality: d.emp_nationality,
        //     emp_vaccine: d.emp_vaccine,
        //     emp_empnum: d.emp_empnum,
        //   });
        // });
        // console.log(newEntity[0]);
        res.send(result[0]);
        // res.redirect("/dashboard");
      });
  },
  viewAddress: async (req, res) => {
    await sql("tbl_address")
      .select()
      .where("emp_empnum", req.body.id)
      .then((result) => {
        // console.log(result[0]);
        res.send(result[0]);
      });
  },
  viewEducation: async (req, res) => {
    await sql("tbl_educational")
      .select()
      .where("emp_empnum", req.body.id)
      .then((result) => {
        // console.log(result[0]);
        res.send(result[0]);
        // console.log(req.passport);
      });
  },
  viewGov: async (req, res) => {
    // console.log(req.user);
    await sql("tbl_govdetails")
      .select()
      .where("emp_empnum", req.body.id)
      .then((result) => {
        // console.log(result[0]);
        res.send(result[0]);
      });
  },
  searchEmp: async (req, res) => {
    await sql("tbl_employee")
      .select()
      .where("emp_empnum", "like", `%${req.body.searchId}%`)
      .orWhere("emp_fname", "like", `%${req.body.searchId}%`)
      .orWhere("emp_mname", "like", `%${req.body.searchId}%`)
      .orWhere("emp_lname", "like", `%${req.body.searchId}%`)
      .then((result) => {
        res.send(result);
      })
      .catch((err) => {
        console.log(err);
      });
  },
  dataDelete: async (req, res) => {
    await sql("tbl_employee")
      .del()
      .where("emp_empnum", req.body.id)
      .then((result) => {
        // res.send([{ result }]);
        sql("tbl_address")
          .del()
          .where("emp_empnum", req.body.id)
          .then((result) => {
            sql("tbl_contact")
              .del()
              .where("emp_empnum", req.body.id)
              .then((result) => {
                sql("tbl_educational")
                  .del()
                  .where("emp_empnum", req.body.id)
                  .then((result) => {
                    sql("tbl_govdetails")
                      .del()
                      .where("emp_empnum", req.body.id)
                      .then((result) => {
                        res.send("Delete Success");
                      });
                  });
              });
          });
      });
  },
  showLoggedUser: async (req, res) => {
    res.send(req.user);
  },
  addEmployee: async (req, res) => {
    confirm.log(req.body.passport);
    // console.log(req.body.primarDetails.fname);
    res.send("data receive");
  },
  cityList: async (req, res) => {
    res.send(phil.provinces);
  },
  municipalList: async (req, res) => {
    let municipalities = phil.getCityMunByProvince(`${req.body.munipalcode}`);
    res.send(municipalities);
  },
  barangayList: async (req, res) => {
    // console.log(req.body);
    let barangays = phil.getBarangayByMun(`${req.body.barangay}`);
    res.send(barangays);
  },
  zipCode: async (req, res) => {
    // console.log(req.body);
    let zipcode = zip.default.reverse(`${req.body.data}`);
    res.send(zipcode);
  },
  // logIn: async (req, res, next) => {
  //   // passport.authenticate("local", {
  //   //   successRedirect: "/dashboard",
  //   //   failureRedirect: "/",
  //   //   failureFlash: true,
  //   // });
  //   // // console.log(req);
  //   // console.log(req.session.passport);
  //   // console.log(req.body);
  //   passport.authenticate("local", (err, user, info) => {
  //     if (err) {
  //       throw err;
  //     }
  //     if (!user) {
  //       res.send("no user");
  //     } else {
  //       req.login(user, (err) => {
  //         if (err) {
  //           throw err;
  //         }
  //         res.send("user logged");
  //       });
  //     }
  //   })(req, res, next);
  // },
  // getUser: async (req, res) => {
  //   console.log(req.user);
  // },
  // logout: async (req, res, next) => {
  //   // console.log(1)
  //   req.logout(function (err) {
  //     if (err) {
  //       return next(err);
  //     }
  //     res.redirect("/");
  //   });
  // },
};
