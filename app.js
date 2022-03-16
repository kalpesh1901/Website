if (process.env.NODE_ENV !== 'production'){
    require('dotenv').config()
}
// Defining the variables 
const express = require("express");
const path = require("path");
const app = express();
const passport = require('passport');
const flash = require('express-flash');
const session = require('express-session');
const cors= require('cors');

// Setting Up Static Folder for CSS and JAVASCRIPT
app.use(express.static(path.join(__dirname,"public")));
app.use("/user",express.static(path.join(__dirname,"public")));
app.use("/css",express.static(path.join(__dirname,"public/css")));
app.use("/js",express.static(path.join(__dirname,"public/js")));


// Setting Up Views And Templating Engine
app.set('views',path.join(__dirname,"views"));
app.set("view engine","ejs"); 
app.use(express.urlencoded({extended:false}))
app.use(session({
    secret:process.env.SESSION_SECRET,
    resave:true,
    saveUninitialized:true
}))
app.use(flash());

// Inirializing the passport for authenticating
app.use(passport.initialize());
app.use(passport.session());

//User authenticating session
app.use((req,res,next)=>{
    res.locals.userAuthenticated = req.isAuthenticated();
    next();
});


// Defining the routes variable 
const index = require('./routes/index');
const user = require('./routes/auth');
const brand = require('./routes/brand');
const addtocart = require('./routes/cart');
// const admin = require('./routes/admin');
const { Console } = require('console');
const { json } = require('body-parser');

// Appling the Routes
app.use('https://website-psi-wine-36.vercel.app/',index.router);
app.use('/user',user);
app.use('/brand',brand);
app.use('/addtocart',addtocart)
// app.use('/admin',admin);
app.use((req, res,next) =>{
    res.status(404).render('404');
    next();
});

// app.use(function(err, req, res, next){
//     res.sendStatus(500);
//     res.render('500');
    
// });

app.listen(process.env.PORT || 3000,(err)=>{
    var log = err ? `${err}`:`Port Listining at Port ${3000}`;
    console.log(log);
});
