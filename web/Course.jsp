<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OIM | View Course List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ViewRunningBatch.css">
        <script src="../JavaScript/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <div class="Outer">
            <div class="Header">
                <div class="HeaderContent InstituteLogo"><img src="Image/InstituteLogo.jpg" alt="Logo" width="100px" Height="70px"></div>
                <div class="HeaderContent InstituteName"><a href=http://localhost:8080/OIM/index.html>Onilne Institute Management</a></div>
                <div class="HeaderContent Links">
                    <a href="index.html">Home</a>
                    <a href="Login.jsp">Login</a>
                    <a href="AboutUs.html">About Us</a>
                    <a href="ContactUs.html">Contact Us</a>
                </div>
            </div>
            <div class="Container">
                <div id="Content">
                    <div id="show_Detail">
                    <h1>List Of Courses</h1>
                        <table> 
                            <tr><th width="100px">Course ID</th><th width="300px">Course Name</th><th width="150px">Course Duration</th><th width="50px">Fee</th>
                            </tr>
                    <% 
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sqlC="select * from course";
                            Statement stmtC=myCon.createStatement();
                            ResultSet resC=stmtC.executeQuery(sqlC);
                            while(resC.next()){
                                out.print("<tr><td>"+resC.getString(1)+"</td><td>"+resC.getString(2)+"</td><td>"+resC.getString(3)+"</td><td>"+resC.getInt(4)+"</td></tr>");
                            }
                        }
                        catch(Exception e){out.println(e);}
                    %>
                    

                        </table>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>

