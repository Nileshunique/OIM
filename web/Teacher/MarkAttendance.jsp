<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Teacher | Mark Student Attendance</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/MarkAttendance.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyTeacher.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <%
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            Statement StmtB=myCon.createStatement();
                            String sqlB = "select * from batch";
                            ResultSet resB = StmtB.executeQuery(sqlB);
                            Statement StmtC=myCon.createStatement();
                            String sqlC = "select Course_Id, CourseName from Course";
                            ResultSet resC = StmtC.executeQuery(sqlC);
                            Statement StmtS=myCon.createStatement();
                            String sqlS = "select STD_Id, StudentName, FatherName, Course_Id from student";
                            ResultSet resS = StmtS.executeQuery(sqlS);
                        %>
                            <script type="text/javascript">
                                var Batch = { <% int i=0; while(resB.next()){out.print(i+":['"+resB.getString(1)+"', '"+resB.getString(2)+"','"+resB.getString(3)+"', '"+resB.getString(4)+"', '"+resB.getString(5)+"', '"+resB.getString(6)+"'],"); i++;} out.print(i+":"+i); %>};
                                var Course = { <% i=0; while(resC.next()){out.print(i+":['"+resC.getString(1)+"','"+resC.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                                var Student = { <% i=0; while(resS.next()){out.print(i+":['"+resS.getString(1)+"','"+resS.getString(2)+"','"+resS.getString(3)+"','"+resS.getString(4)+"'],"); i++;} out.print(i+":"+i); %>};
                            </script>
                        <%
                        }
                        catch(Exception e){out.print(e);}
                    %>
                    <div id="show_Detail">
                        <form method="post" action="StoreAttend.jsp">
                        <fieldset>
                            <legend>Mark Students Attendance</legend>
                            <input type="hidden" id="TotalStudent" name="TotalStudent">
                            <input type="hidden" id="todaydate" name="date">
                            <table>
                                <tr><td></td><td></td><td>Select Course</td><td><select name="Course" id="CourseList"></select></td></tr>
                                <tr><td colspan="4" id="Studentlist"></td></tr>
                                <tr><td></td><td></td><td></td><td><input type="submit" value="Submit"></td></tr>
                            </table>
                        </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/MarkAttendance.js"></script>
        </div>
    </body>
</html>

