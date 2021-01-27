<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | Admin | Student Username & Password Created</title>
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
                        String StdId=request.getParameter("StdId");
                        String pass=request.getParameter("pass");
                        try
                        {
                            String my = "0";
                            String StdID = "";
                            String StdName = "";
                            String StdDob = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            Statement stmtS=myCon.createStatement();
                            String sqlS="select STD_Id, StudentName, DOB from student where STD_Id='"+StdId+"'";
                            ResultSet resS = stmtS.executeQuery(sqlS); 
                            Statement stmtU=myCon.createStatement();
                            String sqlU="select UserName, password from useraccount";
                            ResultSet resU = stmtU.executeQuery(sqlU); 
                            while(resS.next()){
                                StdID = resS.getString(1);
                                StdName = resS.getString(2);
                                StdDob = resS.getString(3);
                                while(resU.next()){
                                    String STDID = resU.getString(1);
                                    if(StdID.equals(STDID)){
                                        my="1";
                                        out.print("<Center><h2>Username and password is already Created.</h2><br>");
                                        out.print("<h3>Username = "+resU.getString(1)+" <br> Password = "+resU.getString(2)+"</h3></center><br><br>");
                                    }
                                }
                            }
                            if(my == "0"){
                                Statement stmt=myCon.createStatement();
                                String sql = "Insert into useraccount values('"+StdID+"','"+pass+"','Student','"+StdName+"','"+StdDob+"')";
                                int dataStored = stmt.executeUpdate(sql);
                                if(dataStored == 1){
                                    out.print("<Center><h2>Username and password is Created Successfully.</h2>");
                                    out.print("<h3>Username = "+StdID+" <br> Password = "+pass+"</h3></center><br><br>");
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

