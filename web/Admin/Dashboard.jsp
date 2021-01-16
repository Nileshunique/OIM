<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/DashBoard.css">
    </head>
    <body>
        <div class="Outer">
            <div class="Header">
                <div class="HeaderContent InstituteLogo"><img src="../Image/InstituteLogo.jpg" alt="Logo" width="100px" Height="70px"></div>
                <div class="HeaderContent InstituteName"><a href=http://localhost:8080/OIM/index.html>Onilne Institute Management</a></div>
                <div class="HeaderContent Links">
                    <%-- <a href="../index.html">Home</a> --%>
                    <a href="../Logout.jsp">Logout</a>
                    <%-- <a href="AboutUs.html">About Us</a>
                    <a href="ContactUs.html">Contact Us</a> --%>
                    <%-- <a href="../sqlCommand.jsp">Courses</a> --%>
                </div>
            </div>
            <div class="nav">
                <div href="" class="nav_Items Staff">Staff
                    <div class="Staff_Nav">
                        <div class="Nav_Item"><a href="">Appoint New Staff</a></div><hr>
                        <div class="Nav_Item"><a href="">Edit Staff Detail</a></div><hr>
                        <div class="Nav_Item"><a href="">View Staff List</a></div><hr>
                        <div class="Nav_Item"><a href="">Create Username & Password for Staff</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Teacher">Teacher
                    <div class="Teacher_Nav">
                        <div class="Nav_Item"><a href="">Appoint New Teacher</a></div><hr>
                        <div class="Nav_Item"><a href="">Edit Teacher Detail</a></div><hr>
                        <div class="Nav_Item"><a href="">View Teacher List</a></div><hr>
                        <div class="Nav_Item"><a href="">Create Username & Password for Teacher</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Student">Student
                    <div class="Student_Nav">
                        <div class="Nav_Item"><a href="">Student Registration</a></div><hr>
                        <div class="Nav_Item"><a href="">Edit Student Detail</a></div><hr>
                        <div class="Nav_Item"><a href="">View Student List</a></div><hr>
                        <div class="Nav_Item"><a href="">Create Username & Password for Student</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Course">Course
                    <div class="Course_Nav">
                        <div class="Nav_Item"><a href="">Add New Course</a></div><hr>
                        <div class="Nav_Item"><a href="">Edit Course Detail</a></div><hr>
                        <div class="Nav_Item"><a href="">View All Courses</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Batch">Batch
                    <div class="Batch_Nav">
                        <div class="Nav_Item"><a href="">Create Batch</a></div><hr>
                        <div class="Nav_Item"><a href="">Edit Batch</a></div><hr>
                        <div class="Nav_Item"><a href="">View Runing Batches</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Fee">Fee
                    <div class="Fee_Nav">
                        <div class="Nav_Item"><a href="">View Student Attendance</a></div>
                    </div>
                </div>
                <div href="" class="nav_Items Attendance">Attendance
                    <div class="Attendance_Nav">
                        <div class="Nav_Item"><a href="">View Pending Fee</a></div>
                    </div>
                </div>
            </div>

                <div class="Container">
                    <div id="Content">
                        
                        <%
                            int ts=0;
                            int tc=0;
                            int tt=0;
                            int tb=0;
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                Statement tsStmt=myCon.createStatement();
                                Statement tcStmt=myCon.createStatement();
                                Statement ttStmt=myCon.createStatement();
                                Statement tbStmt=myCon.createStatement();
                                ResultSet tsres = tsStmt.executeQuery("select count(*) from student");
                                ResultSet tcres = tcStmt.executeQuery("select count(*) from course");
                                ResultSet ttres = ttStmt.executeQuery("select count(*) from teacher");
                                ResultSet tbres = tbStmt.executeQuery("select count(*) from batch");
                                while(tsres.next()){
                                ts=tsres.getInt(1);
                                }
                                while(tcres.next()){
                                tc=tcres.getInt(1);
                                }
                                while(ttres.next()){
                                tt=ttres.getInt(1);
                                }
                                while(tbres.next()){
                                tb=tbres.getInt(1);
                                }
                            }
                            catch(Exception e){
                                out.print(e);
                            }
                        %>
                        <div class="box m1">Total Student<br><% out.print(ts); %></div>
                        <div class="box m2">Total Teacher<br><% out.print(tt); %></div>
                        <div class="box m3">Total Running Batch<br><% out.print(tb); %></div>
                        <div class="box m4">Total Course<br><% out.print(tc); %></div>
                    </div>
                </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        </div>
    </body>
</html>

