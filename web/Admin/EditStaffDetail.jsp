<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OIM Teacher Registration</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/AddNewStaff.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
    </head>
    <body>
        <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");%>
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
                        String Staff_Id = request.getParameter("Staff_Id");
                        String staff = request.getParameter("staff");
                        String id = request.getParameter("id");
                        try{ 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sql="select * from "+staff+" where "+id+" = '"+Staff_Id+"'";
                            //out.print("<p>"+sql+"</p>");
                            Statement stmt=myCon.createStatement();
                            ResultSet resT=stmt.executeQuery(sql);
                            %>
                                <script type="text/javascript">
                                    if("<%= staff %>" == "teacher")
                                    var Teachers = [<% while(resT.next()){out.print("'"+staff+"','"+resT.getString(1)+"', '"+resT.getString(2)+"', '"+resT.getString(3)+"','"+resT.getString(4)+"','"+resT.getString(5)+"','"+resT.getString(6)+"','"+resT.getString(7)+"','"+resT.getString(8)+"','"+resT.getString(9)+"','"+resT.getString(10)+"','"+resT.getString(11)+"','"+resT.getInt(12)+"','"+resT.getString(13)+"','"+resT.getString(14)+"','"+resT.getInt(15)+"'");} %>];
                                    
                                    if("<%= staff %>" == "staff")
                                        Teachers = [<% while(resT.next()){out.print("'"+staff+"','"+resT.getString(1)+"','"+resT.getString(2)+"','"+resT.getString(3)+"','"+resT.getString(4)+"','"+resT.getString(5)+"','"+resT.getString(6)+"','"+resT.getString(7)+"','"+resT.getString(8)+"','"+resT.getString(9)+"','"+resT.getString(10)+"','"+resT.getString(11)+"','"+resT.getInt(12)+"'");} %>];
                                        
                                </script>
                            <% 
                        }
                        catch(Exception e){out.println(e);}
                    %>
                    <form action="ConfirmStaffDetail.jsp" method="post" >
                        <input type="hidden" name="update" value="update">
                        <input type="hidden" name="staffCatagery" id="staffCatagery">
                        <input type="hidden" name="StaffId" id="StaffId">
                        <fieldset>
                            <legend>Employee Detail Update Form</legend>
                            <table class="NonAccademics">
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="Ename" id="Ename" placeholder="Name" style="width:200px;height:20px;"></td>
                                
                                    <td>Father Name</td>
                                    <td><input type="text" name="fname" id="fname" placeholder="Father name" style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><select style="width:205px;height:25px;" name="gender">
                                            <option></option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select></td>
                                
                                    <td>Date Of Birth</td>
                                    <td><input type="date" name="dob" id="dob"  style="width:200px;height:20px;" max="2000-12-31"></td>
                                </tr>
                                <tr>
                                    <td>Email ID</td>
                                    <td><input type="email" name="email" id="email"  style="width:200px;height:20px;" placeholder="Enter Email Id"></td>
                                
                                    <td>Mobile Number</td>
                                    <td><input type="tel" name="mob" id="mob" placeholder="enter 10 no only"  style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Date Of Joining</td>
                                    <td><input type="date" name="Join_date" id="Join_date" style="width:200px;height:20px;" min="2021-01-01"></td>
                                
                                    <td>Address</td>
                                    <td><input type="text" name="Add" id="Add" placeholder="Addres"  style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>District</td>
                                    <td><input type="text" name="Dist" id="Dist" placeholder="District" style="width:200px;height:20px;"></td>
                                    
                                    <td>State</td>
                                    <td><input type="text" name="State" id="State" placeholder="State" style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Pincode</td>
                                    <td><input type="number" name="pincode" id="pincode" placeholder="Pincode" style="width:200px;height:20px;"></td>
                                    <td>Highest Qualification</td>
                                    <td><select name="Qualification" style="width:205px;height:25px;">
                                        <option></option>
                                        <option value="10th">10th</option>
                                        <option value="12th">12th</option>
                                        <option value="Certification">Certification in Computer</option>
                                        <option value="Diploma">Diploma</option>
                                        <option value="Graduate">Graduate</option>
                                        <option value="PostGraduate">Post Graduate</option>
                                        <option value="PHD">PHD</option>
                                        </select></td>
                                </tr>
                                <tr id="tch">    
                                    <td style="height:50px;">Teacher&rsquo;s Programmes</td>
                                    <td><select id="Programme"  style="width:250px;height:25px;" name="Programme">
                                                <option value=""></option>
                                            <%
                                                try{ 
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                                    String sqlC="select Course_Id, CourseName from course";
                                                    Statement stmt=myCon.createStatement();
                                                    ResultSet resC=stmt.executeQuery(sqlC);
                                                    while(resC.next()){
                                                        out.print("<option value="+resC.getString(1)+">"+resC.getString(2)+"</option>");
                                                    }
                                                    
                                                }
                                                catch(Exception e){out.println(e);}
                                            %>
                                            </select>
                                        </td>
                                        <td>Teachers Experience</td>
                                        <td><input type="number" id="Experience" name="Experience" placeholder="Experience in Years" style="width:200px;height:20px;"></td>
                                </tr>
                            
                                <tr><td style="padding-top:80px;"></td><td><input type="submit" value="submit" id="submitbtn"></td><td><input type="reset" value="Reset"></td></tr>
                            </table>
                        </fieldset>
                    </form>
                </div>
             </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/EditStaffDetail.js"></script>
        </div>
    </body>
</html>




