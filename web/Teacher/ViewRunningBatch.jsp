<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Teacher | View Running Batch</title>
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

                    <% 
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sqlC="select Course_Id, CourseName from course";
                            Statement stmtC=myCon.createStatement();
                            ResultSet resC=stmtC.executeQuery(sqlC);
                            Statement StmtB=myCon.createStatement();
                            String sqlB = "select * from batch";
                            ResultSet resB = StmtB.executeQuery(sqlB);
                    %>
                        <script type="text/javascript">
                            var BatchList = { <% int i=0; while(resB.next()){out.print(i+":['"+resB.getString(1)+"','"+resB.getString(2)+"','"+resB.getString(3)+"','"+resB.getString(4)+"','"+resB.getString(5)+"','"+resB.getString(6)+"'],"); i++;} out.print(i+":"+i); %>};
                                
                            var CourseList = { <% i=0; while(resC.next()){out.print(i+":['"+resC.getString(1)+"','"+resC.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                        </script>
                    <%
                        
                        }
                        catch(Exception e){out.println(e);}
                    %>
                    
                    <div id="show_Detail">
                    <h1>List Of Running Batches</h1>
                        <table id="list"> 
                            <tr><th width="120px">Batch Name</th><th width="230px">Course Name</th><th width="250px">Batch Day</th><th width="150px">Time</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/ViewRunningBatch.js"></script>
        </div>
    </body>
</html>

