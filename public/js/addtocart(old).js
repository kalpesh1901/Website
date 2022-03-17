$(document).ready(function(e){
    $('.add-to-cart').on('click',function(){
        let id = e.currentTarget.getAttribute('data-id');
        console.log(id);
        cartNumbers();
    })

    function onLoad(){
        let productNumbers = localStorage.getItem('cartNumbers');
        if (productNumbers){
            document.querySelector('.cart sup').textContent = productNumbers;
        }
        

    }

    function cartNumbers(){
        let productNumbers = localStorage.getItem('cartNumbers');
        productNumbers = parseInt(productNumbers);

        if(productNumbers){
            localStorage.setItem('cartNumbers', productNumbers+1);
            document.querySelector('.cart sup').textContent = productNumbers+1;
        }else{
            localStorage.setItem('cartNumbers', 1);
            document.querySelector('.cart sup').textContent = 1;
        }
        
    }
    onLoad();
})

