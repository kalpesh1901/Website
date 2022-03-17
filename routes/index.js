const router = require("express").Router();
const protedtedRoute = require('../function/functions').protedtedRoute;
const con = require('../model/connection');
const async = require('async');

const getProduct = require('../function/getProduct');


con.query("select companyName,id from company",(err,companys)=>{
    if (err) throw err;
    global.companys = companys;
});



const companys = (cb) => {
    con.query("select companyName,id from company",(err,companys)=>{
        if (err) throw err;
        cb(null,companys);
    });
}





// URL for Home Page
router.get("/",(req,res)=>{
    async.parallel({
        task1:(callback)=>{
            con.query("SELECT  `company`.`companyName`,`product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram`" +""+ 
                "from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id` INNER JOIN `product_pkg` ON `product`." +""+
                "`product_id` = `product_pkg`.`parent_product_id` GROUP BY `product_pkg`.`parent_product_id`" +""+ "ORDER BY rand() LIMIT 3",(err,randomproducts)=>{
                    if (err) callback(null,err);
                    console.log(randomproducts)
                    callback(null,randomproducts);
            })
        },
        task2:(callback)=>{
            var randomid = Math.floor((Math.random()*3)+1);
            con.query("SELECT  `company`.`companyName`,`product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram`" +""+ 
            "from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id` INNER JOIN `product_pkg` ON `product`." +""+
            "`product_id` = `product_pkg`.`parent_product_id` WHERE `company`.`id` = ? GROUP BY `product_pkg`.`parent_product_id` LIMIT 3",[randomid],(err,newcompany)=>{
                if(err) callback(null,err);
                console.log(newcompany);
                callback(null,newcompany);
            })
        }
    },(err,task3)=>{
        if(err) throw err
        console.log(req.user);
        res.render('index',{task3:task3});    
    }); 
});

// Other navigation Link
router.get("/contact",(req,res)=>{
    res.render('contact');
});

router.post("/enquiry",protedtedRoute,(req,res)=>{
    let{name,email,subject,message} = req.body;
    con.query('Insert into `enquiry` (fullname,email,subject,description,user_email) values (?,?,?,?,?)',[name,email,subject,message,req.user.e_mail],(err,result)=>{
        if(err) throw err;
        res.render('contact');
    })
});

router.get("/about",(req,res)=>{
    res.render("about");
});


// URL to Get Account Page
router.get("/account",protedtedRoute,(req,res)=>{

    var name = req.user.user_name;
    var [firstname,lastname] = name.split(" ");
    var email = req.user.e_mail;
    var mobilenumber = req.user.mobile_no;
    var address = req.user.address;
    var[address1,address2] = address.split(":");
    var country = req.user.country;
    var state = req.user.state;
    var city = req.user.city;
    var zipcode = req.user.zip;

    async.parallel({
        accountDetails:(callback)=>{
            con.query('select id,name from countries',(err,result)=>{
                if (err) throw err
                callback(null,{
                    result,
                    firstname,
                    lastname,
                    email,
                    mobilenumber,
                    address1,
                    address2,
                    country,
                    state,
                    city,
                    zipcode,
                    user_id:req.user.id
                });
            })
        },
        orderDetails:(callback)=>{
            
            con.query('SELECT `user_orders`.`order_id`,`user`.`user_name`,`user_orders`.`user_mobile`,`user_orders`.`order_amount`,`user_orders`.`status` from `user_orders`'+""+ 
            'INNER JOIN `user` on `user_orders`.`user_id` = `user`.`id` where `user`.`id` = ? ORDER BY `user_orders`.`order_id` DESC',[req.user.id],(err,result)=>{
                callback(null,result)
            })
        }
    },(err,data)=>{
        if (err) throw err
        res.render('account',{data:data})
    })
    
});

