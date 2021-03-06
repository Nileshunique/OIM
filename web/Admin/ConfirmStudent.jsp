<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Confirm Student Detail</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmStaffDetail.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <jsp:include page="VerifyAdmin.jsp"></jsp:include>
        <div class="Outer">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="Container">
                <div id="Content">
                    <% 
                        String update=request.getParameter("update");
                        String StdId=request.getParameter("StdId");
                        String sname=request.getParameter("sname");
                        String fname=request.getParameter("fname");
                        String DOB=request.getParameter("dob");
                        String gender=request.getParameter("gender");
                        String mob=request.getParameter("mob");
                        String email=request.getParameter("email");
                        String Add_date=request.getParameter("Add_date");
                        String Add=request.getParameter("Add");
                        String Dist=request.getParameter("Dist");
                        String State=request.getParameter("State");
                        String pincode=request.getParameter("pincode");
                        String country=request.getParameter("country");
                        String course=request.getParameter("course");
                        String courseName=request.getParameter("courseName");
                        String Fee=request.getParameter("Fee");
                    %>
                    <div id="show_Detail">
                        <table>
                            <tr>
                                <th style="width:230px;">Student Name</th><th style="width:230px;">Father Name</th><th style="width:180px;">Date Of Birth</th><th style="width:180px;">Gender</th>
                            </tr>
                            <tr>
                               <td style="width:230px;"><% out.print(sname); %></td><td style="width:230px;"><% out.print(fname); %></td><td style="width:180px;"><% out.print(DOB); %></td><td style="width:180px;"><% out.print(gender); %></td>
                            </tr><tr></tr><tr></tr><tr></tr>
                            <tr>
                                <th>Mobile No.</th><th colspan="2">Email Id</th><th>Admission Date</th>
                            </tr>
                            <tr>
                                <td><% out.print(mob); %></td><td colspan="2"><% out.print(email); %></td><td><% out.print(Add_date); %></td>
                            </tr><tr></tr><tr></tr><tr></tr>
                            <tr><th colspan="4">Address</th></tr>
                            <tr><td colspan="4"><% out.print(Add+" "+Dist+" "+State+" "+pincode+" "+country); %></td></tr>
                            <tr>
                                <th colspan="2"> courses</th> <th colspan="2">Fee </th></tr>
                            <tr>
                                <td colspan="2"><% out.print(courseName); %></td><td colspan="2"><% out.print(Fee); %></td>
                            </tr>
                            
                        </table>
                        <form method="post" action="StoreStudent.jsp">
                            <input type="hidden" name="update" value="<% out.print(update); %>">
                            <input type="hidden" name="StdId" value="<% out.print(StdId); %>">
                            <input type="hidden" name="sname" value="<% out.print(sname); %>">
                            <input type="hidden" name="fname" value="<% out.print(fname); %>">
                            <input type="hidden" name="dob" value="<% out.print(DOB); %>">
                            <input type="hidden" name="gender" value="<% out.print(gender); %>">
                            <input type="hidden" name="mob" value="<% out.print(mob); %>">
                            <input type="hidden" name="email" value="<% out.print(email); %>">
                            <input type="hidden" name="Add_date" value="<% out.print(Add_date); %>">
                            <input type="hidden" name="Add" value="<% out.print(Add); %>">
                            <input type="hidden" name="Dist" value="<% out.print(Dist); %>">
                            <input type="hidden" name="State" value="<% out.print(State); %>">
                            <input type="hidden" name="pincode" value="<% out.print(pincode); %>">
                            <input type="hidden" name="country" value="<% out.print(country); %>">
                            <input type="hidden" name="course" value="<% out.print(course); %>">
                            <input type="hidden" name="Fee" value="<% out.print(Fee); %>">
                            <button type="submit">Confirm The Above Data</button><button type="button" onclick="EditStaffDetail()">Edit The Above Data</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script type="text/javascript">
                function EditStaffDetail() {
                    window.history.go(-1);
                }
            </script>
        </div>
    </body>
</html>

