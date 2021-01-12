
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
                //String createUserAccount="CREATE TABLE useraccount (`UserName` VARCHAR(10) NOT NULL, `password` VARCHAR(8) NOT NULL, `ID` VARCHAR(10) NOT NULL, `usertype` VARCHAR(10) NOT NULL, `name` VARCHAR(25) NOT NULL, `DOB` DATE NOT NULL, PRIMARY KEY (`UserName`))";
                //stmt.executeUpdate(createUserAccount);
                //String InsertIntoUserAccount1 = "insert into useraccount values ('Nilesh1', 'nilesh1', 'Nilesh1', 'Admin', 'Nilesh', '1998-02-21')";
                //stmt.executeUpdate(InsertIntoUserAccount1);
                //String CreateStudent = "CREATE TABLE student (`STD_Id` VARCHAR(10),`StudentName` VARCHAR(25) not null,`FatherName` VARCHAR(25) not null,`DOB` date not null,`Gender` VARCHAR(10) NOT NULL,`MobileNo` varchar(10) NOT NULL,`EmailID` VARCHAR(40),`DateOfAdmission` DATE NOT NULL,`Adress` VARCHAR(50) NOT NULL,`District` VARCHAR(20) NOT NULL,`states` VARCHAR(20) NOT NULL, `Pincode` int UNSIGNED NOT NULL,`Country` varchar(15) not null,`Course_Id`varchar(15) not null,`Batch_Id` varchar(10) not null,PRIMARY KEY (`STD_Id`))";
                //stmt.executeUpdate(CreateStudent);
                //String CreateCourse = "create table course(`Course_Id` varchar(10) not null,`CourseName` varchar(40) not null,`Duration` varchar(10) not null,`Fee` int not null,PRIMARY KEY (`Course_Id`))";
                //stmt.executeUpdate(CreateCourse);
                //String CreateTeacher = "CREATE TABLE teacher (`Tch_Id` VARCHAR(10) not null,`TeacherName` VARCHAR(25) not null,`FatherName` VARCHAR(25) not null,`DOB` date not null,`Gender` VARCHAR(10) NOT NULL,`MobileNo` varchar(10) NOT NULL,`EmailID` VARCHAR(40),`DateOfJoining` DATE NOT NULL,`Adress` VARCHAR(50) NOT NULL,`District` VARCHAR(20) NOT NULL,`states` VARCHAR(20) NOT NULL,`Pincode` int UNSIGNED NOT NULL,`Country` varchar(15) not null,PRIMARY KEY (`Tch_Id`))";
                //stmt.executeUpdate(CreateTeacher);
                //String CreateBatch = "create table batch(`Batch_Id` varchar(10) not null,`BatchTime` time not null,`Tch_Id` varchar(10) not null,`Course_Id` varchar(10) not null,foreign key(`Tch_Id`) References teacher(`Tch_Id`),foreign key(`Course_Id`) References course(`Course_Id`),primary key (Batch_Id));";
                //stmt.executeUpdate(CreateBatch);
                //String InsertIntoCourse1 = "INSERT INTO oim.course VALUES ('BCC', 'Basic Computer Course', '3 Months', 3000)";
                //stmt.executeUpdate(InsertIntoCourse1);
                //String InsertIntoCourse2 = "INSERT INTO oim.course VALUES ('TALLY', 'TALLY', '3 Months', 3000)";
                //stmt.executeUpdate(InsertIntoCourse2);
                //String InsertIntoCourse3 = "INSERT INTO oim.course VALUES ('PHOTOSHOP', 'PHOTOSHOP', '2 Months', 4000)";
                //stmt.executeUpdate(InsertIntoCourse3);
                //String InsertIntoCourse4 = "INSERT INTO oim.course VALUES ('DTP', 'Desktop Publishing', '4 Months', 8000)";
                //stmt.executeUpdate(InsertIntoCourse4);
                //INSERT INTO oim.student VALUES ('STD0121003', 'Vicky Shah', 'Shyam Sundar Shah', '1995-07-03', 'Male', '9890989098', 'Vicky1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'PHOTOSHOP', 'MOR0809')

                //String InsertIntoStudent1 = "INSERT INTO oim.student VALUES ('STD0121001', 'Nilesh Kumar', 'Pawan Kumar', '1998-02-21', 'Male', '9890989098', 'nilesh1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'BCC', 'MOR0708')";
                //stmt.executeUpdate(InsertIntoStudent1);
                //String InsertIntoStudent2 = "INSERT INTO oim.student VALUES ('STD0121002', 'Nitin', 'Nawal Kisore', '1994-11-05', 'Male', '9890989098', 'nitin1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'TALLY', 'MOR0708')";
                //stmt.executeUpdate(InsertIntoStudent2);
                //String InsertIntoStudent3 = "INSERT INTO oim.student VALUES ('STD0121003', 'Vicky Shah', 'Shyam Sundar Shah', '1995-07-03', 'Male', '9890989098', 'Vicky1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'PHOTOSHOP', 'MOR0809')";
                //stmt.executeUpdate(InsertIntoStudent3);
                //String InsertIntoStudent4 = "";
                //stmt.executeUpdate(InsertIntoStudent4);
                //String InsertIntoStudent5 = "";
                //stmt.executeUpdate(InsertIntoStudent5);

                out.print("Data Inserted");

            }
            catch(Exception e){
                out.print("please contact to the Admin or IT Departmenmt" +e);
            }
        %>
    </body>
</html>
