var db = require('../database/connection');

var Class={
	getAllClass:function(callback){
		return db.query("Select * from Classes",callback);
	},
	getClassById:function(id,callback){
		return db.query("Select * from Classes where class_id=?",[id],callback);
	},
	addClass:function(classes,callback){
		return db.query("Insert into Classes(class_id,name,teacher_id) values(?,?,?)",[classes.class_id,classes.name,classes.teacher_id],callback);
	},
	deleteClass:function(class_id,callback){
		return db.query("delete from Classes where class_id=?",[class_id],callback);
	},
	updateClass:function(id,classes,callback){
		return db.query("update class set name=?,class=?,dob=? where Id=?",[classes.name,classes.class,classes.dob,id],callback);
	}

};
 module.exports=Class;