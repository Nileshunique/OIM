$(document).ready(function(){
    var CourseLength = Object.keys(CourseList).length - 2;
    var BatchLength = Object.keys(BatchList).length - 2;
    courseLists = "<option></option>";
    for(i=0;i<=CourseLength;i++){
        courseLists = courseLists + "<option value="+CourseList[i][0]+">"+CourseList[i][1]+"</option>";
    }
    $("#Course_Id").html(courseLists);
    $("#Course_Id").on("change", function(){
        var SelectedCourse = $(this).val();
        console.log(SelectedCourse);
        var BatchExist = "";
        for(i=0;i<=BatchLength;i++){
            if(SelectedCourse.toLowerCase() == BatchList[0][1].toLowerCase())
            BatchExist = "<hr><center><p><b><i>"+BatchList[0][1]+"</i></b> Course Id is already Added in <b><i>"+BatchList[0][0]+"</i></b> </p></center>";
        }
        $(".responds").html(BatchExist);
    });
    $("#BatchName").on("change", function(){
        if("Batch001" == $(this).val()){
            $("#day1").val("Monday");
            $("#day2").val("Wednesday");
            $("#day3").val("Friday");
        }
        else if("Batch002" == $(this).val()){
            $("#day1").val("Tuesday");
            $("#day2").val("Thrusday");
            $("#day3").val("Saturday");
        }
        else{
            alert("Please Select Valid Days");
        }
    });
});