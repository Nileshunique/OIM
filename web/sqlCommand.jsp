
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

                //String CreateStudent = "CREATE TABLE student (`STD_Id` VARCHAR(12),`StudentName` VARCHAR(25) not null,`FatherName` VARCHAR(25) not null,`DOB` date not null,`Gender` VARCHAR(10) NOT NULL,`MobileNo` varchar(10) NOT NULL,`EmailID` VARCHAR(40),`DateOfAdmission` DATE NOT NULL,`Adress` VARCHAR(50) NOT NULL,`District` VARCHAR(20) NOT NULL,`states` VARCHAR(20) NOT NULL, `Pincode` int UNSIGNED NOT NULL,`Country` varchar(15) not null,`Course_Id`varchar(15) not null, `Fee` int UNSIGNED not null,PRIMARY KEY (`STD_Id`))";
                //stmt.executeUpdate(CreateStudent);
                //String InsertIntoStudent1 = "INSERT INTO oim.student VALUES ('STD0121001', 'Nilesh Kumar', 'Pawan Kumar', '1998-02-21', 'Male', '9890989098', 'nilesh1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'BCC', 'MOR0708', 4000)";
                //stmt.executeUpdate(InsertIntoStudent1);
                //String InsertIntoStudent2 = "INSERT INTO oim.student VALUES ('STD0121002', 'Nitin', 'Nawal Kisore', '1994-11-05', 'Male', '9890989098', 'nitin1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'TALLY', 'MOR0708', 8000)";
                //stmt.executeUpdate(InsertIntoStudent2);
                //String InsertIntoStudent3 = "INSERT INTO oim.student VALUES ('STD0121003', 'Vicky Shah', 'Shyam Sundar Shah', '1995-07-03', 'Male', '9890989098', 'Vicky1@gmail.com', '2021-01-12', 'Gurgaon', 'Gurgaon', 'Haryana', 122001, 'India', 'PHOTOSHOP', 'MOR0809', 6000)";
                //stmt.executeUpdate(InsertIntoStudent3);
                
                //String CreateCourse = "create table course(`Course_Id` varchar(10) not null,`CourseName` varchar(40) not null,`Duration` varchar(10) not null,`Fee` int not null,PRIMARY KEY (`Course_Id`))";
                //stmt.executeUpdate(CreateCourse);
                //String InsertIntoCourse1 = "INSERT INTO oim.course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('AD', 'Advanced Designing', '3 Months', 6000);";
                //stmt.executeUpdate(InsertIntoCourse1);
                //String InsertIntoCourse2 = "INSERT INTO oim.course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('AP', 'Advanced Programming', '3 Months', 6000);";
                //stmt.executeUpdate(InsertIntoCourse2);
                //String InsertIntoCourse3 = "INSERT INTO oim.course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('CC', 'Certificate Course', '6 Months', 8000);";
                //stmt.executeUpdate(InsertIntoCourse3);
                //String InsertIntoCourse4 = "INSERT INTO oim.course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('DC', 'Diploma Course', '2 Years', 20000);";
                //stmt.executeUpdate(InsertIntoCourse4);
                
                //String CreateTeacher = "CREATE TABLE teacher (`Tch_Id` VARCHAR(12) not null,`TeacherName` VARCHAR(25) not null,`FatherName` VARCHAR(25) not null,`DOB` date not null,`Gender` VARCHAR(10) NOT NULL,`MobileNo` varchar(10) NOT NULL,`EmailID` VARCHAR(40),`DateOfJoining` DATE NOT NULL,`Adress` VARCHAR(50) NOT NULL,`District` VARCHAR(20) NOT NULL,`states` VARCHAR(20) NOT NULL,`Pincode` int UNSIGNED NOT NULL,`Qualification` varchar(15) not null,`Programme` varchar(25) not null,`Experience` int UNSIGNED NOT NULL,PRIMARY KEY (`Tch_Id`))";
                //stmt.executeUpdate(CreateTeacher);


                //String CreateStaff = "CREATE TABLE staff (`Staff_Id` VARCHAR(12) not null,`StaffName` VARCHAR(25) not null,`FatherName` VARCHAR(25) not null,`DOB` date not null,`Gender` VARCHAR(10) NOT NULL,`MobileNo` varchar(10) NOT NULL,`EmailID` VARCHAR(40),`DateOfJoining` DATE NOT NULL,`Adress` VARCHAR(50) NOT NULL,`District` VARCHAR(20) NOT NULL,`states` VARCHAR(20) NOT NULL,`Pincode` int UNSIGNED NOT NULL,`Qualification` varchar(15) not null,PRIMARY KEY (`Staff_Id`))";
                //stmt.executeUpdate(CreateStaff);

                //String CreateBatch = "create table Batch(`BatchName` varchar(10) not null, `Course_Id` varchar(10) unique key, `Day1` varchar(10),`Day2` varchar(10),`Day3` varchar(10), `TimeSlot` varchar(18) not null, foreign key(`Course_Id`) References course(`Course_Id`));";
                //stmt.executeUpdate(CreateBatch);
                //INSERT INTO oim.batch (`BatchName`, `Course_Id`, `Day1`, `Day2`, `Day3`, `TimeSlot`) VALUES ('BCH01', 'AD', 'Monday', 'Wednesday', 'Friday', 'Morning (10 - 01)');

                //String CreateFeeReceipt = "create table FeeReceipt(`Receipt_Id` varchar(12) not null,`STD_Id` varchar(12) not null,`PaidAmount` int UNSIGNED not null,`Date` date not null, `Staff_Id` varchar(12) not null, foreign key(`STD_Id`) references student(`STD_Id`), foreign key(`Staff_Id`) references staff(`Staff_Id`),PRIMARY KEY (`Receipt_Id`));";
                //stmt.executeUpdate(CreateFeeReceipt);
                

                out.print("Data Inserted");

            }
            catch(Exception e){
                out.print("please contact to the Admin or IT Departmenmt" +e);
            }
        %>
    </body>
</html>
