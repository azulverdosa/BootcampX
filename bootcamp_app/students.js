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

const cohort = process.argv[2];
const limit = process.argv[3];

pool
  .query(
    `SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
        FROM students
        JOIN cohorts ON cohorts.id = cohort_id
        WHERE cohorts.name LIKE '%${cohort}%'
        LIMIT ${limit};`
  )
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`
      );
    });
  })
  .catch((err) => console.error('query error', err.stack));
