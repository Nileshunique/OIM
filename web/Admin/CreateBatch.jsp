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
                    %>
                    <form method="post" action="">
                        <fieldset>
                            <legend>Create New Batch</legend>
                            <table>
                                <tr><td>Select Batch</td><td>
                                    <select name="BName" id="BName" style="width:230px;height:25px;">
                                        <option></option>
                                        <option value="Bch001">Batch 1 (Mon, Wed, Fri)</option>
                                        <option value="Bch002">Batch 2 (Tue, Thu, Sat)</option>
                                       
                                    </select>
                                </td></tr>
                                <tr><td>Batch Time</td><td>
                                    <select name="BTime" id="BTime" style="width:230px;height:25px;">
                                        <option></option>
                                        <option value="Slot1">09:00AM - 11:00AM</option>
                                        <option value="Slot2">11:15AM - 01:15PM</option>
                                        <option value="Slot3">02:00PM - 04:00PM</option>
                                        <option value="Slot4">04:15PM - 06:15PM</option>
                                    </select>
                                </td></tr>
                                <tr><td>Teacher Name</td><td>
                                    <select name="TchId" id="TchId" style="width:230px;height:25px;">
                                        <option></option>
                                        <% while(Tres.next())
                                        {
                                            out.print("<option value="+Tres.getString(1)+">"+Tres.getString(2)+"</option>");
                                        }%>
                                    </select></td></tr>
                                <tr><td>Course Name</td><td>
                                    <select name="CourId" id="CourId" style="width:230px;height:25px;">
                                        <option></option>
                                        <option value="AD" class="b1">Advanced Designing</option>
                                        <option value="AP" class="b1">Advanced Programming</option>
                                        <option value="CC" class="b2">Certificate Course</option>
                                        <option value="DC" class="b2">Diploma Course</option>
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
                <script src="JS/CreateBatch.js"></script>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>