<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Staff Username & Password create</title>
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
                    <div id="staffCatagery">
                        <span><input type="radio" name="staffCatagery" value="Accademics" class="staffCatagery">Teachers List</span>
                        <span><input type="radio" name="staffCatagery" value="NonAccademics" class="staffCatagery">Staff List</span>
                        
                    </div>
                    <% 
                        try{ 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                        Statement StmtT=myCon.createStatement();
                        Statement StmtS=myCon.createStatement();
                        ResultSet resT = StmtT.executeQuery("select * from teacher"); 
                        ResultSet resS = StmtS.executeQuery("select * from staff"); 
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
            <script src="JS/StaffsUserNameCreate.js"></script>
        </div>
    </body>
</html>

