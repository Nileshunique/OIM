<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/EditStudentList.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
    <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
        %>
        <% 
            if((session.getAttribute("name")==null) && (session.getAttribute("usertype")!="Admin"))
            {
                response.sendRedirect("../Login.jsp");
            } 
            
        %>

        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <div id="show_Detail">
                        <h1>List of Students</h1>
                        <table>
                            <tr><th style="width:150px;">Student Id</th><th style="width:250px;">Student Name</th><th style="width:250px;">Father Name</th><th style="width:150px;">Edit anyone</th></tr>
                        <% 
                            try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                Statement StmtS=myCon.createStatement();
                                Statement StmtC=myCon.createStatement();
                                ResultSet res = StmtS.executeQuery("select STD_Id, StudentName, FatherName from student"); 
                                while(res.next()){
                                    out.print("<tr><td>"+res.getString(1)+"</td><td>"+res.getString(2)+"</td><td>"+res.getString(3)+"</td><td>");
                                    out.print("<form method='post' action='EditStudentDetail.jsp'><input type='hidden' name='STD_Id' value='"+res.getString(1)+"'><input type='submit' value='Edit Me'></form></td></tr>");
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

