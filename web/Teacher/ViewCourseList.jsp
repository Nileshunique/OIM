<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Teacher | View Course List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewRunningBatch.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyTeacher.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <div id="show_Detail">
                    <h1>List Of Courses</h1>
                        <table> 
                            <tr><th width="100px">Course ID</th><th width="300px">Course Name</th><th width="150px">Course Duration</th><th width="50px">Fee</th>
                            </tr>
                    <% 
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sqlC="select * from course";
                            Statement stmtC=myCon.createStatement();
                            ResultSet resC=stmtC.executeQuery(sqlC);
                            while(resC.next()){
                                out.print("<tr><td>"+resC.getString(1)+"</td><td>"+resC.getString(2)+"</td><td>"+resC.getString(3)+"</td><td>"+resC.getInt(4)+"</td></tr>");
                            }
                        }
                        catch(Exception e){out.println(e);}
                    %>
                    

                        </table>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

