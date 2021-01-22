
$(document).ready(function(){
$('.Accademics').hide();
var date = new Date();
    var H = date.getHours();
    var M = date.getMinutes();
    var m = date.getMonth();
    var y = date.getYear();
    staffID = y+""+H+""+m+""+M;
    $("#StaffId").val("STF"+staffID);
    $('.staffCatagery').on('change',function(){
        myVal = $(this).attr("value");
        if(myVal=="Accademics"){
            $('.Accademics').show();
            $("#StaffId").val("TCH"+staffID);
        }
        else{
            $('.Accademics').hide();
            $("#Programme").val("");
            $("#Experience").val("");
            $("#StaffId").val("STF"+staffID);
        }
    });
    $('#submitbtn').click(function () { 
        var result=0;
        var emailVerificationExpression = /^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/;
        acad = $("input[name='staffCatagery']:checked").val();
        console.log(acad);
        Ename = $('input[name="Ename"]').val();
        fname = $('input[name="fname"]').val();
        gender = $('select[name="gender"]').val();
        dob = $('input[name="dob"]').val();
        email = $('input[name="email"]').val();
        mob = $('input[name="mob"]').val();
        Join_date = $('input[name="Join_date"]').val();
        Add = $('input[name="Add"]').val();
        Dist = $('input[name="Dist"]').val();
        State = $('input[name="State"]').val();
        pincode = $('input[name="pincode"]').val();
        Qualification = $('select[name="Qualification"]').val();
        Programme = $('select[name="Programme"]').val();
        Experience = $('input[name="Experience"]').val();
        if(Ename == ""){alert("Enter Employee Name");result++;}
        if(fname == ""){alert("Enter Employee's Father Name");result++;}
        if(gender == ""){alert("Please select Gender");result++;}
        if(dob == ""){alert("Please choose DOB");result++;}
        if(email == ""){alert("Enter Employee Email ID");result++;}
        if(emailVerificationExpression.test(email)=="false"){alert("email is not good");result++;}
        if(mob == ""){alert("Enter Employee Mobile No");result++;}
        if(mob.length != 10){alert("Enter Valid Mobile No");result++;}
        if(Join_date == ""){alert("Please Choose Date of Joining");result++;}
        if(Add == ""){alert("Enter Employee Address");result++;}
        if(Dist == ""){alert("Enter Employee District");result++;}
        if(State == ""){alert("Enter Employee State");result++;}
        if(pincode == ""){alert("Enter Employee pincode");result++;}
        if(pincode.length != 6){alert("Enter Valid pincode");result++;}
        if(Qualification == ""){alert("Please Select Higher Qualification");result++;}
        if(acad=="Accademics"){
            if(Programme == ""){alert("Please Select Programme Code");result++;}
            if(Experience == ""){alert("Enter Employee Experience in Year");result++;}
            if(Experience >= "60"){alert("Enter a valid Experience");result++;}
        }
        if(result==0){
            return true; 
        } else { 
            return false; 
        } 
    }); 
});