// URL to update Account Details
router.post("/account",(req,res)=>{
    try{
        
        const {firstname,lastname,email,mobilenumber,address1,address2,country,state,city,zipcode} = req.body;
        var name = req.user.user_name;
        var [current_firstname,current_lastname] = name.split(" ");
        var current_email = req.user.e_mail;
        var current_mobilenumber = req.user.mobile_no;
        var address = req.user.address;
        var[current_address1,current_address2] = address.split(":");
        var current_country = req.user.country;
        var current_state = req.user.state;
        var current_city = req.user.city;
        var current_zipcode = req.user.zip;
        if(firstname == "" || lastname =="" || email == "" || mobilenumber == "" || address1 == "" || country == "" || state == "" || city == "" || zipcode == ""){
            console.log("All required");
            req.flash('danger', `All is required!!`);
            res.redirect('/account');
            // res.render('account',
            // {
            //     firstname:current_firstname,
            //     lastname:current_lastname,
            //     email:current_email,
            //     mobilenumber:current_mobilenumber,
            //     address1:current_address1,
            //     address2:current_address2,
            //     country:current_country,
            //     state:current_state,
            //     city:current_city,
            //     zipcode:current_zipcode
            // });
        }
        else if(email !== current_email)
        {
            con.query('Select count(*) as cnt from user where e_mail = ?',[email],(err,data)=>{
                if (err) throw err
                if(data[0].cnt >0){
                    console.log('email Alrady exist');
                    req.flash('danger', `Email given by you already exist!!`);
                    res.redirect('/account');
                    // res.render('account',
                    //     {
                    //         firstname:current_firstname,
                    //         lastname:current_lastname,
                    //         email:current_email,
                    //         mobilenumber:current_mobilenumber,
                    //         address1:current_address1,
                    //         address2:current_address2,
                    //         country:current_country,
                    //         state:current_state,
                    //         city:current_city,
                    //         zipcode:current_zipcode
                    //     }
                    //);
                }else{
                    const formname = firstname+" "+lastname;
                    const formaddress = address1+":"+address2; 
                    con.query("update user set e_mail=?,user_name=?,mobile_no=?,address=?,country=?,state=?,city=?,zip=? where id=?",[email,formname,req.body.mobilenumber,formaddress,country,state,city,zipcode,req.user.id],(err,result)=>{
                        if(err) throw err;
                        if (result){
                            req.user.user_name = formname;
                            req.user.e_mail = email;
                            req.user.mobile_no = mobilenumber;
                            req.user.address = formaddress;
                            req.user.country = country;
                            req.user.state = state;
                            req.user.city = city;
                            req.user.zip = zipcode;
                            res.redirect('/account')
                            // res.render('account',
                            // {
                            //     firstname,
                            //     lastname,
                            //     email,
                            //     mobilenumber,
                            //     address1,
                            //     address2,
                            //     country,
                            //     state,
                            //     city,
                            //     zipcode
                            // })
                        }
                        else{
                            req.flash("danger","Something went wrong");
                            res.redirect('/accouunt')
                            // res.render("account",
                            // {
                            //     firstname:current_firstname,
                            //     lastname:current_lastname,
                            //     email:current_email,
                            //     mobilenumber:current_mobilenumber,
                            //     address1:current_address1,
                            //     address2:current_address2,
                            //     country:current_country,
                            //     state:current_state,
                            //     city:current_city,
                            //     zipcode:current_zipcode
                            // })
                        }
                    })
                }
            });
        }
        else{
            const formname = firstname+" "+lastname;
            const formaddress = address1+":"+address2; 
            con.query("update user set e_mail=?,user_name=?,mobile_no=?,address=?,country=?,state=?,city=?,zip=? where id=?",[email,formname,req.body.mobilenumber,formaddress,country,state,city,zipcode,req.user.id],(err,result)=>{
                if(err) throw err;
                if (result){
                    req.user.user_name = formname;
                    req.user.e_mail = email;
                    req.user.mobile_no = mobilenumber;
                    req.user.address = formaddress;
                    req.user.country = country;
                    req.user.state = state;
                    req.user.city = city;
                    req.user.zip = zipcode;
                    res.redirect('/account')
                    // res.render('account',
                    // {
                    //     firstname,
                    //     lastname,
                    //     email,
                    //     mobilenumber,
                    //     address1,
                    //     address2,
                    //     country,
                    //     state,
                    //     city,
                    //     zipcode
                    //})
                }
                else{
                    req.flash("danger","Something went wrong");
                    res.redirect('/account');
                    // res.render("account",
                    // {
                    //     firstname:current_firstname,
                    //     lastname:current_lastname,
                    //     email:current_email,
                    //     mobilenumber:current_mobilenumber,
                    //     address1:current_address1,
                    //     address2:current_address2,
                    //     country:current_country,
                    //     state:current_state,
                    //     city:current_city,
                    //     zipcode:current_zipcode
                    // })
                }
            })

        }
    }
    catch(e){
        console.log(e)
    }
})

