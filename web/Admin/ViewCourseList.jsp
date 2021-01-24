<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewRunningBatch.css">
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

