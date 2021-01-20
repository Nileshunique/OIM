<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmStaffDetail.css">
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
                        String staffCatagery=request.getParameter("staffCatagery");
                        String Ename=request.getParameter("Ename");
                        String fname=request.getParameter("fname");
                        String DOB=request.getParameter("dob");
                        String gender=request.getParameter("gender");
                        String mob=request.getParameter("mob");
                        String email=request.getParameter("email");
                        String Join_date=request.getParameter("Join_date");
                        String Add=request.getParameter("Add");
                        String Dist=request.getParameter("Dist");
                        String State=request.getParameter("State");
                        String pincode=request.getParameter("pincode");
                        String Qualification=request.getParameter("Qualification");
                        String Programme=request.getParameter("Programme");
                        String Experience=request.getParameter("Experience");
                    %>
                    <div id="show_Detail">
                        <table>
                            <tr>
                                <th style="width:230px;">Employee Name</th><th style="width:230px;">Father Name</th><th style="width:180px;">Date Of Birth</th><th style="width:180px;">Gender</th>
                            </tr>
                            <tr>
                               <td style="width:230px;"><% out.print(Ename); %></td><td style="width:230px;"><% out.print(fname); %></td><td style="width:180px;"><% out.print(DOB); %></td><td style="width:180px;"><% out.print(gender); %></td>
                            </tr><tr></tr><tr></tr><tr></tr>
                            <tr>
                                <th>Mobile No.</th><th colspan="2">Email Id</th><th>Joining Date</th>
                            </tr>
                            <tr>
                                <td><% out.print(mob); %></td><td colspan="2"><% out.print(email); %></td><td><% out.print(Join_date); %></td>
                            </tr><tr></tr><tr></tr><tr></tr>
                            <tr><th colspan="4">Address</th></tr>
                            <tr><td colspan="4"><% out.print(Add+" "+Dist+" "+State+" "+pincode); %></td></tr>
                            <% 
                                if(staffCatagery.equals("Accademics")){ 
                            %>
                            <tr>
                                <th colspan="2"> Programmes</th> <th colspan="2">Experience </th></tr>
                            <tr>
                                <td colspan="2"><% out.print(Programme); %></td><td colspan="2"><% out.print(Experience); %></td>
                            </tr>
                            <% } %>
                            
                        </table>
                        <form method="post" action="UpdateStaff.jsp">
                            <input type="hidden" name="staffCatagery" value="<% out.print(staffCatagery); %>">
                            <input type="hidden" name="Ename" value="<% out.print(Ename); %>">
                            <input type="hidden" name="fname" value="<% out.print(fname); %>">
                            <input type="hidden" name="dob" value="<% out.print(DOB); %>">
                            <input type="hidden" name="gender" value="<% out.print(gender); %>">
                            <input type="hidden" name="mob" value="<% out.print(mob); %>">
                            <input type="hidden" name="email" value="<% out.print(email); %>">
                            <input type="hidden" name="Join_date" value="<% out.print(Join_date); %>">
                            <input type="hidden" name="Add" value="<% out.print(Add); %>">
                            <input type="hidden" name="Dist" value="<% out.print(Dist); %>">
                            <input type="hidden" name="State" value="<% out.print(State); %>">
                            <input type="hidden" name="pincode" value="<% out.print(pincode); %>">
                            <input type="hidden" name="Qualification" value="<% out.print(Qualification); %>">
                            <input type="hidden" name="Programme" value="<% out.print(Programme); %>">
                            <input type="hidden" name="Experience" value="<% out.print(Experience); %>">
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

