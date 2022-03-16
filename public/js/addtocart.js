function retriveSession(){
    $.ajax({
        method:'POST',
        url:'/addtocart/retrive',
        success: function(data){
            if(data !== ''){
                document.querySelector('.cart sup').textContent = data.length;
            }
            
            
        }
    })
}


// For card products
$(document).ready(function(){
    $("#success-alert").hide();
    $('.add-to-cart').on('click',function(){
        let productId = $(this).val();
        let name = $(this).attr('data-name');
        let price = $(this).attr('data-price');
        let weight = $(this).attr('data-weight');
        let size = $(this).attr('data-size');
        let img = $(this).attr('data-img');
        $.ajax({
            method:'post',
            data:{productId,name,price,weight,size,img},
            url:'/addtocart',
            success:function(data){
                $("#success-alert").text(data.name);  
                $("#success-alert").fadeTo(3000, 500).slideUp(500, function() {
                    $("#success-alert").slideUp(500);
                });
                retriveSession();

            }
        })

    })
})
retriveSession();

// For Specific Product
$(document).ready(function(){
    $(".variant").on('click',function(){
        document.getElementById("product-price").textContent = $(this).attr("data-price");
        let productid = $(this).attr("data-id");
        let name = document.getElementById('pro-name').innerHTML;
        var price =$(this).attr("data-price");
        let weigth = $(this).attr("data-weight");
        let size = $(this).attr("data-size");
        $('#add-to-cart-btn').val(productid);
        $('#add-to-cart-btn').attr("data-price",price);
        $('#add-to-cart-btn').attr("data-name",name);
        $('#add-to-cart-btn').attr("data-weight",weigth);
        $('#add-to-cart-btn').attr("data-size",size);
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
                        }else{
                            $("#qty-info").text('');
                            $("#pro-qty").val("1");
                        }                          
                    }
                }
                else{
                    $("#pro-qty").val("1");
                }
            }
        })
    })

    $("#add-to-cart-btn").on("click",function(){
        let productId = $(this).val();
        let name = $(this).attr('data-name');
        let price = $(this).attr('data-price');
        let weight = $(this).attr('data-weight');
        let size = $(this).attr('data-size');
        let qty = $('#pro-qty').val();
        let img = $('#pro-img').attr("src");
        console.log(productId,name,price,weight,size,qty);
        $.ajax({
            method:'post',
            data:{productId,name,price,weight,size,qty,img},
            url:'/addtocart/product-add-to-cart',
            success: function(data){
                $("#qty-info").text(`You have order ${qty} x ${size} of ${name}`);
                if(data.name !== ``){
                    $("#success-alert").text(data.name);  
                    $("#success-alert").fadeTo(3000, 500).slideUp(500, function() {
                        $("#success-alert").slideUp(500);
                    });
                }else{
                    $("#success-alert").hide();
                }
                retriveSession();
            }

        })
    })
})








