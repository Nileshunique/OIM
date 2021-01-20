<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM Student Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/AddNewCourse.css">
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
                    <form method="post" action="">
                        <fieldset>
                            <legend>Add New Course</legend>
                            <table>
                                <tr><td>Course ID</td><td><input type="text" name="cid" id="cid" placeholder="Course ID"></td></tr>
                                <tr><td>Course Name</td><td><input type="text" name="cname" placeholder="Course name"></td></tr>
                                <tr><td>Duration</td><td><input type="text" name="cdur" placeholder="Course Duration"></td></tr>
                                <tr><td>Course Fee</td><td><input type="text" name="cfee" placeholder="Course Fee"></td></tr>
                                <tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
                            </table>
                        </fieldset>
                    </form>
                    <div class="responds"></div>
                    <%
                        String cid="null";
                        String cname="null";
                        String cdur="null";
                        String cfee="null";
                        cid = request.getParameter("cid");
                        cname = request.getParameter("cname");
                        cdur = request.getParameter("cdur");
                        cfee = request.getParameter("cfee");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            if(cfee!=null){
                                int fee=Integer.parseInt(cfee);
                                String Insertsql="INSERT INTO course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('"+cid+"', '"+cname+"', '"+cdur+"', '"+fee+"')";
                                PreparedStatement myStmt=myCon.prepareStatement(Insertsql);
                                myStmt.executeUpdate();
                                out.print("<h1>Course is Updated into Database</h1>");
                            }
                        }
                        catch(Exception e){out.print(e);}
                    %>
                </div>
                <script src="JS/AddNewCourse.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>