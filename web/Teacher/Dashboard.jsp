<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Teacher | DashBoard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/DashBoard.css">
    </head>
    <body>
        <jsp:include page="VerifyTeacher.jsp"></jsp:include>
        <div class="Outer">
            <div class="Header">
                <div class="HeaderContent InstituteLogo"><img src="http://localhost:8080/OIM/Image/InstituteLogo.jpg" alt="Logo" width="100px" Height="70px"></div>
                <div class="HeaderContent InstituteName"><a href=http://localhost:8080/OIM/index.html>Online Institute Management</a></div>
                <div class="HeaderContent Links">
                    <a>Teacher | </a><a href="http://localhost:8080/OIM/Logout.jsp"><% out.print(session.getAttribute("name")+" "); %>Logout</a>
                </div>
            </div>
            <div class="Container">
                <div id="Content">
                    <div href="" class="module_Items">
                        <p>Staff / Teacher</p>
                        <div class="Staff_module">
                            <a href="ViewStaffList.jsp">View Staff / Teacher List</a> 
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Student</p>
                        <div class="Student_module">
                            <a href="ViewStudentList.jsp">View Student List</a> 
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Course</p>
                        <div class="Course_module">
                            <a href="ViewCourseList.jsp">View All Courses</a>
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Batch</p>
                        <div class="Batch_module">
                            <a href="ViewRunningBatch.jsp">View Runing Batches</a>
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Fees</p>
                        <div class="Fee_module">
                            <a href="ViewPendingFee.jsp">View Pending Fee List</a>
                        </div>
                    </div>
                    <div href="" class="module_Items Attendance">
                        <p>Attendance</p>
                        <div class="Attendance_module">
                            <a href="MarkAttendance.jsp">Mark Student Attendance</a>
                            <a href="ViewAttendance.jsp">View Student Attendance</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

