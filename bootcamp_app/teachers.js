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

const cohortName = process.argv[2];

pool
  .query(
    `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
    FROM teachers
    JOIN assistance_requests ON teachers.id = teacher_id
    JOIN students ON students.id = student_id
    JOIN cohorts ON cohorts.id = cohort_id
    WHERE cohorts.name = '${cohortName}'
    ORDER BY teacher;`
  )
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${row.cohort} : ${row.teacher}`);
    });
  })
  .catch((err) => console.error('query error', err.stack));
