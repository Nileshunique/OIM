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
                        ResultSet res = myStmt.executeQuery("select *from teacher"); 
                    %>
                    <h1>List Of Teachers</h1>
                    <div id="heading">
                        <table>
                            <tr><th width="100px">Employee ID</th><th width="200px">Employee Type</th><th width="200px">Employee Name</th><th width="200px">Father Name</th><th width="120px">Date Of Birth</th>
                                <th width="80px">Gender</th><th width="120px">Mobile No.</th><th width="180px">Email Id</th>
                                <th width="150px">Date Of Joining</th><th width="400px">Address</th></tr>
                        </table>
                    </div>
                    <div id="list">
                        <table> 
                        <%
                            while(res.next()){ %>
                                <tr><td  width="100px"><%out.print(res.getString(1)); %></td><td width="200px"><% out.print(res.getString(13)); %><td width="200px"><% out.print(res.getString(2)); %></td><td width="200px"><% out.print(res.getString(3)); %></td>
                                    <td width="120px"><% out.print(res.getString(4)); %></td><td width="80px"><% out.print(res.getString(5)); %></td><td width="120px"><% out.print(res.getString(6)); %></td>
                                    <td width="180px"><% out.print(res.getString(7)); %></td><td width="150px"><% out.print(res.getString(8)); %></td><td width="400px"><% out.print(res.getString(9)+" ");
                                        out.print(res.getString(10)+" "); out.print(res.getString(11)+" "); out.print(res.getString(12)+" "); %></td>
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

