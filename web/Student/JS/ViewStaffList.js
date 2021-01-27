$(document).ready(function(){
    var teachertablestart = "<h1>List Of Teachers</h1><table>";
    var teachertableend = "</table>";
    var stafftablestart = "<h1>List Of Staffs</h1><table>";
        var stafftableend = "</table>";
        var Teachersize = Object.keys(Teachers).length - 2;
        for(i=0;i<=Teachersize;i++){
            teachertablestart = teachertablestart+"<tr><th style='width:120px;'>Employee ID</th><th style='width:200px;'>Employee Name</th><th style='width:200px;'>Father Name</th>";
            teachertablestart = teachertablestart+"<th style='width:130px;'>Date Of Birth</th><th style='width:100px;'>Gender</th><th style='width:130px;'>Mobile No</th><th style='width:250px;'>Email Id</th>";
            teachertablestart = teachertablestart+"</tr><tr>";
            teachertablestart = teachertablestart+"<td>"+Teachers[i][0]+"</td><td>"+Teachers[i][1]+"</td><td>"+Teachers[i][2]+"</td><td>"+Teachers[i][3]+"</td>";
            teachertablestart = teachertablestart+"<td>"+Teachers[i][4]+"</td><td>"+Teachers[i][5]+"</td><td>"+Teachers[i][6]+"</td>";
            teachertablestart = teachertablestart+"</tr><tr>";
            teachertablestart = teachertablestart+"<th>Date of joining</th><th>Experience</th><th>Programme</th><th>Qualification</th><th colspan='3'>Address</th>";
            teachertablestart = teachertablestart+"</tr><tr>";
            teachertablestart = teachertablestart+"<td>"+Teachers[i][7]+"</td><td>"+Teachers[i][14]+"</td><td>"+Teachers[i][13]+"</td><td>"+Teachers[i][12]+"</td>";
            teachertablestart = teachertablestart+"<td colspan='3'>"+Teachers[i][8]+", "+Teachers[i][9]+", "+Teachers[i][10]+" - "+Teachers[i][11]+"</td>";
            teachertablestart = teachertablestart+"</tr><tr style='height:20px;'></tr>";
        }
        var StaffSize = Object.keys(Staffs).length - 2;
        for(i=0;i<=StaffSize;i++){
            stafftablestart = stafftablestart+"<tr><th style='width:120px;'>Employee ID</th><th style='width:200px;'>Employee Name</th><th style='width:200px;'>Father Name</th>";
            stafftablestart = stafftablestart+"<th style='width:150px;'>Date Of Birth</th><th style='width:100px;'>Gender</th><th style='width:150px;'>Date of joining</th>";
            stafftablestart = stafftablestart+"</tr><tr>";
            stafftablestart = stafftablestart+"<td>"+Staffs[i][0]+"</td><td>"+Staffs[i][1]+"</td><td>"+Staffs[i][2]+"</td><td>"+Staffs[i][3]+"</td>";
            stafftablestart = stafftablestart+"<td>"+Staffs[i][4]+"</td><td>"+Staffs[i][7]+"</td>";
            stafftablestart = stafftablestart+"</tr><tr>";
            stafftablestart = stafftablestart+"<th style='width:130px;'>Mobile No</th><th style='width:250px;'>Email Id</th><th>Qualification</th><th colspan='3'>Address</th>";
            stafftablestart = stafftablestart+"</tr><tr>";
            stafftablestart = stafftablestart+"<td>"+Staffs[i][5]+"</td><td>"+Staffs[i][6]+"</td><td>"+Staffs[i][13]+"</td>";
            stafftablestart = stafftablestart+"<td colspan='3'>"+Staffs[i][8]+", "+Staffs[i][9]+", "+Staffs[i][10]+" - "+Staffs[i][11]+"</td>";
            stafftablestart = stafftablestart+"</tr><tr style='height:20px;'></tr>";
        }
    $('.staffCatagery').on('change',function(){
        myVal = $(this).attr("value");
        console.log(myVal);
        if(myVal=="Both"){
            $("#show_Detail").html(teachertablestart+teachertableend+"<br>"+stafftablestart+stafftableend);
        }
        else if(myVal=="Accademics"){
            $("#show_Detail").html(teachertablestart+teachertableend);
        }
        else{
            $("#show_Detail").html(stafftablestart+stafftableend);
        }
    });
});
// <div id="show_Detail">
//     <table>
//     <%
//         while(res.next()){ %>
//             <tr><th style='width:120px;'>Employee ID</th><th style='width:200px;'>Employee Name</th><th style='width:200px;'>Father Name</th>
//                 <th style='width:130px;'>Date Of Birth</th><th style='width:100px;'>Gender</th><th style='width:130px;'>Mobile No</th><th style='width:250px;'>Email Id</th>
//             </tr><tr>
//                 <td><% out.print(res.getString(1)); %></td><td><% out.print(res.getString(2)); %></td><td><% out.print(res.getString(3)); %></td><td><% out.print(res.getString(4)); %></td>
//                 <td><% out.print(res.getString(5)); %></td><td><% out.print(res.getString(6)); %></td><td><% out.print(res.getString(7)); %></td>
//             </tr>
//             <tr><th>Date of joining</th><th>Experience</th><th>Programme</th><th>Qualification</th><th colspan='3'>Address</th></tr>
//             <tr>
//                 <td><% out.print(res.getString(8)); %></td><td><% out.print(res.getString(15)+" Years"); %></td><td><% out.print(res.getString(14)); %></td><td><% out.print(res.getString(13)); %></td>
//                 <td colspan='3'><% out.print(res.getString(9)+", "+res.getString(10)+", "+res.getString(11)+" - "+res.getString(12)); %></td>
//             </tr>
//             <tr style='height:20px;'></tr>
//     <%  }   %>
//     </table> 
// </div>