<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/login.css">
    </head>
    <body>
        <div class="Outer">
            <div class="Header">
                <div class="HeaderContent InstituteLogo"><img src="Image/InstituteLogo.jpg" alt="Logo" width="100px" Height="70px"></div>
                <div class="HeaderContent InstituteName"><a href=http://localhost:8080/OIM/index.html>Onilne Institute Management</a></div>
                <div class="HeaderContent Links">
                    <a href="index.html">Home</a>
                    <a href="Login.html">Login</a>
                    <a href="AboutUs.html">About Us</a>
                    <a href="ContactUs.html">Contact Us</a>
                    <a href="Course.html">Courses</a>
                </div>
            </div>
                <div class="Container">
                    <div id="Content">
                    
                        <form action="LoginResponse.jsp" method="post" id="form">
                            <% if(session.getAttribute("error_user")==null){}%>${error_user}
                            <fieldset>
                                <legend>Admin Login</legend>
                                    <table>
                                        <tr><td>Who are You</td><td>
                                            <Select name="usertype" style="width:250px;height:20px;">
                                                <option Value="Admin">Admin / Staff</option>
                                                <option Value="Teacher">Teacher</option> 
                                                <option Value="Student">Student</option>                                        
                                            </select>
                                        </td></tr>
                                        <tr><td>UserName</td><td><input type="text" name="user" value="Nilesh1" placeholder="--USERNAME--" style="width:250px;height:20px;"></td></tr>
                                        <tr><td>Password</td><td><input type="password" name="pass" value="nilesh1" placeholder="--PASSWORD--" style="width:250px;height:20px;"></td></tr>
                                        <tr><td>Captcha</td><td><img src="Image/Frame1.jpg" alt="Captcha" style="width:250px;height:100px;"></td></tr>
                                        <tr><td>Enter The Captcha</td><td><input type="text" name="Captcha" placeholder="--Captcha--" style="width:250px;height:20px;"></td></tr>
                                        <tr><td><button class="login" type="submit">Submit</button></td><td><button class="login" type="reset">Reset</button></td></tr>
                                    </table>
                            </fieldset>
                        </form>
                    </div>
                </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    </body>
    </html>
