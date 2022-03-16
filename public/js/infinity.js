function getProduct(){
    fetch('http://localhost:3000/all-product-view'+'')
    .then(res => res.json())
    .then(data => console.log(data));
}

getProduct();

// $(document).on('load',function(){
//     $.ajax({
//         method:'get',
//         url:'all_product_view',
//         success:function(data){
//             console.log(data);

//         }
//     })
// })

