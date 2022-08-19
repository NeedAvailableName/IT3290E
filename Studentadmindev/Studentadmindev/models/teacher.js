var db = require('../database/connection');

var Teacher={
	getAllTeacher:function(callback){
		return db.query("Select * from Teachers",callback);
	},
	getTeacherById:function(id,callback){
		return db.query("Select * from Teachers where Id=?",[id],callback);
	},
	addTeacher:function(teacher,callback){
		return db.query("Insert into Teachers(teacher_id,full_name,gender,phone_number,email,account_login,password_login) values(?,?,?,?,?,?,?)",[teacher.teacher_id,teacher.full_name,teacher.gender,teacher.phone_number,teacher.email, teacher.account_login,teacher.password_login],callback);
	},
	deleteTeacher:function(teacher_id,callback){
		return db.query("delete from Teachers where teacher_id=?",[teacher_id],callback);
	},
	updateTeacher:function(id,teacher,callback){
		return db.query("update Teachers set name=?,class=?,dob=? where Id=?",[teacher.name,teacher.class,teacher.dob,id],callback);
	}
};
module.exports= Teacher;