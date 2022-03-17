if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config()
}
const router = require('express').Router();
const protedtedRoute = require('../function/functions').protedtedRoute;
const con = require('../model/connection');
const async = require('async');
var paypal = require('paypal-rest-sdk');
paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': process.env.PAPAL_CLIENT_ID || 'AewNiQe-UVZoFQq_F37lDe_liccqSM2opbDDvihYgmR8v-gem9ibgacaS90xrQHGJf1O_518xvhkAfuK',
    'client_secret': process.env.PAYPAL_CLIENT_SECRET_ID || 'EA8nWG9qRyW5fDn1EzuxUSN0hxYd_XZu05bELxAioqaFegnD4FK-9wNyufZPkZcnkUAyOOVPQrpysaaE'
});

// ROUTE for adding product to cart using (CARD METHOD)
router.post("/", (req, res) => {
    // processing product data 
    let itemid = parseInt(req.body.productId);
    let name = req.body.name;
    let price = parseFloat(req.body.price);
    let weight = parseFloat(req.body.weight);
    let size = req.body.size;
    let qty = 1;
    let img = req.body.img; 

    // Getting the session data (if any) or else creating empty session array
    let session_CART = req.session.cart;
    req.session.cart = []

    if (session_CART != undefined) {
        req.session.cart = session_CART;
    }

    // setting totalPrice
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);

    // Logic
    for (i = 0; i < req.session.cart.length; i++) {
        // update qty and price of existing product
        if (req.session.cart[i].itemid === itemid) {
            req.session.cart[i].qty += 1;
            req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
            return (res.send({ cart: req.session.cart, name: `You already have ${name} in your cart we have updated its quantity.` }));
        }
    }
    // Create cart product if not exist
    req.session.cart.push({ itemid, name, price, weight, size, qty, img });
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart)
    return (res.send({ cart: req.session.cart, name: `${name} have been added to cart` }));
});



// ROUTE for adding product to cart using (SPECIFIC PRODUCT PAGE METHOD)
router.post('/product-add-to-cart', (req, res) => {
    // processing product data 
    let itemid = parseInt(req.body.productId);
    let { name, price, weight, size, qty, img } = req.body;
    qty = parseInt(qty);
    price = parseFloat(price);
    weight = parseFloat(weight);

    // Getting the session data (if any) or else creating empty session array
    let session_CART = req.session.cart;
    req.session.cart = []
    if (session_CART != undefined) {
        req.session.cart = session_CART
    }
    // setting totalPrice
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);

    //Login
    for (i = 0; i < req.session.cart.length; i++) {
        if (req.session.cart[i].itemid === itemid) {
            // Set new QTY of the existing product and REDUCE the TOTALPRICE(SUBTRACT)
            if (req.session.cart[i].qty > qty) {

                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ cart: req.session.cart, name: `Your cart has been Updated` }));
            }
            // Set new QTY of the existing product and INCREASE the TOTALPRICE(ADD)
            else if (req.session.cart[i].qty < qty) {
                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ cart: req.session.cart, name: `Your cart has been updated` }));
            }
            // Set the QTY and TOTALPRICE as its is(NULL)
            else {
                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ cart: req.session.cart, name: `` }));
            }
        }
    }
    // Create cart product if not exist
    req.session.cart.push({ itemid, name, price, weight, size, qty, img });
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    console.log(req.session.cart);
    return (res.send({ cart: req.session.cart, name: `Added to cart Succesfully` }));
});

router.get("/cart", (req, res) => {
    let session_CART = req.session.cart;
    req.session.cart = []
    if (session_CART != undefined) {
        req.session.cart = session_CART
    }
    // setting totalPrice
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    res.render('cart', { cart: req.session.cart, totalPrice: req.session.cart.totalprice });
})

