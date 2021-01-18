<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM Student Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmEmployeeDetail.css">
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
                int r=0;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection mycon =DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","nilesh");
                    String sql1="select max(Id) from student;";
                    Statement Stmt1=mycon.createStatement();
                    ResultSet res1 = Stmt1.executeQuery(sql1);
                    while(res1.next()){
                        r=res1.getInt(1);
                    }
                    r=r+1; 
                    out.print("<h1>Your Registration ID is "+r+".</h1>");
                }
                catch(Exception e){
                    out.print(e);
                }
                %>
                <form action="Confirm_Student_Detail.jsp" method="post" >
                <fieldset>
                    <legend>Student Registration</legend>
                    <table>
                        <tr>
                            <td>Student Name</td><input type="hidden" name="sid" value="<% out.print(r); %>">
                            <td><input type="text" name="sname" placeholder="Student name" style="width:200px;height:20px;"></td>

                            <td>Father Name</td>
                            <td><input type="text" name="fname" placeholder="Father name"  style="width:200px;height:20px;"></td>
                        </tr>
                        <tr>
                            <td>Date Of Birth</td>
                            <td><%--<jsp:include page="../Date.html"></jsp:include>--%>
                        <input type="date" name="dob"  style="width:200px;height:20px;"></td>

                            <td>Gender</td>
                            <td><select  style="width:205px;height:25px;" name="gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Mobile Number</td>
                            <td><input type="tel" name="mob" placeholder="enter 10 no only"  style="width:200px;height:20px;"></td>

                            <td>Email ID</td>
                            <td><input type="email" name="email"  style="width:200px;height:20px;" placeholder="Enter Email Id"</td>
                        </tr>
                        <tr>
                            <td>Date Of Admission</td>
                            <td>
                                <input type="date" name="Add_date" style="width:200px;height:20px;"></td>

                            <td>Batch</td>
                            <% 
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                String sql="SELECT CourseName FROM course";
                                String sql1="Select BatchTime From batch";
                                Statement stmt=myCon.createStatement();
                                Statement stmt1=myCon.createStatement();
                                ResultSet res=stmt.executeQuery(sql);
                                ResultSet res1=stmt1.executeQuery(sql1);
                            %>
                            <td>
                                <select name="batch" style="width:205px;height:30px;" required="">
                                    <option>Select Batch Time</option><% while(res1.next()){ %>
                                    <option value="<%out.print(res1.getString(1));%>"><%out.print(res1.getString(1)+" ");%> o'clock to 1 Hour</option><% } %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Course</td>
                            <td><select name="course" style="width:205px;height:30px;" required="">
                                    <option>Select Course</option><% while(res.next()){ %>
                                    <option value="<%out.print(res.getString(1));%>"><%out.print(res.getString(1));%></option><% } %>
                                </select>
                                <% }
                        catch(Exception e){out.print(e);}%>
                            </td>
                            <td>Address</td>
                            <td><input type="text" name="Add" placeholder="Addres"  style="width:200px;height:20px;"></td>
                        </tr>
                        <tr>
                            <td>District</td>
                            <td><input type="text" name="Dist" placeholder="District" style="width:200px;height:20px;"></td>
                            <td>State</td>
                            <td><input type="text" name="State" placeholder="State" style="width:200px;height:20px;"></td>
                        </tr>
                        <tr>
                            <td>Pincode</td>
                            <td><input type="number" name="pincode" placeholder="Pincode" style="width:200px;height:20px;"></td>
                        
                            <td>Country</td>
                            <td><input type="text" name="country" placeholder="Country" style="width:200px;height:20px;"></td>
                        </tr>
                        <tr><td style="padding-top:80px;"></td><td><button type="submit">Submit</button></td><td><button type="reset">Reset</button></td></tr>
                    </table>
                    </fieldset>
                </form>
            </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        </div>
    </body>
</html>


