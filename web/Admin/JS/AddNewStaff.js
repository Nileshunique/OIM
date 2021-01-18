// function staffCatagery(){
//     var staffCatagery = document.querySelectorAll(".staffCatagery").innerHTML;
//     console.log(staffCatagery);
// }
$(document).ready(function(){
$('.Accademics').hide();
$('.staffCatagery').on('change',function(){
    myVal = $(this).attr("value");
    // console.log(myVal);
    if(myVal=="Accademics"){
        $('.Accademics').show();
    }
    else{
        $('.Accademics').hide();
        document.getElementById("Programme").value = "";
        document.getElementById("Experience").value = "";
    }
});
});