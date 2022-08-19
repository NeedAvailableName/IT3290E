var mysql=require('mysql');
const { connect } = require('../routes/admin');
var connection=mysql.createPool({
    host:'localhost',
    user:'root',
    password:'password',
    database:'attendancedb'
 
});
module.exports=connection;