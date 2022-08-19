var db = require('../database/connection');

var Parent={
	getAllParent:function(callback){
		return db.query("Select * from Parents",callback);
	},
	getParentById:function(id,callback){
		return db.query("Select * from Parents where parent_id=?",[id],callback);
	},
	addParent:function(parent,callback){
		return db.query("Insert into Parents(parent_id,father_name,mother_name,father_phone,mother_phone,account_login,password_login) values(?,?,?,?,?,?,?)",[parent.parent_id,parent.father_name,parent.mother_name,parent.father_phone,parent.mother_phone,parent.account_login,parent.password_login],callback);
	},
	deleteParent:function(parent_id,callback){
		return db.query("delete from Parents where parent_id=?",[parent_id],callback);
	},
	updateTeacher:function(id,teacher,callback){
		return db.query("update Teachers set name=?,class=?,dob=? where Id=?",[teacher.name,teacher.class,teacher.dob,id],callback);
	}
};
module.exports= Parent;