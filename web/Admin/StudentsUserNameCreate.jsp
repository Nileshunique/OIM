<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Student Username & Password create</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/StudentsUserNameCreate.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <div id="show_Detail">
                        <h1>List of Students</h1>
                        <table>
                            <tr><th style="width:120px;">Student Id</th><th style="width:200px;">Student Name</th><th style="width:200px;">Father Name</th><th style="width:280px;">Enter Password for anyone</th></tr>
                        <% 
                            try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                Statement StmtS=myCon.createStatement();
                                Statement StmtC=myCon.createStatement();
                                ResultSet res = StmtS.executeQuery("select STD_Id, StudentName, FatherName from student"); 
                                while(res.next()){
                                    out.print("<tr><td>"+res.getString(1)+"</td><td>"+res.getString(2)+"</td><td>"+res.getString(3)+"</td><td>");
                                    out.print("<form method='post' action='StudentsUserNameStore.jsp'><input type='hidden' name='StdId' value='"+res.getString(1)+"'><input type='password' name='pass' placeholder='Enter Password' style='width:130px;height:35px;'><input type='submit' value='Submit'></form></td></tr>");
                                }
                            }
                            catch(Exception e){out.print(e);}
                        %>
                        </table>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

