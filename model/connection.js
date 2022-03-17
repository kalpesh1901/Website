const mysql = require('mysql');
const con = mysql.createConnection({
    host:'my-test-database.cuvsibkjvg2u.us-east-1.rds.amazonaws.com',
    user:'admin',
    password:'0KnmAZlpMH4UT5AaEWTv',
    port:'3306',
    database:'ecommerce',
    multipleStatements: true
});

con.connect((err)=>{
    if (err) throw err;
    console.log('connected');
});

module.exports = con;