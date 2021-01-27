$(document).ready(function(){
    var date = new Date();
    var Day = date.getDay();
    var TodayDate = ("0" + date.getDate()).slice(-2);
    var Month = ("0" + (date.getMonth() + 1)).slice(-2);
    var Year = date.getFullYear();
    var StudentList = "<tr><th style='font-weight:bolder;'>Student Id</th><th style='font-weight:bolder;'>Student Name</th><th style='font-weight:bolder;'>Father Name</th><th style='font-weight:bolder;'>Status</th></tr>";
    var courseList = "<option></option>";
    if(Day == 0){Day = "Sunday";}
    if(Day == 1){Day = "Monday";}
    if(Day == 2){Day = "Tuesday";}
    if(Day == 3){Day = "Wednesday";}
    if(Day == 4){Day = "Thrusday";}
    if(Day == 5){Day = "Friday";}
    if(Day == 6){Day = "Saturday";}
    var TotalStudent = 0;
    var BatchLength = Object.keys(Batch).length - 2;
    var StudentLength = Object.keys(Student).length - 2;
    var CourseLength = Object.keys(Course).length - 2;
    for(i=0;i<=BatchLength;i++){
        for(j=0;j<=CourseLength;j++){
            if(Batch[i][1] == Course[j][0]){
                courseList = courseList + "<option value="+Course[j][0]+">"+Course[j][1]+"</option>";
            }
        }
    }
    $("#CourseList").html(courseList);
    $("#CourseList").on("change", function(){
        var CourseSelected = $(this).val();
        for(i=0;i<=BatchLength;i++){
            if(Batch[i][1] == CourseSelected){
                if(Batch[i][2] == Day || Batch[i][3] == Day || Batch[i][4] == Day){
                    for(k=0;k<=StudentLength;k++){
                        if(Student[k][3] == CourseSelected){
                            TotalStudent++;
                            console.log(CourseSelected);
                            StudentList += "<tr><th>"+Student[k][0]+"</th><th>"+Student[k][1]+"</th><th>"+Student[k][2]+"</th><th><input type='text' name='status"+TotalStudent+"' value='p' style='width:50px;'><input type='hidden' name='std"+TotalStudent+"' value='"+Student[k][0]+"' ></th></tr>";
                        }
                    }
                }
                else{
                    alert("this course is not teached today");
                }
            }
        }
        $("#Studentlist").html(StudentList);
        $("#TotalStudent").val(TotalStudent);
    });
    $("#todaydate").val(Year+"-"+Month+"-"+TodayDate);
});