router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/');
});

router.post('/retrive-register-address', (req, res) => {
    res.send(req.user);
});

router.post('/searchresult',(req,res)=>{
    let searchinput = "%"+req.body.search+"%";
    con.query('SELECT `product`.`product_name`,`company`.`companyName` FROM `product` INNER JOIN `company` on `product`.`product_company_id` = `company`.`id`'+""+
    ' where `product`.`product_name` LIKE ? OR `product`.`product_ingredient` LIKE ? ',[searchinput,searchinput],(err,result)=>{
        res.send(result);
    });
})

router.get('/all_product',(req,res)=>{
    con.query("select `company`.`companyName`, `product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_price`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,"+""+
    "`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram` from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id`"+""+
    "INNER JOIN `product_pkg` on `product`.`product_id` = `product_pkg`.`parent_product_id` GROUP BY product_pkg.parent_product_id;",(err,result)=>{
        if (err) throw err;

        res.render('all_product',{result:result})
    })
    
})

router.get('/details/:order_id/:user_id',protedtedRoute,(req,res)=>{
    let order_id = req.params.order_id
    let user_id = req.params.user_id
    if(user_id == req.user.id){
        async.parallel({
            details:(callback)=>{
                con.query('SELECT `user_orders`.`status`,`user`.`user_name`,`user_orders`.`purchaseTime`,`user_orders`.`status`,`user_orders`.`shipping_address`,`user_orders`.`user_email`,`user_orders`.`user_mobile`,`user_orders`.`order_amount` '+""+
                ',`user_orders`.`country`,`user_orders`.`state`,`user_orders`.`city`,`user_orders`.`zipcode` FROM `user_orders` INNER JOIN `user` on `user_orders`.`user_id` = `user`.`id` WHERE `user_orders`.`order_id` = ?',[order_id],(err,result)=>{
                    if (err) throw err;
                    callback(null,result);
                })
            },
            order_details:(callback)=>{
                con.query('SELECT `order_details`.`order_id`,`order_details`.`item_name`,`order_details`.`item_size`,`order_details`.`item_cost`,`order_details`.`item_qty` from `order_details` RIGHT JOIN `user_orders` on'+''+
                '`user_orders`.`order_id`=`order_details`.`order_id` WHERE `order_details`.`order_id` = ? AND `user_orders`.`user_id`=?',[order_id,user_id],(err,result)=>{
                    console.log(result);
                    if (err) throw err;
                    callback(null,result)
                })
            }
        },(err,fullDetails)=>{
            if(fullDetails.order_details.length === 0){
                res.render('401');
            }else{
                res.render('order-details',{fullDetails:fullDetails});
            }
            
        })
    }
    else{
        res.render('401');
    }
})

router.get('/dropshipping',(req,res)=>{
    res.render('drop-shipping');
})




module.exports = {router,companys};
