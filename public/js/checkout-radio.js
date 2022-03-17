$(document).ready(function(){
    $('.radio1').on('click',function(){
        var radioValue = $(this).val();
        console.log(radioValue);
        if(radioValue == 'option2'){
            $(".dis").prop("disabled", true);
            $.ajax({
                method:'POST',
                url:'/retrive-register-address',
                success: function(data){
                    if(data !== ''){
                        document.querySelector('#register-label').textContent = 'Register Address';
                        document.querySelector('#register-address').textContent = data.address;
                        document.querySelector('#register-city-state-zip').textContent = `${data.city}, ${data.state}, ${data.zip}`;
                        document.querySelector('#register-country').textContent = data.country;

                    }
                    
                    
                }
            })
        }else{
            $(".dis").prop("disabled", false);
            document.querySelector('#register-label').textContent = '';
            document.querySelector('#register-address').textContent = '';
            document.querySelector('#register-city-state-zip').textContent = ``;
            document.querySelector('#register-country').textContent = '';
        }
    })
})