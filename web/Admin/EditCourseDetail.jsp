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
                    <%
                        String Course_Id = request.getParameter("Course_Id");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sql = "select * from course where Course_Id = '"+Course_Id+"'";
                            Statement stmt=myCon.createStatement();
                            ResultSet res=stmt.executeQuery(sql);
                            %>
                            <script type="text/javascript">
                                var Course = [<% while(res.next()){ out.print("'"+res.getString(1) + "','" +res.getString(2) +"','" +res.getString(3) +"','" +res.getInt(4) +"'");} %>];
                                
                            </script>
                            <%
                        }
                        catch(Exception e){out.print(e);}
                    %>
                    <form method="post" action="StoreCourse.jsp">
                        <input type="hidden" name="update" value="update">
                        <input type="hidden" name="cid" class="cid">
                        <fieldset>
                            <legend>Edit Course Detail</legend>
                            <table>
                                <tr><td>Course ID</td><td><input type="text" name="cid" class="cid" placeholder="Course ID" disabled></td></tr>
                                <tr><td>Course Name</td><td><input type="text" name="cname" id="cname" placeholder="Course name" disabled></td></tr>
                                <tr><td>Duration</td><td><input type="text" name="cdur" id="cdur" placeholder="Course Duration"></td></tr>
                                <tr><td>Course Fee</td><td><input type="text" name="cfee" id="cfee" placeholder="Course Fee"></td></tr>
                                <tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
                            </table>
                        </fieldset>
                    </form>
                    <div class="responds"></div>
                </div>
                <script src="JS/EditCourseDetail.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>
