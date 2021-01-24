$(document).ready(function(){
    var list = $("#list").children()[0].innerHTML;
    var CourseLength = Object.keys(CourseList).length - 2;
    var BatchLength = Object.keys(BatchList).length - 2;
    var Course = "";
    for(i=0;i<=BatchLength;i++){
        for(j=0;j<=CourseLength;j++){
            if(CourseList[j][0] == BatchList[i][1]){
                Course = CourseList[j][1];
            }
        }
        list = list+"<tr><td>"+BatchList[i][0]+"</td><td>"+Course+"</td><td>"+BatchList[0][2]+", "+BatchList[0][3]+", "+BatchList[0][4]+"</td><td>"+BatchList[0][5]+"</td>";
        course = ""
    }
    $("#list").html(list);
});