router.post("/increment-decrement", (req, res) => {
    let itemid = parseInt(req.body.itemid);
    let qty = parseInt(req.body.qty);

    // Getting the session data (if any) or else creating empty session array
    let session_CART = req.session.cart;
    req.session.cart = []
    if (session_CART != undefined) {
        req.session.cart = session_CART
    }
    // setting totalPrice
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);

    for (i = 0; i < req.session.cart.length; i++) {
        if (req.session.cart[i].itemid === itemid) {
            if (req.session.cart[i].qty > qty) {
                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ totalPrice: req.session.cart.totalprice }));
            }
            else if (req.session.cart[i].qty < qty) {
                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ totalPrice: req.session.cart.totalprice }));
            }
            else {
                req.session.cart[i].qty = qty;
                req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
                console.log(req.session.cart);
                return (res.send({ totalPrice: req.session.cart.totalprice }));
            }
        }
    }
})

router.post('/delete-cart-product', (req, res) => {
    let itemid = req.body.id;
    // Getting the session data (if any) or else creating empty session array
    let session_CART = req.session.cart;
    req.session.cart = []
    if (session_CART != undefined) {
        req.session.cart = session_CART
    }
    // setting totalPrice
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    for (i = 0; i < req.session.cart.length; i++) {
        if (req.session.cart[i].itemid == itemid) {
            delete req.session.cart[i]
            var filtered = req.session.cart.filter(function (el) {
                return el != undefined;
            });

        }
    }

    // req.session.cart.totalprice = calculatetotalPrice(filtered);
    req.session.cart = filtered;
    console.log(req.session.cart);
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    res.send({ cart: req.session.cart, totalPrice: req.session.cart.totalprice });
})

// Checkout Information Page
router.get('/checkout', protedtedRoute, (req, res) => {
    if(req.session.cart != undefined && calculatetotalPrice(req.session.cart) > 0){
        res.render("checkout-info");
    }
    else{
        res.redirect('/');
    }
    
});

