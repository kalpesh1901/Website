$(document).ready(function(){
    $('#searchinput').on('input',function(e){
        let search = $('#searchinput').val();
        $("#datalist").empty();
        $.ajax({
            method:'POST', 
            data:{search},
            url:'/searchresult',
            success:async function(data){
                let result = "<div class='list-group' id='list'> <div style='height:250px; display:inline-block; overflow-y:auto;'>";
                if(search != ''){
                    for(i=0;i<data.length;i++){
                        result+= `<a class='list-group-item list-group-item-action' href='/brand/${data[i].companyName}/${data[i].product_name}'>${data[i].product_name}</a>`      
                    } 
                }else{
                    result+='';
                }
                result+='</div></div>';
                $('#datalist').html(result);
            }
        })
    })
})
$(document).on("click", function(event){
    var $trigger = $("#datalist");
    if($trigger !== event.target && !$trigger.has(event.target).length){
        $("#list").slideUp("fast");
    }            
});
$(document).on("click", function(event){
    var $trigger = $("#companyMenu");
    if($trigger !== event.target && !$trigger.has(event.target).length){
        $("#companyMenu").slideUp("fast");
    }            
});