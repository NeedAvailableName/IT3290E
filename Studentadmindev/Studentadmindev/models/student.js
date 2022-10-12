var db = require('../database/connection');

var Student={
	getAllStudent:function(callback){
		return db.query("Select * from Students",callback);
	},
	getStudentById:function(id,callback){
		return db.query("Select * from Students where Id=?",[id],callback);
	},
	addStudent:function(student,callback){
		return db.query("Insert into Students(student_id,full_name,gender,address,parent_id,class_id) values(?,?,?,?,?,?)",[student.student_id,student.full_name,student.gender,student.adderss,student.parent_id,student.class_id],callback);
	},
	deleteStudent:function(student_id,callback){
		return db.query("delete from Students where student_id=?",[student_id],callback);
	},
	updateTeacher:function(id,teacher,callback){
		return db.query("update Teachers set name=?,class=?,dob=? where Id=?",[teacher.name,teacher.class,teacher.dob,id],callback);
	}
};
module.exports= Student;