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
                    <table>
                        <tr>
                            <th width="200px">Student Id</th><th width="300px">Updated</th><th width="300px">Already Submitted</th>
                        </tr>
                        <tr></tr><tr></tr><tr></tr>

                    <%
                        String Date = request.getParameter("date");
                        String Tch_Id=(String)session.getAttribute("Id"); 
                        String Course = request.getParameter("Course");
                        int TotalStudent=Integer.parseInt(request.getParameter("TotalStudent"));
                        int i=0;
                        String[] status = new String[TotalStudent];
                        String[] sid = new String[TotalStudent];
                        //https://javarevisited.blogspot.com/2016/02/solving-javalangarrayindexoutofboundsexception-0-1-2-in-java.html#axzz6kjn2Jvwn
                        for(i=0; i<=TotalStudent-1;i++){
                            sid[i] = request.getParameter("std"+i);
                            status[i] = request.getParameter("status"+i);
                        }
                        
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            Statement StmtACheck=myCon.createStatement();
                            Statement StmtAUpdate=myCon.createStatement();
                            for(i=0; i<=TotalStudent-1;i++){
                                int upd=0;
                                String sqlACheck = "select * from attendance where STD_Id = '"+sid[i]+"'";
                                ResultSet resA = StmtACheck.executeQuery(sqlACheck);
                                while(resA.next()){
                                    if(resA.getString(1).equals(sid[i])&&resA.getString(3).equals(Date)){
                                        upd=1;
                                    }
                                }
                                if(upd==1){
                                    out.print("<tr><td>"+sid[i]+"</td><td></td><td>Attendance is already Submitted.</td></tr>");
                                }
                                else{
                                    String sqlAUpdate="INSERT INTO attendance VALUES ('"+sid[i]+"', '"+Tch_Id+"', '"+Date+"', '"+status[i]+"', '"+Course+"');";
                                    StmtAUpdate.executeUpdate(sqlAUpdate);
                                    out.print("<tr><td>"+sid[i]+"</td><td>Attendance is Submitted.</td><td></td></tr>");
                                }
                            }
                        }
                        catch(Exception e){
                            out.print(e);
                        }
                    %>
                    </table>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/MarkAttendance.js"></script>
        </div>
    </body>
</html>

