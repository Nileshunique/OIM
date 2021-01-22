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
                    <form action="ConfirmStaffDetail.jsp" method="post" >
                        <div id="staffCatagery"><span>Employee Type</span>
                            <span><input type="radio" name="staffCatagery" value="Accademics" class="staffCatagery">Academics</span>
                            <span><input type="radio" name="staffCatagery" value="NonAccademics" class="staffCatagery"  checked="checked">Non Academics</span>
                        </div>
                        <input type="hidden" name="StaffId" id="StaffId">
                        <fieldset>
                            <legend>Employee Registration Form</legend>
                            <table class="NonAccademics">
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="Ename" placeholder="Name" style="width:200px;height:20px;"></td>
                                
                                    <td>Father Name</td>
                                    <td><input type="text" name="fname" placeholder="Father name"  style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><select style="width:205px;height:25px;" name="gender">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select></td>
                                
                                    <td>Date Of Birth</td>
                                    <td><input type="date" name="dob"  style="width:200px;height:20px;" max="2000-12-31"></td>
                                </tr>
                                <tr>
                                    <td>Email ID</td>
                                    <td><input type="email" name="email"  style="width:200px;height:20px;" placeholder="Enter Email Id"</td>
                                
                                    <td>Mobile Number</td>
                                    <td><input type="tel" name="mob" placeholder="enter 10 no only"  style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Date Of Joining</td>
                                    <td><input type="date" name="Join_date" style="width:200px;height:20px;" min="2021-01-01"></td>
                                
                                    <td>Address</td>
                                    <td><input type="text" name="Add" placeholder="Addres"  style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>District</td>
                                    <td><input type="text" name="Dist" placeholder="District" style="width:200px;height:20px;"></td>
                                    
                                    <td>State</td>
                                    <td><input type="text" name="State" placeholder="State" style="width:200px;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td>Pincode</td>
                                    <td><input type="number" name="pincode" placeholder="Pincode" style="width:200px;height:20px;"></td>
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
                            </table>
                            <table class="Accademics">
                                <tr>    
                                    <td style="height:50px;">Teacher's Programmes</td>
                                    <td><select id="Programme"  style="width:250px;height:25px;" name="Programme">
                                            <option value=""></option>
                                            <option value="Diploma Course">Diploma Courses(4-5 Experience Require)</option>
                                            <option value="Certificate Coures">Certificate Coures(1-2 Experience Require)</option>
                                            <option value="Advanced Designing">Advanced Designing(5-6 Experience Require)</option>
                                            <option value="Advanced Programming">Advanced Programming(above 5 Experience Require)</option>
                                        </select></td>
                                        <td>Teachers Experience</td>
                                        <td><input type="number" id="Experience" name="Experience" placeholder="Experience in Years" style="width:200px;height:20px;"></td>
                                </tr>
                            </table>
                            <table class="NonAccademics">
                                <tr><td style="padding-top:80px;"></td><td><input type="submit" value="submit" id="submitbtn"></td><td><input type="reset" value="Reset"></td></tr>
                            </table>
                        </fieldset>
                    </form>
                </div>
             </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            <script src="JS/AddNewStaff.js"></script>
        </div>
    </body>
</html>




