module.exports = {
  db: {
    client: "mysql2",
    connection: {
      host: "localhost",
      user: "root",
      password: "admin",
      database: "db_dossier",
    },
    pool: {
      min: 0,
      max: 20,
    },
  },
};
