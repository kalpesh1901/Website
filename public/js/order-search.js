$(document).ready(function(){
    $('#orderSearch').on('input',function(){
      let orderID = $('#orderSearch').val();
      $.ajax({
          method:'POST',
          data:{orderID},
          url:'/user/sortBy-order',
          success:function(data){
              let details = '';
              for(i=0;i<data.length;i++){
                  details+='<tr><td>'+data[i].order_id+'</td><td>'+data[i].user_name+'</td><td>'+data[i].user_mobile+'</td><td>'+data[i].order_amount+'</td>';
                  if(data[i].status == 'Pending'){
                      details+='<td><a role="button" href="/user/order-details/'+data[i].user_name+'/'+data[i].order_id+'" class="btn btn-danger btn-block">'+data[i].status+'</a></td>'
                  }else if(data[i].status == 'Preparing'){
                      details+='<td><a role="button" href="/user/order-details/'+data[i].user_name+'/'+data[i].order_id+'" class="btn btn-warning btn-block">'+data[i].status+'</a></td>'
                  }else if(data[i].status == 'Dispatched'){
                      details+='<td><a role="button" href="/user/order-details/'+data[i].user_name+'/'+data[i].order_id+'" class="btn btn-primary btn-block">'+data[i].status+'</a></td>'
                  }else{
                      details+='<td><a role="button" href="/user/order-details/'+data[i].user_name+'/'+data[i].order_id+'" class="btn btn-success btn-block">'+data[i].status+'</a></td>'
                  }
              }
              $('#orders').html(details);
          }  
      })
    });


    $('#enquirySearch').on('input',function(){
        let enquiry = $('#enquirySearch').val();
        $.ajax({
            method:'POST',
            data:{enquiry},
            url:'/user/sortBy-enquiry',
            success:function(data){
                let details = '';
                for(i=0;i<data.length;i++){
                    details+='<tr><td>'+data[i].enquiry_id+'</td><td>'+data[i].fullname+'</td><td>'+data[i].email+'</td><td>'+data[i].subject+'</td><td>'+data[i].description+'</td>';
                }
                $('#enquiry').html(details);
            }
        });
      });


      $('#countrySearch').on('input',function(){
        let country = $('#countrySearch').val();
        $.ajax({
            method:'POST',
            data:{country},
            url:'/user/sortBy-country',
            success:function(data){
                let details = '';
                for(i=0;i<data.length;i++){
                    details+='<tr><td>'+data[i].id+'</td><td>'+data[i].countrycode+'</td><td>'+data[i].name+'</td><td>'+data[i].phonecode+'</td><td>'+data[i].first_250_gm+'</td><td>'+data[i].above_250_gm+'</td><td><a role="button" href="/user/country-details/'+data[i].id+'" class="btn btn-success btn-block"> Edit </a></td>'
                }
                $('#country').html(details);
            }
        });
      });
});