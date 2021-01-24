<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM Student Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/CreateBatch.css">
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
                            String sqlC="select Course_Id, CourseName from course";
                            Statement stmtC=myCon.createStatement();
                            ResultSet resC=stmtC.executeQuery(sqlC);
                            Statement StmtB=myCon.createStatement();
                            String sqlB = "select BatchName, Course_Id from batch";
                            ResultSet resB = StmtB.executeQuery(sqlB);
                    %>
                        <script type="text/javascript">
                            var BatchList = { <% int i=0; while(resB.next()){out.print(i+":['"+resB.getString(1)+"','"+resB.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                                
                            var CourseList = { <% i=0; while(resC.next()){out.print(i+":['"+resC.getString(1)+"','"+resC.getString(2)+"'],"); i++;} out.print(i+":"+i); %>};
                        </script>
                    <%
                         }
                        catch(Exception e){out.print(e);}
                    %>
                        <form method="post" action="StoreBatch.jsp">
                            <input type="hidden" name="day1" id="day1">
                            <input type="hidden" name="day2" id="day2">
                            <input type="hidden" name="day3" id="day3">
                            <fieldset>
                                <legend>Create New Batch</legend>
                                <table>
                                    <tr><td>Course Name</td><td>
                                        <select name="Course_Id" id="Course_Id" style="width:230px;height:25px;"></select>
                                    </td></tr>
                                    <tr><td>Select Days</td><td>
                                        <select name="BatchName" id="BatchName" style="width:230px;height:25px;">
                                            <option></option>
                                            <option value="Batch001">Monday, Wednesday, Friday</option>
                                            <option value="Batch001">Tuesday, Thrusday, Friday</option>
                                        </select></td></tr>
                                    <tr><td>Select Time Slot</td><td>
                                        <select name="TimeSlot" id="TimeSlot" style="width:230px;height:25px;">
                                            <option></option>
                                            <option value="Morning (10 - 01)">Morning (10:00 AM - 01:00 PM)</option>
                                            <option value="Evening (02 - 05)">Evening (02:00 PM - 05:00 PM)</option>
                                        </select></td></tr>
                                    <tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
                                </table>
                            </fieldset>
                        </form>
                    <div class="responds"></div>
                    
                </div>
                <script src="JS/CreateBatch.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>
