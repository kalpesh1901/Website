const con = require('../model/connection');

async function getProduct(offset){
    let limit = 10;
    if(!offset){
        offset = 0;
    }

    let query = "select `company`.`companyName`, `product`.`product_name`,`product`.`product_img`,`product_pkg`.`product_price`,`product_pkg`.`product_pkg_id`,`product_pkg`.`product_size`,"+""+
    "`product_pkg`.`product_price`,`product_pkg`.`product_weight_gram` from `company` INNER JOIN `product` on `company`.`id` = `product`.`product_company_id`"+""+
    "INNER JOIN `product_pkg` on `product`.`product_id` = `product_pkg`.`parent_product_id` GROUP BY product_pkg.parent_product_id limit 10 offset "+ offset;

    let respo =  await new Promise((resolve,reject)=>{
        con.query(query,(err,data)=>{
            if (err) throw err;
            resolve (data);
        })    
    })
}


module.exports = {getProduct};

































