var express = require('express');
var router = express.Router();
var Class = require('../models/class');
var Teacher = require('../models/teacher');
var Student = require('../models/student');
var Parent = require('../models/parent');


router.get('/',(req,res)=>{
    res.render("adminpage/adminpage")
})

router.get('/classview',(req,res)=>{
   Class.getAllClass((err,rows)=>{
    if(err){
        res.json(err);
    } else {
        res.render('classview/classview',{classes:rows})
    }
   })
    
})

router.get('/classadmin',(req,res)=>{
    res.render('classadminpage/classadminpage')
})

router.get('/createClass',(req,res)=>{
    res.render("addclass/addclass")
})
router.post('/createClass',(req,res)=>{
    const newClass = {
        class_id:req.body.class_id,
        name:req.body.name,
        teacher_id:req.body.teacher_id
    }
    
    Class.addClass(newClass,(err,rows)=>{
        if(err){
            res.redirect("/admin/classadmin/?validate=teacher")
        }
        else{
            res.redirect("/admin/classadmin")
        }
    })
})
router.post('/deleteClass',(req,res)=>{
    Class.deleteClass(req.body.class_id,(err,rows)=>{
        if(err){
            res.json(err)
        }else{
            res.redirect("/admin/classadmin")
        }
    })
})


router.get('/teacher',(req,res)=>{
    res.render('Teacher/Default/default')
})

router.get('/teacher/View',(req,res) => {
    Teacher.getAllTeacher((err,rows) => {
        if(err){
            res.json(err);
        } else {
            res.render('Teacher/View/tView',{teachers:rows})
        }
    })
})
router.get('/teacher/create',(req,res)=>{
    res.render("Teacher/Add/add")
})
router.post('/teacher/create',(req,res)=>{
    const newTeacher = {
        teacher_id:req.body.teacher_id,
        full_name:req.body.name,
        gender:req.body.gender,
        phone_number:req.body.phone_number,
        email:req.body.email,
        account_login:req.body.account,
        password_login:req.body.password_login
    }
    
    Teacher.addTeacher(newTeacher,(err,rows)=>{
        if(err){
            res.redirect("/admin/classadmin/?validate=teacher")
        }
        else{
            res.redirect("/admin/teacher")
        }
    })
})

router.post('/deleteTeacher',(req,res)=>{
    Teacher.deleteTeacher(req.body.teacher_id,(err,rows)=>{
        if(err){
            res.json(err)
        }else{
            res.redirect("/admin/classadmin")
        }
    })
})


router.get('/student',(req,res)=>{
    res.render('Student/Default/default')
})
router.get('/student/View',(req,res) => {
    Student.getAllStudent((err,rows) => {
        if(err){
            res.json(err);
        } else {
            res.render('Student/View/sView',{student:rows})
        }
    })
})

router.get('/student/create',(req,res)=>{
    res.render("Student/Add/add")
})
router.post('/student/create',(req,res)=>{
    const newStudent = {
        student_id:req.body.student_id,
        full_name:req.body.full_name,
        gender:req.body.gender,
        adderss:req.body.adderss,
        parent_id:req.body.parent_id,
        class_id:req.body.class_id
    }
    
    Student.addStudent(newStudent,(err,rows)=>{
        if(err){
            res.redirect("/admin/classadmin/?validate=teacher")
        }
        else{
            res.redirect("/admin/student")
        }
    })
})

router.post('/deleteStudent',(req,res)=>{
    Student.deleteStudent(req.body.student_id,(err,rows)=>{
        if(err){
            res.json(err)
        }else{
            res.redirect("/admin/classadmin")
        }
    })
})

router.get('/editClass/:id',(req,res)=>{
    Class.getClassById(req.params.id,(err,rows)=>{
        if(err){
            res.json(err);
        } else {
            res.render('classview/edit',{class:rows})
        }
    })  
})

router.get('/parent',(req,res)=>{
    res.render('Parent/Default/default')
})
router.get('/parent/View',(req,res) => {
    Parent.getAllParent((err,rows) => {
        if(err){
            res.json(err);
        } else {
            res.render('Parent/View/pView',{parent:rows})
        }
    })
})

router.get('/parent/create',(req,res)=>{
    res.render("Parent/Add/add")
})
router.post('/parent/create',(req,res)=>{
    const newParent = {
        parent_id:req.body.parent_id,
        father_name:req.body.father_name,
        mother_name:req.body.mother_name,
        father_phone:req.body.father_phone,
        mother_phone:req.body.mother_phone,
        account_login:req.body.account_login,
        password_login:req.body.password_login
    }
    
    Parent.addParent(newParent,(err,rows)=>{
        if(err){
            res.redirect("/admin/classadmin/?validate=teacher")
        }
        else{
            res.redirect("/admin/parent")
        }
    })
})

router.post('/deleteParent',(req,res)=>{
    Parent.deleteParent(req.body.parent_id,(err,rows)=>{
        if(err){
            res.json(err)
        }else{
            res.redirect("/admin/classadmin")
        }
    })
})

module.exports= router