router.post('/checkout', (req, res) => {
    let button_val = req.body.exampleRadios;
    let CommonWeight = 250;
    console.log(button_val);
    if(req.session.cart != undefined && calculatetotalPrice(req.session.cart) > 0){
        if (button_val == 'option1') {
        let { firstname, lastname, email, mobilenumber, address1, address2, country, state, city, zipcode } = req.body;
            req.session.cart.username = firstname + ' ' + lastname;
            req.session.cart.useremail = email;
            req.session.cart.usermobilenumber = mobilenumber;
            req.session.cart.usercountry = country;
            req.session.cart.userstate = state;
            req.session.cart.usercity = city;
            req.session.cart.userzipcode = zipcode;
            req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
            req.session.cart.totalWeight = calculatetotalWeight(req.session.cart);
            let weight = req.session.cart.totalWeight;
            let remainder = weight % 250;
            let roundoffWeight = weight - remainder + 250;
            if (weight <= CommonWeight) {
                con.query('Select `first_250_gm` from `countries` where name=?', [country], (err, result) => {
                    let Subtotal_of_Product = calculatetotalPrice(req.session.cart);
                    let Total_Price = Math.round((Subtotal_of_Product + result[0].first_250_gm) * 100) / 100;
                    req.session.Final_Price = Total_Price;
                    res.render('payment', {
                        username: req.session.cart.username, 
                        useremail: req.session.cart.useremail, 
                        usermobilenumber: req.session.cart.usermobilenumber,
                        useraddress1: address1, 
                        useraddress2: address2, 
                        usercountry: req.session.cart.usercountry, 
                        userstate: req.session.cart.userstate,
                        usercity: req.session.cart.usercity, 
                        userzipcode: req.session.cart.userzipcode, 
                        cart: req.session.cart, 
                        Subtotal_of_Product,
                        shipping: result[0].first_250_gm, 
                        Total_price:Total_price, 
                        weight
                    });
                })
            } else {
                con.query('Select `first_250_gm`,`above_250_gm` from `countries` where name=?', [country], (err, result) => {
                    let Subtotal_of_Product = calculatetotalPrice(req.session.cart);       //Only Total Price of the Product
                    let Shipping_Charges = result[0].first_250_gm + ((roundoffWeight - CommonWeight) / CommonWeight) * result[0].above_250_gm;  //Shipping Charges With GST Inculded
                    let Total_price = Math.round((Subtotal_of_Product + Shipping_Charges) * 100) / 100;     // Total Price addition of (SubTotal & shipping Charges)
                    req.session.Final_Price = Total_price;
                    res.render('payment', {
                        username: req.session.cart.username, 
                        useremail: req.session.cart.useremail, 
                        usermobilenumber: req.session.cart.usermobilenumber,
                        useraddress1: address1, 
                        useraddress2: address2, 
                        usercountry: req.session.cart.usercountry, 
                        userstate: req.session.cart.userstate,
                        usercity: req.session.cart.usercity, 
                        userzipcode: req.session.cart.userzipcode, 
                        cart: req.session.cart, 
                        Subtotal_of_Product, 
                        Shipping_Charges,
                        Total_price:Total_price, 
                        weight
                    });
                })
            }
        } else if (button_val == 'option2') {
            console.log("Hoelfjdn");
            let address = req.user.address.split(":");
            req.session.cart.username = req.user.user_name;
            req.session.cart.useremail = req.user.e_mail;
            req.session.cart.usermobilenumber = req.user.mobile_no;
            req.session.cart.useraddress = req.user.address;
            req.session.cart.usercountry = req.user.country;
            req.session.cart.userstate = req.user.state;
            req.session.cart.usercity = req.user.city;
            req.session.cart.userzipcode = req.user.zip;
            req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
            req.session.cart.totalWeight = calculatetotalWeight(req.session.cart);
            let weight = req.session.cart.totalWeight;
            let remainder = weight % 250;
            let roundoffWeight = weight - remainder + 250;
            if (roundoffWeight <= CommonWeight) {
                con.query('Select `first_250_gm` from `countries` where name=?', [req.user.country], (err, result) => {
                    let Subtotal_of_Product = calculatetotalPrice(req.session.cart);
                    let Total_Price = Math.round((Subtotal_of_Product + result[0].first_250_gm) * 100) / 100;
                    req.session.Final_Price = Total_Price;
                    res.render('payment',
                        {
                            username: req.session.cart.username, 
                            useremail: req.session.cart.useremail, 
                            usermobilenumber: req.session.cart.usermobilenumber,
                            useraddress1: address[0], 
                            useraddress2: address[1], 
                            usercountry: req.session.cart.usercountry, 
                            userstate: req.session.cart.userstate,
                            usercity: req.session.cart.usercity, 
                            userzipcode: req.session.cart.userzipcode, 
                            cart: req.session.cart, 
                            Subtotal_of_Product,
                            Shipping_Charges: result[0].first_250_gm, 
                            Total_price:Total_Price,
                            weight
                        });
                })
            } else {
                con.query('Select `first_250_gm`,`above_250_gm` from `countries` where name=?', [req.user.country], (err, result) => {
                    let Subtotal_of_Product = calculatetotalPrice(req.session.cart);       //Only Total Price of the Product
                    let Shipping_Charges = result[0].first_250_gm + ((roundoffWeight - CommonWeight) / CommonWeight) * result[0].above_250_gm;  //Shipping Charges With GST Inculded
                    let Total_price = Math.round((Subtotal_of_Product + Shipping_Charges) * 100) / 100;     // Total Price addition of (SubTotal & shipping Charges)
                    req.session.Final_Price = Total_price;
                    res.render('payment',
                        {
                            username: req.session.cart.username,
                            useremail: req.session.cart.useremail,
                            usermobilenumber: req.session.cart.usermobilenumber,
                            useraddress1: address[0],
                            useraddress2: address[1],
                            usercountry: req.session.cart.usercountry,
                            userstate: req.session.cart.userstate,
                            usercity: req.session.cart.usercity,
                            userzipcode: req.session.cart.userzipcode,
                            cart: req.session.cart,
                            Subtotal_of_Product,
                            Shipping_Charges,
                            Total_price:Total_price,
                            weight
                        });
                })
            }

        } else {
            console.log("djndjfddfd");
        }
    }else{
        res.redirect('/');
    }
});


