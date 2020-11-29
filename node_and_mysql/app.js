// Root User: root
// Database Name: mysql
const faker = require('faker');  // https://github.com/marak/Faker.js/
const mysql = require('mysql');  // https://github.com/mysqljs/mysql

const connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'JOINUS'
});

// let q = 'SELECT CURDATE()';
// q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() AS now';
// q = 'SELECT COUNT(*) AS total FROM users';
// connection.query(q, function(err, results, fields) {
// 	if (err) throw err;
// 	console.log(results[0].total);
// });

// let person = {
// 	email: faker.internet.email(),
// 	created_at: faker.date.past(),
// };
// connection.query('INSERT INTO users SET ?', person, function(err, res) {
// 	if (err) throw err;
// 	console.log(res);
// });

// INSERTING multiple users
// let data = [
//     ['blah@gmail.com', '2017-05-01 03:51:37'],
//     ['ugh@gmail.com', '2017-05-01 03:51:37'],
//     ['meh@gmail.com', '2017-05-01 03:51:37']
// ];

// connection.query(q, [data], function(err, result) {
//   console.log(err);
//   console.log(result);
// });

// let data = [];
// for (let i = 0; i < 500; i++) {
// 	data.push([faker.internet.email(), faker.date.past()]);
// }
// let q = 'INSERT INTO users (email, created_at) VALUES ?';
// connection.query(q, [data], function(err, result) {
//   console.log(err);
//   console.log(result);
// });

// close the connection
connection.end();

// faker.internet.email();
// faker.date.past();
// faker.address.streetAddress();
// faker.address.city();
// faker.address.state();