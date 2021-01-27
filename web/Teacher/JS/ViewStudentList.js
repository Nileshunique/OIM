$(document).ready(function(){
    var StudentTableStart = "<h1>List Of Student</h1><table>";
    var StudentTableEnd = "</table>";
    var CourseSize = Object.keys(Course).length - 2;
    var TStudentsize = Object.keys(Student).length - 2;
    for(i=0;i<=TStudentsize;i++){
        var course = "";
        for(j=0;j<=CourseSize;j++){
            if(Student[i][13].toLowerCase() == Course[j][0].toLowerCase()){
                course = Course[j][1];
                console.log(course);
            }
        }
        StudentTableStart = StudentTableStart+"<tr><th style='width:120px;'>Student ID</th><th style='width:200px;'>Student Name</th><th style='width:200px;'>Father Name</th>";
        StudentTableStart = StudentTableStart+"<th style='width:130px;'>Date Of Birth</th><th style='width:100px;'>Gender</th><th style='width:130px;'>Mobile No</th><th style='width:250px;'>Email Id</th>";
        StudentTableStart = StudentTableStart+"</tr><tr>";
        StudentTableStart = StudentTableStart+"<td>"+Student[i][0]+"</td><td>"+Student[i][1]+"</td><td>"+Student[i][2]+"</td><td>"+Student[i][3]+"</td>";
        StudentTableStart = StudentTableStart+"<td>"+Student[i][4]+"</td><td>"+Student[i][5]+"</td><td>"+Student[i][6]+"</td>";
        StudentTableStart = StudentTableStart+"</tr><tr>";
        StudentTableStart = StudentTableStart+"<th>Date of Admission</th><th>Course Name</th><th>Balanced Fee</th><th colspan='4'>Address</th>";
        StudentTableStart = StudentTableStart+"</tr><tr>";
        StudentTableStart = StudentTableStart+"<td>"+Student[i][7]+"</td><td>"+course+"</td><td>"+Student[i][14]+"</td>";
        StudentTableStart = StudentTableStart+"<td colspan='4'>"+Student[i][8]+", "+Student[i][9]+", "+Student[i][10]+" - "+Student[i][11]+", "+Student[i][12]+"</td>";
        StudentTableStart = StudentTableStart+"</tr><tr style='height:20px;'></tr>";
    }
    $("#show_Detail").html(StudentTableStart+StudentTableEnd);
    
});