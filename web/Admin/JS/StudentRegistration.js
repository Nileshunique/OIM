$(document).ready(function(){
    var date = new Date();
    var H = date.getHours();
    var M = date.getMinutes();
    var m = date.getMonth();
    var y = date.getYear();
    StdID = "STD"+y+""+H+""+m+""+M;
    $("#StdId").val(StdID);
    var objLength = Object.keys(CourseList).length - 2;
    courseLists = "<option></option>";
    for(i=0;i<=objLength;i++){
        courseLists = courseLists + "<option value="+CourseList[i][0]+">"+CourseList[i][1]+"</option>";
    }
    $("#course").html(courseLists);
    $("#course").on("change", function(){
        var CourseId = $(this).val();
        for(i=0;i<=objLength;i++){
            if(CourseList[i][0]==CourseId){
                $(".CourseFee").val(CourseList[i][2]);
                $("#courseName").val(CourseList[i][1]);
            }
        }
    });
    $('#submitbtn').click(function () { 
        var result=0;
        var emailVerificationExpression = /^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/;
        sname = $('input[name="sname"]').val();
        fname = $('input[name="fname"]').val();
        gender = $('select[name="gender"]').val();
        dob = $('input[name="dob"]').val();
        email = $('input[name="email"]').val();
        mob = $('input[name="mob"]').val();
        Add_date = $('input[name="Add_date"]').val();
        Add = $('input[name="Add"]').val();
        Dist = $('input[name="Dist"]').val();
        State = $('input[name="State"]').val();
        pincode = $('input[name="pincode"]').val();
        country = $('select[name="country"]').val();
        course = $('select[name="course"]').val();
        Fee = $('input[name="Fee"]').val();
        if(sname == ""){alert("Enter Student Name");result++;}
        if(fname == ""){alert("Enter Employee's Father Name");result++;}
        if(gender == ""){alert("Please select Gender");result++;}
        if(dob == ""){alert("Please choose DOB");result++;}
        if(email == ""){alert("Enter Employee Email ID");result++;}
        if(emailVerificationExpression.test(email)=="false"){alert("email is not good");result++;}
        if(mob == ""){alert("Enter Employee Mobile No");result++;}
        if(mob.length != 10){alert("Enter Valid Mobile No");result++;}
        if(Add_date == ""){alert("Please Choose Date of Admission");result++;}
        if(Add == ""){alert("Enter Employee Address");result++;}
        if(Dist == ""){alert("Enter Employee District");result++;}
        if(State == ""){alert("Enter Employee State");result++;}
        if(pincode == ""){alert("Enter Employee pincode");result++;}
        if(pincode.length != 6){alert("Enter Valid pincode");result++;}
        if(country == ""){alert("Enter Country Name");result++;}
        if(course == ""){alert("Please Select course");result++;}
        if(result==0){
            return true; 
        } else { 
            return false; 
        } 
    }); 
});