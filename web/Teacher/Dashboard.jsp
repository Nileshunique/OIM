<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/dashboard.css">
    </head>
    <body>
        <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
            if((session.getAttribute("name")==null) && (session.getAttribute("usertype")!="Teacher"))
            {
                response.sendRedirect("../Login.jsp");
            } 
        %>

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
                    <div class="module_Items">
                        <p>Staff / Teacher Management</p>
                        <div class="Staff_module">
                            <a href="ViewStaffList.jsp">View Staff / Teacher List</a> 
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Student  Management</p>
                        <div class="Student_module">
                            <a href="">View Student List</a> 
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Course  Management</p>
                        <div class="Course_module">
                            <a href="">View All Courses</a>
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Batch  Management</p>
                        <div class="Batch_module">
                            <a href="ViewRunningBatch.jsp">View Runing Batches</a>
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Fees  Management</p>
                        <div class="Fee_module">
                            <a href="ViewPendingFee.jsp">View Pending Fee List</a>
                        </div>
                    </div>
                    <div href="" class="module_Items">
                        <p>Attendance  Management</p>
                        <div class="Attendance_module">
                            <a href="MarkAttendance.jsp">Mark Student Attendance</a>
                            <a href="">View Student Attendance</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

