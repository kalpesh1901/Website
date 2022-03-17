const router = require('express').Router();
const con = require('../model/connection');
const async = require('async');
const AppError = require('../function/appError');

router.get("/:companyName",(req,res)=>{
    const companyName = req.params.companyName;
    try{
        async.parallel({
            description:(callback)=>{
                con.query("select companyDescription , companyImage from company where companyName = ?",[companyName],(err,description)=>{
                    callback(null,description)
                });
            }, 
            allProductOfCompany:(callback)=>{
                con.query("select `product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_price`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram`" +""+ 
                "from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id`"+""+ 
                "INNER JOIN `product_pkg` on `product`.`product_id` = `product_pkg`.`parent_product_id`"+""+
                "WHERE `company`.`companyName` = ? GROUP BY `product_pkg`.`parent_product_id`",[companyName],(err,products)=>{
                    console.log(products);
                    callback(null,products);
                })    
            }
        },(err,finalresult)=>{
            console.log(typeof(finalresult.description[0]))
            res.render('company',{companyName:companyName,finalresult:finalresult});
        })
    }catch(e){
        throw new AppError("The Company you are looking for does not exist",500);
    }
    
}); 

router.get("/:companyName/:product_name",(req,res)=>{
    let companyName = req.params.companyName;
    let product_name = req.params.product_name;
    

    async.parallel({
        productDetails:(callback)=>{
            con.query("SELECT `product`.`product_description`,`product`.`product_img`,`product`.`product_indication`,`product`.`product_ingredient`,"+''+
            "`product`.`product_dosage` from `product` WHERE `product`.`product_name` = ?",[product_name],(err,Details)=>{
                if (err) throw err
                callback(null,Details)
            })
        },
        productVariant:(callback)=>{
            con.query("SELECT `product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`, `product_pkg`.`product_weight_gram`,`product_pkg`.`product_price`  from `product` INNER JOIN `product_pkg`"+''+
            "ON `product`.`product_id` = `product_pkg`.`parent_product_id`"+''+
            "WHERE `product`.`product_name` = ?",[product_name],(err,variants)=>{
                if(err) throw err
                callback(null,variants)
            })
        },
        allProductOfCompany:(callback)=>{
            con.query("select `product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_price`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram`" +""+ 
            "from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id`"+""+ 
            "INNER JOIN `product_pkg` on `product`.`product_id` = `product_pkg`.`parent_product_id`"+""+
            "WHERE `company`.`companyName` = ? GROUP BY `product_pkg`.`parent_product_id` limit 3",[companyName],(err,products)=>{
                console.log(products);
                callback(null,products);
            })    
        }
    },(err,result)=>{    
        res.render('product',{result:result,companyName,product_name})
    });
    
});

module.exports = router;


