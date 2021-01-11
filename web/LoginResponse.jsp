<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm User</title>
    </head>
    <body>
        <%
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            String usertype=request.getParameter("usertype");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                String sql="select * from useraccount where UserName='"+user+"' and password='"+pass+"' and usertype='"+usertype+"'";
                Statement stmt=myCon.createStatement();
                ResultSet res=stmt.executeQuery(sql);
                if(res.next())
                {
                    session.setAttribute("user", user);
                    session.setAttribute("pass", pass);
                    session.setAttribute("usertype", usertype);
                    session.setAttribute("Id",res.getString(3));
                    session.setAttribute("name", res.getString(5));
                    if(usertype.equals("Admin")){
                        out.print(usertype);
                        response.sendRedirect("Admin/Dashboard.jsp");
                    }
                    else if(usertype.equals("Teacher")){
                        response.sendRedirect("Teacher/Dashboard.jsp");
                    }
                    else if(usertype.equals("Student")){
                        response.sendRedirect("Student/Dashboard.jsp");
                    }
                }
                else
                {
                    session.setAttribute("error_user", "Username or Password is wrong please try again");
                    response.sendRedirect("Login.jsp");
                }
            }
            catch(Exception e){
                out.print("please contact to the Admin or IT Departmenmt");
            }
        %>
    </body>
</html>
