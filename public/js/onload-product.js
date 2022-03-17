$(document).ready(function(){
    $.ajax({
        method:"post",
        url:"/addtocart/retrive",
        success:function(data){
            var proQty = $("#add-to-cart-btn").val();
            if(data !== ""){
                for(i=0;i<data.length;i++){
                    if(data[i].itemid == proQty){
                        $("#pro-qty").val(data[i].qty);
                        $("#qty-info").text(`You have order ${data[i].qty} x ${data[i].size} of ${data[i].name}`);
                        break;
                    }
                    else{
                        $("#qty-info").text("");
                        $("#pro-qty").val("1");
                    }                          
                }
            }else{
                $("#pro-qty").val("1");
            }

        }
    })
})