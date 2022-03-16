function alreadyAuthenticated(req,res,next){
    if(req.isAuthenticated()){
        return res.redirect('/');
    }
    next();
}


function protedtedRoute(req,res,next){
    if(req.isAuthenticated()){
        return next();
    }
    else{
        res.redirect("/user/login");
    }
}

function isAdmin(req,res,next){
    if(req.isAuthenticated()){
        if(req.user.role == 'admin'){
            return next()
        }else{
            res.redirect('/');
        }
    }else{
        res.redirect('/')
    }
}


module.exports = {alreadyAuthenticated,protedtedRoute,isAdmin}; 