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
                    <a href="../index.html">Home</a>
                    <a href="../Logout.jsp">Logout</a>
                    <a href="AboutUs.html">About Us</a>
                    <a href="ContactUs.html">Contact Us</a>
                    <a href="../sqlCommand.jsp">Courses</a>
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
                        <div class="box1">Total Student<br><% out.print(ts); %></div>
                        <div class="box1">Total Teacher<br><% out.print(tt); %></div>
                        <div class="box1">Total Running Batch<br><% out.print(tb); %></div>
                        <div class="box1">Total Course<br><% out.print(tc); %></div>
                        <div class="box m1"><a href="">Appoint New Staff</a></div>
                        <div class="box m2"><a href="">Appoint New Teacher</a></div>
                        <div class="box m3"><a href="">Student Registration</a></div>
                        <div class="box m4"><a href="">Add New <br>Course</a></div>
                        <div class="box m5"><a href="">Create Batch</a></div>
                        <div class="box m1"><a href="">Edit Staff <br>Detail</a></div>
                        <div class="box m2"><a href="">Edit Teacher Detail</a></div>
                        <div class="box m3"><a href="">Edit Student Detail</a></div>
                        <div class="box m4"><a href="">Edit Course Detail</a></div>
                        <div class="box m5"><a href="">Edit Batch</a></div>
                        <div class="box m1"><a href="">View Staff List</a></div>
                        <div class="box m2"><a href="">View Teacher List</a></div>
                        <div class="box m3"><a href="">View Student List</a></div>
                        <div class="box m4"><a href="">View All <br>Courses</a></div>
                        <div class="box m5"><a href="">View Runing Batches</a></div>
                        <div class="box m1"><a href="">Create Username & Password for Staff</a></div>
                        <div class="box m2"><a href="">Create Username & Password for Teacher</a></div>
                        <div class="box m3"><a href="">Create Username & Password for Student</a></div>
                        <div class="box m3"><a href="">View Student Attendance</a></div>
                        <div class="box m6"><a href="">View Pending Fee</a></div>
                    </div>
                </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

