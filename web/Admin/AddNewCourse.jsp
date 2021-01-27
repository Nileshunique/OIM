<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Add New Course</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/AddNewCourse.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sql = "select Course_Id, CourseName from course";
                            Statement stmt=myCon.createStatement();
                            ResultSet res=stmt.executeQuery(sql);
                            %>
                            <script type="text/javascript">
                                var CourseList = {<% int i=0; while(res.next()){ out.print(i+":['"+res.getString(1) + "','" +res.getString(2) +"'],"); i++;} out.print(i+":"+i); %>};
                            </script>
                            <%
                        }
                        catch(Exception e){out.print(e);}
                    %>
                    <form method="post" action="StoreCourse.jsp">
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
                </div>
                <script src="JS/AddNewCourse.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>
