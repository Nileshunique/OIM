
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sql Commands</title>
    </head>
    <body>
    <h2>you are here</h2>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                Statement stmt=myCon.createStatement();
                //createing table useraccount
                //String createUserAccount="CREATE TABLE useraccount (`UserName` VARCHAR(10) NOT NULL, `password` VARCHAR(8) NOT NULL, `ID` VARCHAR(10) NOT NULL, `usertype` VARCHAR(10) NOT NULL, `name` VARCHAR(25) NOT NULL, `DOB` DATE NOT NULL, PRIMARY KEY (`UserName`))";
                //stmt.executeUpdate(createUserAccount);
                //Inserting data in userAccount
                //String InsertIntoUserAccount1 = "insert into useraccount values ('Nilesh1', 'nilesh1', 'Nilesh1', 'Admin', 'Nilesh', '1998-02-21')";
                //stmt.executeUpdate(InsertIntoUserAccount1);
                
            }
            catch(Exception e){
                out.print("please contact to the Admin or IT Departmenmt" +e);
            }
        %>
    </body>
</html>
