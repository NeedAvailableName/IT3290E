var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'databasese',
  multipleStatements: true

});

connection.connect((err)=>{
  if(!err)
  {
    console.log("connected");
  }else{
    console.log(err);
  }

});


module.exports = connection;