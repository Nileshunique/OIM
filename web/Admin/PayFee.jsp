<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OIM | Admin | Pay Student Fees</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/PayFee.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
        
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                <% 
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                        String sql="SELECT STD_Id, StudentName, FatherName, Course_Id, Fee FROM student";
                        Statement stmt=myCon.createStatement();
                        ResultSet res=stmt.executeQuery(sql);
                %>
                    <script type="text/javascript">
                        var StudentList = {<% int i=0; while(res.next()){ out.print(i+":['"+res.getString(1) + "','" +res.getString(2) + "','" +res.getString(3)+"','" +res.getString(4)+"'," +res.getInt(5)+"],"); i++;} out.print(i+":"+i); %>};
                    </script>
                    <% }
                    catch(Exception e){out.print(e);}%>
                    <span style="padding-top:20px;display:block;"><center>Enter Student name : <input type="text" id="SearchStd" style="width:200px;height:25px;"></center></span>
                    <div id="show_Detail"></div>
                </div>
             </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/PayFee.js"></script>
        </div>
    </body>
</html>




