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

                    <% 
                        try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                        Statement myStmt=myCon.createStatement();
                        ResultSet res = myStmt.executeQuery("select * from batch"); 
                    %>
                    <h1>List Of Running Batches</h1>
                    <div id="heading">
                        <table>
                            <tr><th width="100px">Batch ID</th><th width="200px">Batch Name</th><th width="200px">Batch Time</th><th width="200px">Teacher Name</th><th width="120px">Course Name</th>
                            </tr>
                        </table>
                    </div>
                    <div id="list">
                        <table> 
                        <%
                            while(res.next()){ %>
                                <tr><td  width="100px"><%out.print(res.getString(1)); %></td>
                                <td width="200px"><% out.print(res.getString(13)); %></td>
                                <td width="200px"><% out.print(res.getString(2)); %></td>
                                <td width="200px"><% out.print(res.getString(3)); %></td>
                                <td width="120px"><% out.print(res.getString(4)); %></td>
                                </tr>
                        <%  }   %>
                        </table>
                    </div>
                    <%
                        myCon.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                    %>

                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