router.post('/payment', (req, res) => {
    console.log(req.session.Final_Price)
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    req.session.address = req.body.address1 + ";" + req.body.address2;
    req.session.email = req.body.email;
    req.session.mobile = req.body.phone;
    req.session.country = req.body.country;
    req.session.state = req.body.state;
    req.session.city = req.body.city;
    req.session.zipcode = req.body.zipcode;
    const create_payment_json = {
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url": "http://localhost:3000/addtocart/payment-success",
            "cancel_url": "http://localhost:3000/addtocart/payment-cancel"
        },
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": req.session.Final_Price
            },
            "description": "This is the payment description."
        }]
    };


    paypal.payment.create(create_payment_json, function (error, payment) {
        if (error) {
            throw error;
        } else {
            for (let i = 0; i < payment.links.length; i++) {
                if (payment.links[i].rel === 'approval_url') {
                    res.redirect(payment.links[i].href)
                }
            }
        }
    });
})

router.get('/payment-success', (req, res) => {
    req.session.cart.totalprice = calculatetotalPrice(req.session.cart);
    let PayerID = req.query.PayerID;
    let paymentID = req.query.paymentId;

    let execute_payment_json = {
        'payer_id': PayerID,
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": req.session.Final_Price.toFixed(2)

            }
        }]
    };
    paypal.payment.execute(paymentID, execute_payment_json, function (error, payment) {
        if (error) throw error
        else {
            console.log(payment.id);
            if (payment.transactions[0].related_resources[0].sale.state === 'completed') {
                async.waterfall([
                    function (callback) {
                        con.query('Insert into `user_orders` (`user_id`,`shipping_address`,`user_email`,`user_mobile`,`order_amount`,`country`,`state`,`city`,`zipcode`,`pay_id`,`cart_id`) values (?,?,?,?,?,?,?,?,?,?,?)', [req.user.id, req.session.address, req.session.email, req.session.mobile, req.session.Final_Price, req.session.country, req.session.state, req.session.city, req.session.zipcode,payment.id,payment.cart], (err, result) => {
                            if (err) throw err;
                            callback(null, result.insertId);
                        })
                    },
                    function (id, callback) {
                        let values = req.session.cart.reduce((o, a) => {
                            let ini = [];
                            ini.push(id);
                            ini.push(a.name);
                            ini.push(a.size);
                            ini.push(a.price);
                            ini.push(a.qty);
                            o.push(ini);
                            return o
                        }, []);
                        con.query('Insert into `order_details` (`order_id`,`item_name`,`item_size`,`item_cost`,`item_qty`) values ?', [values], (err, result) => {
                            callback(null, id)
                        })
                    }
                ], function (err, result) {
                    req.session.cart = [];
                    res.render('thank-you', { orderNo: result });
                })
            } else {
                res.send("something went wrong");
            }
        }
    })
})

router.get('/payment-cancel', (req, res) => {
    res.send("Look like your browser dosn't support Paypal transaction. Recommended Browser for better and Smooth Transaction Flow(Firefox,Chrome)")
})

// A function to send cart item if any
router.post('/retrive', (req, res) => {
    res.send(req.session.cart);
});

// Function to calculate the TOTALPRICE inside the cart;
function calculatetotalPrice(cart) {
    let tempPrice = 0;
    for (let i = 0; i < cart.length; i++) {
        tempPrice += cart[i].price * cart[i].qty
    }
    if (tempPrice > 0) {
        return Math.round(tempPrice * 100) / 100;
    }
    else {
        return 0;
    }

}

// Function to calculate the TOTALPRICE inside the cart;
function calculatetotalWeight(cart) {
    let tempWeight = 0;
    for (let i = 0; i < cart.length; i++) {
        tempWeight += cart[i].weight * cart[i].qty
    }
    if (tempWeight > 0) {
        return tempWeight
    }
    else {
        return 0;
    }

}



module.exports = router;
// 'https://stackoverflow.com/questions/33723845/insert-array-of-records-into-mysql-with-node-js'