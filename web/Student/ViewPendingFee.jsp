<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OIM | Student | View Pending Fees</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmStaffDetail.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
        
    </head>
    <body>
        <jsp:include page="VerifyStudent.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <div id="show_Detail">
                        <table>
                            <tr><th style="width:230px;height:40px;">Student ID</th><th style="width:230px;height:40px;">Student Name</th><th style="width:230px;height:40px;">Course</th><th style="width:230px;height:40px;">Balanced Fee</th></tr>
                            <% 
                                try
                                {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                    String sql="SELECT STD_ID, StudentName, Course_Id, Fee FROM student where Fee > 0";
                                    Statement stmt=myCon.createStatement();
                                    ResultSet res=stmt.executeQuery(sql);
                                    while(res.next()){
                                        out.print("<tr><td style='width:230px;height:40px;'>"+ res.getString(1) +"</td><td style='width:230px;height:40px;'>"+ res.getString(2) +"</td><td style='width:230px;height:40px;'>"+ res.getString(3) +"</td><td style='width:230px;height:40px;'>"+ res.getInt(4) +"</td></tr>");
                                    }
                                }
                                catch(Exception e){out.print(e);}
                            %>
                        </table>
                    </div>
                </div>
             </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/AddNewStaff.js"></script>
        </div>
    </body>
</html>




