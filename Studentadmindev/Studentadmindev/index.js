const express = require("express")

const app = express()

const mysql = require('mysql');


const adminroute = require('./routes/admin');

const bodyParser = require('body-parser')



// set view engine
app.set('view engine','ejs')
app.use(express.json())
app.use(bodyParser.urlencoded({extended: true}));

app.use(express.static(__dirname));

// create server
app.listen(3000,()=>{
    console.log("hello my friend")
})

// create database connection


//const con = mysql.createConnection({
//    host: "localhost",rs
//    user: "root",
//    password: "Ntk1412@ntk",
//    database: "studentadmin"
//  });

//con.connect(function(err) {
//    if (err) throw err;
//    console.log("Connected!!!")
//});

app.use('/admin',adminroute);