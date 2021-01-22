<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OIM Teacher Registration</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/PayFee.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
    </head>
    <body>
        <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");%>
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
                Enter Student name : <input type="text" id="SearchStd" style="width:200px;height:25px;">
                    <div id="show_Detail"></div>
                </div>
             </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/PayFee.js"></script>
        </div>
    </body>
</html>




