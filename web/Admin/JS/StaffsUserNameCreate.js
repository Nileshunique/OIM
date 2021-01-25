$(document).ready(function(){
    var teachertablestart = "<h1>List Of Teachers</h1><table><tr><th style='width:120px;'>Teacher ID</th><th style='width:200px;'>Teacher Name</th><th style='width:200px;'>Father Name</th><th style='width:250px;'>Enter Password for anyone</th></tr>";
    var teachertableend = "</table>";
    var stafftablestart = "<h1>List Of Staffs</h1><table><tr><th style='width:120px;'>Employee ID</th><th style='width:200px;'>Employee Name</th><th style='width:200px;'>Father Name</th><th style='width:300px;'>Enter Password for anyone</th></tr>";
        var stafftableend = "</table>";
        var Teachersize = Object.keys(Teachers).length - 2;
        for(i=0;i<=Teachersize;i++){
            teachertablestart = teachertablestart+"<tr>";
            teachertablestart = teachertablestart+"<td>"+Teachers[i][0]+"</td><td>"+Teachers[i][1]+"</td><td>"+Teachers[i][2]+"</td><td><form method='post' action='StaffsUserNameStore.jsp'><input type='hidden' name='Staff_Id' value="+Teachers[i][0]+">";
            teachertablestart = teachertablestart+"<input type='hidden' name='staff' value='teacher'><input type='hidden' name='id' value='"+Teachers[i][0]+"'><input type='password' name='pass' placeholder='Enter Password' style='width:100px;height:35px;'><input type='submit' value='Submit'></form></td>";
            teachertablestart = teachertablestart+"</tr>";
        }
        var StaffSize = Object.keys(Staffs).length - 2;
        for(i=0;i<=StaffSize;i++){
            stafftablestart = stafftablestart+"<tr>";
            stafftablestart = stafftablestart+"<td>"+Staffs[i][0]+"</td><td>"+Staffs[i][1]+"</td><td>"+Staffs[i][2]+"</td><td><form method='post' action='StaffsUserNameStore.jsp'><input type='hidden' name='Staff_Id' value="+Staffs[i][0]+">";
            stafftablestart = stafftablestart+"<input type='hidden' name='staff' value='staff'><input type='hidden' name='id' value='"+Staffs[i][0]+"'><input type='password' name='pass' placeholder='Enter Password' style='width:100px;height:35px;'><input type='submit' value='Submit'></form></td>";
            stafftablestart = stafftablestart+"</tr>";
            stafftablestart = stafftablestart+"</tr><tr style='height:20px;'></tr>";
        }
    $('.staffCatagery').on('change',function(){
        myVal = $(this).attr("value");
        if(myVal=="Accademics"){
            $("#show_Detail").html(teachertablestart+teachertableend);
        }
        else{
            $("#show_Detail").html(stafftablestart+stafftableend);
        }
    });
});