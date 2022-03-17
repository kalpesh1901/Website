// Company Image Dimention 1600 X 350
const router = require("express").Router();
const passport = require('passport');
const localStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt');
const alreadyAuthenticated = require('../function/functions').alreadyAuthenticated;
const isAdmin = require('../function/functions').isAdmin;
const con = require('../model/connection');
const async = require('async');
const multer  = require('multer');
const path = require('path');
const fs = require('fs');

const companys =  require('./index')



passport.serializeUser((user,done)=> {
    if(user.role == 'user'){
        done(null,user)
    }else if(user.role == 'admin'){
        done(null,user)
    }else{
        console.log('Somethin went wrong');
    }
    
})
passport.deserializeUser((user,done)=> {
    if(user.role =='user'){
        con.query("select * from user where id = ?",[user.id],(err,users)=>{
            if (err){
                return done(err)
            }else{
                return done(null,users[0]);
            }
        })
    }else if(user.role == 'admin'){
        con.query("select * from me_admin where id = ?",[user.id],(err,users)=>{
            if (err){
                return done(err)
            }else{
                return done(null,users[0]);
            }
        })
    }
})

passport.use('local',new localStrategy({usernameField:'email',passReqToCallback: true},(req,email,password,done)=>{
    if(email == '' || password == ''){
        return done(null,false,req.flash("loginMessage","All fields are require!"))
    }
    con.query('select * from user where e_mail = ?',[email],async (err,ress)=>{
        if(!ress.length){
            console.log('No Such user');
            return done(null,false,req.flash("loginMessage","No Such Email Address Found"));
        }
        try{
            if(await bcrypt.compare(password,ress[0].password)){
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


// aDMIN
passport.use('admin',new localStrategy({usernameField:'email',passReqToCallback: true},(req,email,password,done)=>{
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

// Ajax URL for dropdown of country and state and City

con.query("select id,name from countries",(err,country)=>{
    global.country = country
});

  
// GET URL of the Login & Register Page

router.get('/login', alreadyAuthenticated, (req, res) => {
    var loginError = req.flash("loginMessage");
    res.render('login',{message:loginError[0]});
});

router.get('/register', alreadyAuthenticated, (req, res) => {
    res.render('register');
});

// =============================================

// POST URL for Login & Register Page

router.post('/login', alreadyAuthenticated,(req,res,next)=>{
    if(req.body.email == '' || req.body.password == ''){
        req.flash("loginMessage","All fiels are require")
        res.render('login',{message:"All fields are require"});
    }else{
    passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/user/login',
    failureFlash: true
})(req,res,next)}
});

router.post('/register', alreadyAuthenticated, async (req, res) => {
    try {
        const hashpaswd = await bcrypt.hash(req.body.password, 10);
        const name = req.body.firstname + " " + req.body.lastname;
        const email = req.body.email;
        const mobile_no = req.body.mobilenumber;
        const password = req.body.password;
        const address = req.body.address1 + ":" + req.body.address2;
        const country = req.body.country;
        const state = req.body.state;
        const city = req.body.city;
        const zip = req.body.zipcode;
        con.query('Select count(*) as cnt from user where e_mail = ?',[email],(err,data)=>{
            if (err) throw err
            if(data[0].cnt >0){
                console.log('email Alrady exist');
                req.flash('danger', `Email given by you already exist!!`);
                res.render('register',
                    {
                        firstname:req.body.firstname,
                        lastname:req.body.lastname,
                        mobilenumber:req.body.mobilenumber,
                        password,
                        confirmpassword:req.body.confirmpassword,
                        address1:req.body.address1,
                        address2:req.body.address2,
                        city,
                        zipcode:req.body.zipcode
                    }
                );
            }
            else if (req.body.firstname == '' || req.body.lastname == '' || email == '' || mobile_no == '' || password == '' || req.body.confirmpassword == '' || address == '' || country == '' || state == '' ||  city == '' || zip === '') {
                req.flash('danger', `All is required!!`)
                res.render('register',
                {
                    firstname:req.body.firstname,
                    lastname:req.body.lastname,
                    email,
                    mobilenumber:req.body.mobilenumber,
                    password,
                    confirmpassword:req.body.confirmpassword,
                    address1:req.body.address1,
                    address2:req.body.address2,
                    city,
                    zipcode:req.body.zipcode
                });
            } else if (password !== req.body.confirmpassword) {
                req.flash('danger', `Password and confirm field does not Match!!`)
                res.render('register',
                {
                    firstname:req.body.firstname,
                    lastname:req.body.lastname,
                    email,
                    mobilenumber:req.body.mobilenumber,
                    address1:req.body.address1,
                    address2:req.body.address2,
                    city,
                    zipcode:req.body.zipcode
                });
            } else if (password.length < 6) {
                req.flash('danger', `Length of your password should be greater than 6`)
                res.render('register',
                {
                    firstname:req.body.firstname,
                    lastname:req.body.lastname,
                    email,
                    mobilenumber:req.body.mobilenumber,
                    address1:req.body.address1,
                    address2:req.body.address2,
                    city,
                    zipcode:req.body.zipcode
                });
            } 
            else {
                con.query('insert into user (e_mail,password,user_name,mobile_no,address,country,state,city,zip) values(?,?,?,?,?,?,?,?,?)', 
                [email, hashpaswd, name, mobile_no, address, country, state, city,zip], 
                (err, result) => {
                    if (err) throw err
                })
                req.flash('info', 'Welcome');
                res.redirect("/user/login");
            }
        })
    } 
    catch {
        res.redirect('/user/register');
    }
});

// ==================================================

router.get('/current_user',(req,res)=>{
    res.send(req.user);
});

// 0000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000000
router.get('/me-admin',async (req,res)=>{
    res.render("admin-login");
})
  
router.post('/me-admin',(req,res,next)=>{
    if(req.body.email == '' || req.body.password == ''){
        req.flash("loginMessage","All fiels are require")
        res.render('admin-login',{message:"All fields are require"});
    }else{
        passport.authenticate('admin', {
        successRedirect: '/user/me-dashboard',
        failureRedirect: '/user/me-admin',
        failureFlash: true
    })(req,res,next)}
});

router.get('/me-dashboard',isAdmin,(req,res)=>{
    async.parallel({
        Orders:(callback)=>{
            con.query('SELECT `user_orders`.`order_id`,`user`.`user_name`,`user_orders`.`user_mobile`,`user_orders`.`order_amount`,`user_orders`.`status` from `user_orders`'+""+ 
            'INNER JOIN `user` on `user_orders`.`user_id` = `user`.`id` ORDER BY `user_orders`.`order_id` DESC',(err,order)=>{
                callback(null,order);
            })
        },
        pending:(callback)=>{
            con.query('Select count(status) as pendingStatus from `user_orders` where status = "Pending"',(err,pendings)=>{
                callback(null,pendings);
            })
        },
        preparing:(callback)=>{
            con.query('Select count(status) as preparingStatus from `user_orders` where status = "Preparing"',(err,preparing)=>{
                callback(null,preparing);
            })
        },
        dispatched:(callback)=>{
            con.query('Select count(status) as dispatchStatus from `user_orders` where status = "Dispatched"',(err,dispatched)=>{
                callback(null,dispatched);
            })
        },
        delivered:(callback)=>{
            con.query('select count(status) as deliveredStatus from user_orders where status = "Delivered"',(err,deliver)=>{
                callback(null,deliver);
            })
        },
        usercount:(callback)=>{
            con.query('select count(id) as usercount from user',(err,userCount)=>{
                callback(null,userCount);
            })
        },
        totalorder:(callback)=>{
            con.query('select count(order_id) as totalorder from user_orders',(err,totalOrder)=>{
                callback(null,totalOrder);
            })
        },
        totalproduct:(callback)=>{
            con.query('select count(product_id) as totalproduct from product',(err,totalProduct)=>{
                callback(null,totalProduct);
            })
        },
        totalcompany:(callback)=>{
            con.query('select count(id) as totalcompany from company',(err,totalCompany)=>{
                callback(null,totalCompany);
            })
        },
        enquiry:(callback)=>{
            con.query('select * from enquiry ORDER BY `enquiry`.`enquiry_id` DESC ',(err,enquiry)=>{
                callback(null,enquiry);
            })
        },
        country:(callback)=>{
            con.query('select * from countries',(err,country)=>{
                callback(null,country);
            })
        }
    },(err,result)=>{
        res.render('dashboard',{result:result});
    })
})

router.get('/order-details/:username/:orderid',isAdmin,(req,res)=>{
    console.log(req.params.username,req.params.orderid);
    let username = req.params.username;
    let order_id = req.params.orderid;

    async.parallel({
        details:(callback)=>{
            con.query('SELECT `user_orders`.`status`,`user`.`user_name`,`user_orders`.`purchaseTime`,`user_orders`.`status`,`user_orders`.`shipping_address`,`user_orders`.`user_email`,`user_orders`.`user_mobile`,`user_orders`.`order_amount` '+""+
            ',`user_orders`.`country`,`user_orders`.`state`,`user_orders`.`city`,`user_orders`.`zipcode` FROM `user_orders` INNER JOIN `user` on `user_orders`.`user_id` = `user`.`id` WHERE `user_orders`.`order_id` = ?',[order_id],(err,result)=>{
                if (err) throw err;
                callback(null,result);
            })
        },
        order_details:(callback)=>{
            con.query('SELECT `order_details`.`order_id`,`order_details`.`item_name`,`order_details`.`item_size`,`order_details`.`item_cost`,`order_details`.`item_qty` '+""+
            'from `order_details` WHERE `order_details`.`order_id` = ?',[order_id],(err,result)=>{
                console.log(result);
                if (err) throw err;
                callback(null,result)
            })
        }
    },(err,fullDetails)=>{
        console.log(fullDetails.details[0].purchaseTime)
        res.render('admin-order-details',{fullDetails:fullDetails});
    })
})

router.post('/sortBy-order',(req,res)=>{
    let orderID = "%"+req.body.orderID+"%";
    con.query('SELECT `user_orders`.`order_id`,`user`.`user_name`,`user_orders`.`user_mobile`,`user_orders`.`order_amount`,`user_orders`.`status` from `user_orders`'+""+ 
            'INNER JOIN `user` on `user_orders`.`user_id` = `user`.`id` where `user_orders`.`order_id` LIKE ? OR `user`.`user_name` LIKE ? OR `user_orders`.`status` LIKE ? ORDER BY `user_orders`.`order_id` DESC',[orderID,orderID,orderID],(err,order)=>{
                if(err) throw err
                res.send(order);
            })
})

router.post('/sortBy-enquiry',(req,res)=>{
    let enquiry = "%"+req.body.enquiry+"%";
    con.query('SELECT `enquiry`.`enquiry_id`,`enquiry`.`fullname`,`enquiry`.`email`,`enquiry`.`subject`,`enquiry`.`description` from `enquiry`'+""+ 
            'where `enquiry`.`enquiry_id` LIKE ? OR `enquiry`.`fullname` LIKE ? OR `enquiry`.`subject` LIKE ? OR `enquiry`.`email` LIKE ? ORDER BY `enquiry`.`enquiry_id` DESC',[enquiry,enquiry,enquiry,enquiry],(err,searchEnquiry)=>{
                if(err) throw err
                res.send(searchEnquiry);
            })
})

router.post('/sortBy-country',(req,res)=>{
    let country = "%"+req.body.country+"%";
    con.query('SELECT `countries`.`id`,`countries`.`countrycode`,`countries`.`name`,`countries`.`phonecode`,`countries`.`first_250_gm`,`countries`.`above_250_gm` from `countries`'+""+ 
            'where `countries`.`countrycode` LIKE ? OR `countries`.`name` LIKE ? OR `countries`.`first_250_gm` LIKE ? OR `countries`.`above_250_gm` LIKE ? OR `countries`.`phonecode` LIKE ? ORDER BY `countries`.`id` ASC',[country,country,country,country,country],(err,searchCountry)=>{
                if(err) throw err
                res.send(searchCountry);
            })
})

router.get('/country-details/:id',(req,res)=>{
    con.query('select * from countries where id = ?',[req.params.id],(err,result)=>{
        res.render('admin-update-country',{result});
    })
    
})

router.post('/update-country/:id',(req,res)=>{
    let{countryname,first250gm,above250gm} = req.body;
    con.query('update `countries` set `name` = ?,`first_250_gm` = ?,`above_250_gm`=? where `id` = ?',[countryname,first250gm,above250gm,req.params.id],(err,result)=>{
        if (err) throw err;
        res.redirect('http://localhost:3000/user/me-dashboard');
    })
})

router.post('/update-status',(req,res)=>{
    let orderID = req.body.orderID;
    let status = req.body.status;
    con.query('Update `user_orders` set `user_orders`.`status` = ? where `user_orders`.`order_id` = ?',[status,orderID],(err,result)=>{
        console.log(result);
        res.send("Preparing Order");
    })
});

router.get('/add-company',(req,res)=>{
    con.query("select `id`,`companyName`,`companyDescription`,`companyImage` from company",(err,result)=>{
        res.render('admin-add-company',{
            companyList:result
        })
    })
    
})

router.get('/add-product',(req,res)=>{
    con.query("Select `product_id`,`product_name`,`product_description`,`product_indication`,`product_ingredient`,`product_dosage`,`product_img` from product",(err,result)=>{
        res.render('admin-add-product',{
            productList:result
        })
    })  
})

router.get('/add-product-variant',(req,res)=>{
    async.parallel({
        productName:(callback)=>{
            con.query('select `product_id`,`product_name` from `product`',(err,result)=>{
                callback(null,result)
            })
        },
        productList:(callback)=>{
            con.query('SELECT `product`.`product_name`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram`,`product_pkg`.`product_unquie_id` from `product_pkg` INNER JOIN  `product` WHERE `product_pkg`.`parent_product_id` = `product`.`product_id`',(err,result)=>{
                callback(null,result)
            })
        }
    },(err,finalCall)=>{
        res.render('admin-add-product-variant',{finalCall:finalCall})
    })
})

router.get('/update-company/:id',(req,res)=>{
    let updateQuery = 'select `companyName`,`companyDescription`,`companyImage` from company where `id` = ?';
    con.query(updateQuery,[req.params.id],(err,result)=>{
        res.render('admin-update-company',{
            data:result,
            id:req.params.id
        })
    })   
})

router.get('/update-product/:id',(req,res)=>{
    con.query('select `product_name`,`product_description`,`product_indication`,`product_ingredient`,`product_dosage` from product where `product_id`=?',[req.params.id],(err,result)=>{
        res.render('admin-update-product',{
            data:result,
            id:req.params.id
        })
    })
})

router.get('/update-product-variant/:productName/:id',(req,res)=>{
    con.query('select `product_size`,`product_price`,`product_weight_gram`,`product_unquie_id` from `product_pkg` where `product_pkg_id` = ?',[req.params.id],(err,result)=>{
        res.render('admin-update-product-variant',{
            data:result,
            id:req.params.id,
            name:req.params.productName
        })
    })    
})

const storage = multer.diskStorage({
    destination: './public/images/COMPANY/',
    filename: function(req,file,cb){
        cb(null,file.originalname)
    }
})

const upload = multer({
    storage:storage,
    limits:{fileSize:100000},
    fileFilter:function(req,file,cb){
        checkFileType(file,cb)
    }
}).single('ImageFile')

const productStorage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, './public/images/')
    },
    filename:function(req,file,cb){
        cb(null,file.originalname)
    }
})

const productUpload = multer({
    storage:productStorage,
    limits:{fileSize:1000000},
    fileFilter:function(req,file,cb){
        checkFileType(file,cb)
    }
}).single('PImage');

function checkFileType(file,cb){
    const filetypes = /jpeg|jpg|png/;
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = filetypes.test(file.mimetype);
    if(mimetype && extname){
        return cb(null,true)
    }else{
        cb("Error: Upload Only Images! ");
    }
     
}

router.post('/add-company',(req,res)=>{
    upload(req,res,(err)=>{
        if (err) throw err
        else{
            let companyName = req.body.companyName.toUpperCase();
            let companyDesc = req.body.companyDesc;
            let ImagePath = '/images/COMPANY/'+req.file.originalname;
            let folderPath = './public/images/'+companyName;
            con.query('Insert into `company` (companyName,companyDescription,companyImage) values (?,?,?)',[companyName,companyDesc,ImagePath],(err,result)=>{
                if (err) throw err
                fs.mkdirSync(folderPath);
                companys.companys((err,data)=>{
                    global.companys = data;
                    console.log(global.companys)
                });
                res.redirect('http://localhost:3000/user/add-company')
                
            })
    
        }
    })  
})

router.post('/update-company',(req,res)=>{
    let companyID = req.body.id;
    let hiddenName = req.body.hiddenName;
    let companyName  = req.body.companyName;
    let companyDesc = req.body.companyDesc;
    if(companyName !== hiddenName){
        con.query('Select count(*) as cnt from company where companyName = ?',[companyName],(err,data)=>{
            if (err) throw err
            if (data[0].cnt > 0){
                res.send("Company Name Alredy exist")
            }else{
                con.query('update company set companyName = ?,companyDescription=? where id = ?',[companyName,companyDesc,companyID],(err,data)=>{
                    if (err) throw err
                    companys.companys((err,data)=>{
                        global.companys = data;
                        console.log(global.companys)
                    });
                    res.send({redirect:'http://localhost:3000/user/add-company'})
                })
            }
        })
    }else{
        con.query('update company set companyName = ?,companyDescription=? where id = ?',[companyName,companyDesc,companyID],(err,data)=>{
            if (err) throw err
            res.send({redirect:'http://localhost:3000/user/add-company'})
        })
    }   
})



router.post('/add-product',(req,res)=>{
    productUpload(req,res,(err)=>{
        if(err) throw err 
        else{
            let PName = req.body.PName;
            let PDescription = req.body.PDescription;
            let PIndication = req.body.PIndication;
            let PIngredient = req.body.PIngredient;
            let PDosage = req.body.PDosage;
            let [PId,PCompany] = req.body.PCompany.split(" ");
            fs.rename('./public/images/'+req.file.filename,'./public/images/'+PCompany.toUpperCase()+'/'+req.file.filename,function(err){
                if (err) throw err 
                else{
                    let imgPath = '/images/'+PCompany+'/'+req.file.filename;
                    con.query('Insert into `product` (product_name,product_description,product_indication,product_ingredient,product_dosage,product_company_id,product_img) values(?,?,?,?,?,?,?)',
                    [PName,PDescription,PIndication,PIngredient,PDosage,PId,imgPath],(err,result)=>{
                        if(err) throw err
                        else{
                            res.redirect('http://localhost:3000/user/add-product')
                        }
                    })
                }

            })  
        }
    })
})


router.post('/update-product',(req,res)=>{
    let id = req.body.id;
    let hiddenName = req.body.hiddenName;
    let PName = req.body.PName;
    let PDescription = req.body.PDescription;
    let PIndication = req.body.PIndication;
    let PIngredient = req.body.PIngredient;
    let PDosage = req.body.PDosage;
    if(PName !== hiddenName){
        con.query('Select count(*) as cnt from product where `product_name` = ?',[PName],(err,data)=>{
            if (err) throw err
            if (data[0].cnt > 0){
                res.send("Product Name Already Exist!")
            }else{
                con.query('Update product set `product_name`=?,`product_description`=?,`product_indication`=?,`product_ingredient`=?,`product_dosage`=? where product_id=?',[PName,PDescription,PIndication,PIngredient,PDosage,id],(err,result)=>{
                    if(err) throw err
                    res.send({redirect:'http://localhost:3000/user/add-product'})
                })
            }
        })
    }else{
        con.query('Update product set `product_name`=?,`product_description`=?,`product_indication`=?,`product_ingredient`=?,`product_dosage`=? where product_id=?',[PName,PDescription,PIndication,PIngredient,PDosage,id],(err,result)=>{
            if(err) throw err
            res.send({redirect:'http://localhost:3000/user/add-product'})
        })
    }
})

router.get('/delete-product/:id',(req,res)=>{
    con.query("Delete from `product` where `product_id`= ?",[req.params.id],(err,result)=>{
        if (err) throw err
        res.redirect('http://localhost:3000/user/add-product')
    })
})

router.get('/delete-product-variant/:id',(req,res)=>{
    con.query("Delete from `product_pkg` where `product_pkg_id`= ?",[req.params.id],(err,result)=>{
        if (err) throw err
        res.redirect('http://localhost:3000/user/add-product-variant')
    })
})

router.get('/delete-company/:id',(req,res)=>{
    con.query("Delete from `company` where `id`= ?",[req.params.id],(err,result)=>{
        if (err) throw err
        companys.companys((err,data)=>{
            global.companys = data;
            console.log(global.companys)
        });
        res.redirect('http://localhost:3000/user/add-company')
    })
})


router.post('/add-product-variant',(req,res)=>{
    const {PName,PSize,PWeight,PPrice,PUQID} = req.body;
    con.query('Insert into `product_pkg` (product_size,product_weight_gram,product_price,product_unquie_id,parent_product_id) values (?,?,?,?,?)',[PSize,PWeight,PPrice,PUQID,PName],(err,result)=>{
        if (err) throw err
        res.redirect('http://localhost:3000/user/add-product-variant');
    })
    
})

router.post('/update-product-variant',(req,res)=>{
    let id = req.body.id;
    let PSize = req.body.PSize;
    let PWeight = req.body.PWeight;
    let PPrice = req.body.PPrice;
    let Pu = req.body.Pu;
    con.query('update `product_pkg` set `product_size`=?,`product_weight_gram`=?,`product_price`=?,`product_unquie_id`=? where product_pkg_id=?',[PSize,parseFloat(PWeight),parseFloat(PPrice),Pu,id],(err,redult)=>{
        if(err) throw err
        res.send({redirect:'http://localhost:3000/user/add-product-variant'});
    })
})

module.exports = router;