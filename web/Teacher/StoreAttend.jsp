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
                        String Date = request.getParameter("date");
                        String Tch_Id=(String)session.getAttribute("Id"); 
                        //int TotalStudent = Integer.parseInt(request.getParameter("TotalStudent"));
                        int TotalStudent=Integer.parseInt(request.getParameter("TotalStudent"));
                        String Course = request.getParameter("Course");
                        String[] status = new String[TotalStudent];
                        String[] Sid = new String[TotalStudent];
                        for(int i=1; i<TotalStudent ; i++){
                            Sid[i] = request.getParameter("std"+i).toString();
                            status[i] = request.getParameter("status"+i);
                            out.print("<p>"+Sid[i]+"----"+status[i]+"</p>");
                        }

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
                        
                        }
                        catch(Exception e){out.print(e);}
                    %>
                    
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/MarkAttendance.js"></script>
        </div>
    </body>
</html>

