<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | View Student List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewStaffList.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <% 
                        try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                        Statement StmtS=myCon.createStatement();
                        Statement StmtC=myCon.createStatement();
                        ResultSet resS = StmtS.executeQuery("select * from student"); 
                        ResultSet resC = StmtC.executeQuery("select Course_Id, CourseName from course"); 
                    %>
                        <script type="text/javascript">
                            var Course = {<% int i=0; while(resC.next()){out.print(i+":['"+resC.getString(1)+"', '"+resC.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                        
                            var Student = {<% i=0; while(resS.next()){out.print(i+":['"+resS.getString(1)+"','"+resS.getString(2)+"','"+resS.getString(3)+"','"+resS.getString(4)+"','"+resS.getString(5)+"','"+resS.getString(6)+"','"+resS.getString(7)+"','"+resS.getString(8)+"','"+resS.getString(9)+"','"+resS.getString(10)+"','"+resS.getString(11)+"','"+resS.getInt(12)+"','"+resS.getString(13)+"','"+resS.getString(14)+"','"+resS.getInt(15)+"'],"); i++;} out.print(i+":"+i); %>};
                        </script>
                    <%
                        }
                        catch(Exception e)
                        {
                            out.print(e);
                        }
                    %>
                    <div id="show_Detail"></div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/ViewStudentList.js"></script>
        </div>
    </body>
</html>

