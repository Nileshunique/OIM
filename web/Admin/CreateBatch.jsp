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
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String SelectTch="select Tch_Id, TeacherName from teacher";
                            Statement Tstmt=myCon.createStatement();
                            ResultSet Tres=Tstmt.executeQuery(SelectTch);
                            String SelectCour="select Course_Id, CourseName from course";
                            Statement Cstmt=myCon.createStatement();
                            ResultSet Cres=Cstmt.executeQuery(SelectCour);
                    %>
                    <form method="post" action="">
                        <fieldset>
                            <legend>Create New Batch</legend>
                            <table>
                                <tr><td>Batch Time</td><td>
                                    <select name="Btime" style="width:230px;height:25px;">
                                        <option value="">08:00AM - 09:00AM</option>
                                        <option value="">09:00AM - 10:00AM</option>
                                        <option value="">10:00AM - 11:00AM</option>
                                        <option value="">11:00AM - 12:00PM</option>
                                        <option value="">12:00PM - 01:00PM</option>
                                        <option value="">01:00PM - 02:00PM</option>
                                        <option value="">02:00PM - 03:00PM</option>
                                        <option value="">03:00PM - 04:00PM</option>
                                        <option value="">04:00PM - 05:00PM</option>
                                        <option value="">05:00PM - 06:00PM</option>
                                        <option value="">06:00PM - 07:00PM</option>
                                        <option value="">07:00PM - 08:00PM</option>
                                        <option value="">08:00PM - 09:00PM</option>
                                    </select>
                                </td></tr>
                                <tr><td>Teacher ID</td><td>
                                    <select name="BTime" style="width:230px;height:25px;">
                                        <option></option>
                                        <% while(Tres.next())
                                        {
                                            out.print("<option value="+Tres.getString(1)+">"+Tres.getString(2)+"</option>");
                                        }%>
                                    </select></td></tr>
                                <tr><td>Course Id</td><td>
                                    <select name="CourId" style="width:230px;height:25px;">
                                        <option></option>
                                        <% while(Cres.next())
                                        {
                                            out.print("<option value="+Cres.getString(1)+">"+Cres.getString(2)+"</option>");
                                        }%>
                                    </select></td></tr>
                                <tr><td><button type="submit">Submit</button></td><td><button type="reset">Reset</button></td></tr>
                            </table>
                        </fieldset>
                    </form>
                    <%
                         }
                        catch(Exception e){out.print(e);}
                    %>
                    <div class="responds"></div>
                    
                </div>
                <script src="JS/AddNewCourse.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>