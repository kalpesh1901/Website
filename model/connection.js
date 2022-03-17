const mysql = require('mysql');
const con = mysql.createConnection({
    host:process.env.HOST || 'localhost',
    user:process.env.USER || 'root',
    password:process.env.PASSWORD || '',
    port:3306,
    database:process.env.DATABASE || 'test',
    multipleStatements: true
});

con.connect((err)=>{
    if (err) throw err;
    console.log('connected');
});

module.exports = con;