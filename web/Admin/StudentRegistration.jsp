<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Student Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/AddNewStaff.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                <form action="ConfirmStudent.jsp" method="post" >
                <input type="hidden" name="StdId" id="StdId">
                <fieldset>
                    <legend>Student Registration</legend>
                    <table>
                        <tr>
                            <td>Student Name</td>
                            <td><input type="text" name="sname" placeholder="Student name" style="width:200px;height:20px;"></td>

                            <td>Father Name</td>
                            <td><input type="text" name="fname" placeholder="Father name"  style="width:200px;height:20px;"></td>
                        </tr>
                        <tr>
                            <td>Date Of Birth</td>
                            <td><input type="date" name="dob"  style="width:200px;height:20px;" min="1980-01-01" max="2005-12-31"></td>

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
                            <td><input type="email" name="email"  style="width:200px;height:20px;" placeholder="Enter Email Id"></td>
                        </tr>
                        <tr>
                            <td>Date Of Admission</td>
                            <td>
                                <input type="date" name="Add_date" style="width:200px;height:20px;" min="2021-01-01" max="2021-04-30"></td>

                            <% 
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                String sql="SELECT Course_Id, CourseName, fee FROM course";
                                Statement stmt=myCon.createStatement();
                                ResultSet res=stmt.executeQuery(sql);
                            %>
                            <script type="text/javascript">
                                var CourseList= {<% int i=0; while(res.next()){ out.print(i+":['"+res.getString(1) + "','" +res.getString(2) + "'," +res.getInt(3)+"],"); i++;} out.print(i+":"+i); %>};
                            </script>
                            <td>Course</td>
                            <td><select name="course" id="course" style="width:205px;height:30px;" required="">
                                </select>
                                <input type="hidden" name="courseName" id="courseName">
                            </td>
                        </tr>
                        <tr>
                            <td>Fee</td>
                            <td>
                                <input type="text" style="width:200px;height:25px;" class="CourseFee" disabled>
                                <input type="hidden" name="Fee" class="CourseFee">
                            </td>
                                <% }
                        catch(Exception e){out.print(e);}%>
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
                        <tr><td style="padding-top:80px;"></td><td><input type="submit" value="Submit" id="submitbtn"></td><td><input type="reset" value="Reset"></td></tr>
                    </table>
                    </fieldset>
                </form>
            </div>
            </div>
            <script src="JS/StudentRegistration.js"></script>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>


