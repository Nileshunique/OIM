$(document).ready(function(){
    var courseList = "<option></option>";
    var CourseLength = Object.keys(Course).length - 2;
    for(j=0;j<=CourseLength;j++){
            courseList = courseList + "<option value="+Course[j][0]+">"+Course[j][1]+"</option>";
    }
    $("#CourseList").html(courseList);
    $("#search").click(function(){
        var courseSelected = $("#CourseList").val();
        var Edate = $("#Edate").val();
        var Sdate = $("#Sdate").val();
        if(courseSelected == ""){alert("Please Select a Course"); return false;}
        else if(Sdate == ""){alert("Please Select Starting Date"); return false;}
        else if(Edate == ""){alert("Please Select Ending Date");return false;}
        else{return true;}
    });
    
});

