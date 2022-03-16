$(document).ready(function(){
    $('.remove-item').on('click',function(){
        let id = $(this).attr('data-itemid');
        $.ajax({
            method:'post',
            url:'/addtocart/delete-cart-product',
            data:{id},
            success:function(data){
                if(data.cart !== ''){
                    document.querySelector('.cart sup').textContent = data.cart.length;
                    if(data.cart.length === 0){
                        document.getElementById('check').disabled = true;
                    }
                    $(".sub-total").text(data.totalPrice);
                    $("#count").text(data.cart.length);
                    $('#'+id).slideUp('slow',function(){
                        $('#'+id).remove();
                    })    
                }
            }
        })
    })
})