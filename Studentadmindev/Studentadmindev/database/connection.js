var mysql=require('mysql');
const { connect } = require('../routes/admin');
var connection=mysql.createPool({
    host:'localhost',
    user:'root',
    password:'password',
    database:'studentadmin'
 
});
module.exports=connection;