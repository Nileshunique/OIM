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
                    <div id="show_Detail">
                    <% 
                        String StaffID=request.getParameter("StaffID");
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
                        String Pincode=request.getParameter("pincode");
                        String Qualification=request.getParameter("Qualification");
                        String Programme=request.getParameter("Programme");
                        String Experience=request.getParameter("Experience");
                        try
                        {
                            String sql = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            if(staffCatagery.equals("Accademics")){ 
                                sql="insert into Teacher values('"+StaffID+"', '"+Ename+"', '"+fname+"','"+DOB+"', '"+gender+"', '"+mob+"', '"+email+"', '"+Join_date+"', '"+Add+"', '"+Dist+"', '"+State+"', "+Pincode+", '"+Qualification+"', '"+Programme+"', "+Experience+")";
                            }
                            if(staffCatagery.equals("NonAccademics")){ 
                                sql="insert into staff values('"+StaffID+"', '"+Ename+"', '"+fname+"','"+DOB+"', '"+gender+"', '"+mob+"', '"+email+"', '"+Join_date+"', '"+Add+"', '"+Dist+"', '"+State+"', "+Pincode+", '"+Qualification+"')";
                            }
                            Statement stmt=myCon.createStatement();
                            int dataStored = stmt.executeUpdate(sql);
                            if(dataStored == 1){
                                out.print("<center><h2>Your Registration Id is <i>"+StaffID+"</i></h2><br>");
                                out.print("<h3 style='margin-bottom:20px;'>Keep it for future Reference.</h3></center>");
                            }
                        }
                        catch(Exception e){out.print("Please contact to Your IT Head <br>"+e+"<br><div style='margin-bottom:20px;width:100px;height:390px;'></div>");}
                    %>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>
