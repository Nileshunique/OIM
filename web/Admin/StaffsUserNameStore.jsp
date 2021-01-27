<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Staff Username & Password Created</title>
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
                        
                        String staff=request.getParameter("staff");
                        String id=request.getParameter("id");
                        String pass=request.getParameter("pass");
                        try
                        {
                            Date DOB = new Date();
                            SimpleDateFormat Date_Format = new SimpleDateFormat("YYYY-MM-dd");
                            String StaffDob = Date_Format.format(DOB); 

                            String my = "0";
                            String StaffID = "";
                            String StaffName = "";
                            String sqlS = "";
                            String sql = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            Statement stmtS=myCon.createStatement();
                            if(staff.equals("teacher")){
                                sqlS="select Tch_Id, TeacherName, DOB from teacher where Tch_Id='"+id+"'";
                            }
                            if(staff.equals("staff")){
                                sqlS="select Staff_Id, StaffName, DOB from staff where Staff_Id='"+id+"'";
                            }
                            ResultSet resS = stmtS.executeQuery(sqlS); 

                            Statement stmtU=myCon.createStatement();
                            String sqlU="select UserName, password from useraccount";
                            ResultSet resU = stmtU.executeQuery(sqlU); 

                            while(resS.next()){
                                StaffID = resS.getString(1);
                                StaffName = resS.getString(2);
                                StaffDob = resS.getString(3);
                                while(resU.next()){
                                    String STAFFID = resU.getString(1);
                                    if(StaffID.equals(STAFFID)){
                                        my="1";
                                        out.print("<Center><h2>Username and password is already Created.</h2><br>");
                                        out.print("<h3>Username = "+resU.getString(1)+" <br> Password = "+resU.getString(2)+"</h3></center><br><br>");
                                    }
                                }
                            }
                            if(my == "0"){
                                Statement stmt=myCon.createStatement();
                                if(staff.equals("teacher")){
                                    sql = "Insert into useraccount values('"+StaffID+"','"+pass+"','Teacher','"+StaffName+"','"+StaffDob+"')";
                                }
                                if(staff.equals("staff")){
                                    sql = "Insert into useraccount values('"+StaffID+"','"+pass+"','Staff','"+StaffName+"','"+StaffDob+"')";
                                }
                                int dataStored = stmt.executeUpdate(sql);
                                if(dataStored == 1){
                                    out.print("<Center><h2>Username and password is Created Successfully.</h2>");
                                    out.print("<h3>Username = "+StaffID+" <br> Password = "+pass+"</h3></center><br><br>");
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

