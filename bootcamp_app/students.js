const { Pool } = require('pg');

const pool = new Pool({
  user: 'elise',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
});

pool.connect(() => {
  console.log('connected to the db 🌈');
});

const queryString = `SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2`;
const cohort = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohort}%`, limit];

pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((rows) => {
      console.log(
        `${rows.name} has an id of ${rows.student_id} and was in the ${rows.cohort} cohort`
      );
    });
  })
  .catch((err) => console.error('query error', err.stack));
