$(document).ready(function(){
    var objLength = Object.keys(CourseList).length - 2;
    $('#cid').on("blur",function(){
        myVal = $(this).val();
        var CourseExist = ""
        for(i=0;i<=objLength;i++){
            if(CourseList[i][0].toLowerCase() == myVal.toLowerCase()){
                CourseExist = "<hr><center><p><b><i>"+CourseList[i][0]+"</i></b> Course Id is already taken for <b><i>"+CourseList[i][1]+"</i></b> Course, please Choose another Course Id.</p></center>";
            }
        }
        $(".responds").html(CourseExist);
    });
});