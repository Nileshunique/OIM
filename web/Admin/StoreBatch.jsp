<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmStaffDetail.css">
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
                        <%
                            String Course_Id = request.getParameter("Course_Id");
                            String BatchName = request.getParameter("BatchName");
                            String TimeSlot = request.getParameter("TimeSlot");
                            String day1 = request.getParameter("day1");
                            String day2 = request.getParameter("day2");
                            String day3 = request.getParameter("day3");
                            try
                            {
                                String sql = "";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                sql="insert into batch values('"+BatchName+"', '"+Course_Id+"', '"+day1+"','"+day2+"', '"+day3+"', '"+TimeSlot+"')";
                                Statement stmt=myCon.createStatement();
                                int dataStored = stmt.executeUpdate(sql);
                                if(dataStored == 1){
                                    out.print("<center><h2>Batch Stored in Database</h2><br>");
                                }
                            }
                            catch(Exception e){out.print("Please contact to Your IT Head <br>"+e+"<br><div style='margin-bottom:20px;width:100px;height:390px;'></div>");}
                        
                        %>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

