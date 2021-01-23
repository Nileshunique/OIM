<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewStaffList.css">
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
                    <div id="staffCatagery">
                        <span><input type="radio" name="staffCatagery" value="Accademics" class="staffCatagery">Teachers List</span>
                        <span><input type="radio" name="staffCatagery" value="NonAccademics" class="staffCatagery">Staff List</span>
                        <span><input type="radio" name="staffCatagery" value="Both" class="staffCatagery">Both List</span>
                    </div>
                    <% 
                        try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                        Statement StmtT=myCon.createStatement();
                        Statement StmtS=myCon.createStatement();
                        ResultSet resT = StmtT.executeQuery("select * from teacher"); 
                        ResultSet resS = StmtS.executeQuery("select * from teacher"); 
                    %>
                        <script type="text/javascript">
                            var Teachers = {<% int i=0; while(resT.next()){out.print(i+":['"+resT.getString(1)+"', '"+resT.getString(2)+"', '"+resT.getString(3)+"','"+resT.getString(4)+"','"+resT.getString(5)+"','"+resT.getString(6)+"','"+resT.getString(7)+"','"+resT.getString(8)+"','"+resT.getString(9)+"','"+resT.getString(10)+"','"+resT.getString(11)+"','"+resT.getInt(12)+"','"+resT.getString(13)+"','"+resT.getString(14)+"','"+resT.getInt(15)+" Years'],"); i++;} out.print(i+":"+i); %>};
                        
                            var Staffs = {<% i=0; while(resS.next()){out.print(i+":['"+resS.getString(1)+"','"+resS.getString(2)+"','"+resS.getString(3)+"','"+resS.getString(4)+"','"+resS.getString(5)+"','"+resS.getString(6)+"','"+resS.getString(7)+"','"+resS.getString(8)+"','"+resS.getString(9)+"','"+resS.getString(10)+"','"+resS.getString(11)+"','"+resS.getInt(12)+"'],"); i++;} out.print(i+":"+i); %>};
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
            <script src="JS/ViewStaffList.js"></script>
        </div>
    </body>
</html>

