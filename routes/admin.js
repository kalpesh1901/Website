const router = require("express").Router();
const passport = require('passport');
const localStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt');
const con = require('../model/connection');

passport.serializeUser((user,done)=> {
    done(null,user.id)
})
passport.deserializeUser((id,done)=> {
    con.query("select * from me_admin where id = ?",[id],(err,user)=>{
        if (err){
            return done(err)
        }else{
            return done(null,user[0]);
        }
    })
})

passport.use(new localStrategy({usernameField:'email',passReqToCallback: true},(req,email,password,done)=>{
    if(email == '' || password == ''){
        return done(null,false,req.flash("loginMessage","All fields are require!"))
    }
    con.query('select * from me_admin where admin_email = ?',[email],async (err,ress)=>{
        if(!ress.length){
            console.log('No Such user');
            return done(null,false,req.flash("loginMessage","No Such Email Address Found"));
        }
        try{
            if(await bcrypt.compare(password,ress[0].admin_password)){
                return done(null,ress[0])
            }
            else{ 
                console.log('Password no match');
                return done(null,false,req.flash("loginMessage","Wrong User Password"));
            }
        }catch(e){
            console.log(e);
        }
        
    })
}))



router.get('/me-admin',async (req,res)=>{
    res.render("admin-login");
})

router.post('/me-admin',(req,res,next)=>{
    if(req.body.email == '' || req.body.password == ''){
        req.flash("loginMessage","All fiels are require")
        res.render('admin-login',{message:"All fields are require"});
    }else{
        passport.authenticate( {
        successRedirect: '/admin/me-dashboard',
        failureRedirect: '/admin/me-admin',
        failureFlash: true
    })(req,res,next)}
});

router.get('/me-dashboard',(req,res)=>{
    res.send("Hello Admin");
})

module.exports =router;
// blacktop007711