const mysql = require('mysql');
const con = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    port:3306,
    database:'test',
    multipleStatements: true
});

con.connect((err)=>{
    if (err) throw err;
    console.log('connected');
});

module.exports = con;