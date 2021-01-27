<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Teacher | Mark Student Attendance</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewAttendance.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyStudent.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <%
                        Date today = new Date();
                        SimpleDateFormat Date_Format = new SimpleDateFormat("YYYY-MM-dd");
                        String todaydate = Date_Format.format(today);
                        String Sdate = null;
                        String Edate = null;
                        Sdate = request.getParameter("Sdate");
                        Edate = request.getParameter("Edate");
                        String Course_Id = request.getParameter("Course_Id");
                        
                            try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                Statement StmtC=myCon.createStatement();
                                String sqlC = "select Course_Id, CourseName from Course";
                                ResultSet resC = StmtC.executeQuery(sqlC);
                                
                            %>
                                <script type="text/javascript">
                                    var Course = { <% int i=0; while(resC.next()){out.print(i+":['"+resC.getString(1)+"','"+resC.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                                </script>
                            <%
                            }
                            catch(Exception e){out.print(e);}
                            %>
                        <div id="show_Detail">
                            <table style="text-decoration: none;font-size:20px; margin-bottom:20px;border: 1px solid black;padding:10px;">
                            <form method="post" action="">
                                <tr style="height:50px;">
                                    <td>Select Course</td><td><select id="CourseList" name="Course_Id"  style="width:120px;height:30px;"></select></td>
                                </tr>
                                <tr>
                                    <td>Select Start Date</td><td><input type="date" name="Edate" id="Edate" max="<%= todaydate%>"></td>
                                </tr>
                                <tr>
                                    <td>Select End Date</td><td><input type="date" name="Sdate" max="<%= todaydate%>" id="Sdate"></td>
                                </tr>
                                <tr>
                                    <td></td><td><input type="submit" id="search" value="Search"></td>
                                </tr>
                            </form>
                            </table>
                            
                            <%
                                int tr=0;
                                String STD_ID;
                                try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                Statement StmtA=myCon.createStatement();
                                String sqlA = "select STD_Id, count(Date) from attendance where Course_Id = '"+Course_Id+"' and Date BETWEEN '"+Sdate+"' AND '"+Edate+"' GROUP BY STD_Id";
                                ResultSet resA = StmtA.executeQuery(sqlA);
                                while(resA.next()){
                                    STD_ID = resA.getString(1);
                                    tr = resA.getInt(2);
                                    Statement StmtS=myCon.createStatement();
                                    String sqlS = "select STD_Id, StudentName from student where STD_Id = '"+STD_ID+"'";
                                    ResultSet resS = StmtS.executeQuery(sqlS);
                                    while(resS.next()){
                                        %>
                                            <table border="1" style="font-size:20px;"><tr>
                                                <th width="120px">Student Id</th><th width="250px">Student Name</th>
                                                <td></td>
                                                <th colspan="6">Result</th>
                                            </tr>
                                            <tr>
                                                <td rowspan="<%out.print((tr)/2+1);%>"><% out.print(STD_ID); %></td><td rowspan="<%out.print((tr)/2+1);%>"><% out.print(resS.getString(2)); %></td>
                                                <td rowspan="<%out.print((tr)/2+1);%>"></td>
                                                <td><table><tr><th width="110px">Date</th><th width="80px">Status</th><td></td>
                                                <th width="110px">Date</th><th width="80px">Status</th><td></td></tr>
                                            
                                        <%
                                    }
                                    Statement mystmt=myCon.createStatement();
                                    ResultSet myres = mystmt.executeQuery("select * from attendance where Date BETWEEN '"+Sdate+"' AND '"+Edate+"' AND STD_Id='"+STD_ID+"'");
                                    for(int i=0; i<=tr;i++){
                                        out.print("<tr>");
                                        for(int j=0;j<2;j++)
                                        {
                                            while(myres.next())
                                            {
                                                %>
                                                <tr><td><%out.print(myres.getString(3));%></td><td><%out.print(myres.getString(4));%></td><td></td></tr></table></td>
                                                <%
                                            }
                                        }
                                        out.print("</tr>");
                                    }
                                    out.print("</table><br>");
                                }
                            %>
                            </table>     <%
                            }
                            catch(Exception e){out.print(e);}
                             %>
                        </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/ViewAttendance.js"></script>
        </div>
    </body>
</html>