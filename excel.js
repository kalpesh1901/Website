// let xlsx = require('xlsx');
// const con = require('./model/connection');
// const async = require('async');
// let wb = xlsx.readFile('Shipping Rates1.xlsx');
// let ws = wb.Sheets["Sheet1"]
// let data = xlsx.utils.sheet_to_json(ws);
// const mysql = require('mysql');


// // 15.39,1.39
// // let dollar_price = 74.34;
// // console.log(data.length)
// // for(i=0;i<data.length;i++){
// //     // console.log(data[i].First_250_IN_USD);
// //     // console.log(data[i].Above_250_IN_USD);
// // }

// // let Sum = 0;
// // let se = 0
// // for(i=0;i<data.length;i++){ 
// //     Sum+= data[i].First_250_Gram;
// //     se+= data[i].Above_250_Gram;
// // }


// // let newD = (Sum/data.length).toFixed(2);
// // let newI = parseFloat(newD);
// // // console.log(newI);
// // let newDI = (se/data.length).toFixed(2);
// // let newID = parseFloat(newDI);
// // console.log(newID);
// // let plus12percent = data.map((record)=>{
// //     let tax = (record.First_250_Gram/100)*12;
// //     record.Tax = tax;
// //     record.First_250_Gram = record.First_250_Gram+tax;
// //     console.log(record);
// // })
// // let newwb = xlsx.utils.book_new();
// // let newws = xlsx.utils.json_to_sheet(plus12percent);
// // xlsx.utils.book_append_sheet(newwb,newws,"New Data");
// // xlsx.writeFile(newwb,'Shipping_Plus12.xlsx');




//   var queries = '';
  
//   data.forEach(function (item) {
//     queries += mysql.format("UPDATE `countries` SET `first_250_gm`=?,`above_250_gm`=? WHERE `name`=?; ", [item.First_250_IN_USD,item.Above_250_IN_USD,item.Country]);
//   });
//   con.query(queries);



// // let Tweight = 1000;
// // let We = 250;
// // let FP = 10;
// // let AP = 5;
// // let PP = 500;

// // if(Tweight < We){
// //      PP+=FP;
// //      console.log(PP);
// // }else{
// //     PP+=FP;
// //     let AW = (Tweight - We)/We;
// //     PP = PP+(AW*AP);
// //     console.log(PP);

// // }
// // let num = 1.26589;
// // console.log(Math.round(num*100)/100); 



let fs = require('fs');
fs.mkdirSync('./public/images/Zandu');