<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Appoint New Staff</title>
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
                    <div id="show_Detail">
                    <% 
                        String update = request.getParameter("update");
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
                            if(update.equals("Store")){
                                if(staffCatagery.equals("Accademics")){ 
                                    sql="insert into Teacher values('"+StaffID+"', '"+Ename+"', '"+fname+"','"+DOB+"', '"+gender+"', '"+mob+"', '"+email+"', '"+Join_date+"', '"+Add+"', '"+Dist+"', '"+State+"', "+Pincode+", '"+Qualification+"', '"+Programme+"', "+Experience+")";
                                }
                                if(staffCatagery.equals("NonAccademics")){ 
                                    sql="insert into staff values('"+StaffID+"', '"+Ename+"', '"+fname+"','"+DOB+"', '"+gender+"', '"+mob+"', '"+email+"', '"+Join_date+"', '"+Add+"', '"+Dist+"', '"+State+"', "+Pincode+", '"+Qualification+"')";
                                }
                            }
                            if(update.equals("update")){
                                if(staffCatagery.equals("Accademics")){ 
                                    sql="UPDATE teacher SET `TeacherName` = '"+Ename+"', `FatherName` = '"+fname+"', `DOB` = '"+DOB+"', `Gender` = '"+gender+"', `MobileNo` = '"+mob+"', `EmailID` = '"+email+"', `DateOfJoining` = '"+Join_date+"', `Adress` = '"+Add+"', `District` = '"+Dist+"', `states` = '"+State+"', `Pincode` = "+Pincode+", `Qualification` = '"+Qualification+"', `Programme` = '"+Programme+"', `Experience` = "+Experience+" WHERE `Tch_Id` = '"+StaffID+"'";
                                }
                                if(staffCatagery.equals("NonAccademics")){ 
                                    sql="UPDATE staff SET `StaffName` = '"+Ename+"', `FatherName` = '"+fname+"', `DOB` = '"+DOB+"', `Gender` = '"+gender+"', `MobileNo` = '"+mob+"', `EmailID` = '"+email+"', `DateOfJoining` = '"+Join_date+"', `Adress` = '"+Add+"', `District` = '"+Dist+"', `states` = '"+State+"', `Pincode` = "+Pincode+", `Qualification` = '"+Qualification+" WHERE `Staff_Id` = '"+StaffID+"'";
                                }
                            }
                                
                            Statement stmt=myCon.createStatement();
                            int dataStored = stmt.executeUpdate(sql);
                            if(dataStored == 1){
                                if(update.equals("Store")){
                                    out.print("<center><h2>Your Registration Id is <i>"+StaffID+"</i></h2><br>");
                                    out.print("<h3 style='margin-bottom:20px;'>Keep it for future Reference.</h3></center>");
                                }
                                if(update.equals("update")){
                                    out.print("<center><h2 style='margin-bottom:20px;'>Your Information has beenn Updated</h2><br>");
                                }
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

