  
<html>
<head>
<title>HOME</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
*{margin:0px;padding: 0px;}
body {background-color: #59b9c6;overflow: auto;}
#home {width: 75px; height: 80px; }
#footer{ padding: 5px 5px; background-color:white; position:absolute; margin-top:620px; height:25px; width:100%; font-size:20px; font-weight:bold; color:black; text-align:center}
#banner{ padding: 20px 10px; background-color:#3e6166; position:absolute; margin-top:50px; height:50px; width:100%; font-size:40px; font-weight:bold; color:white; text-align:center}
#set {width: 1000px; height: 375px; }
#photos{ background-color:#355384; position:absolute; margin-top:180px; margin-left:350px; height:340px; width:1000px; font-size:30px; color:white; text-align:center}
#login { background-color:#2BB958; position:absolute; margin-top:180px; height:350px; width:250px}
#admin { padding: 25px 50px; background-color:#288ba8; position:absolute; margin-top:0px; height:116px; width:250px; font-size:30px; color:white; text-align:center;}
#teacher { padding: 25px 50px; background-color:#299b49; position:absolute; margin-top:116px; height:116px; width:260px; font-size:30px; color:white; text-align:center;}
#student { padding: 25px 50px; background-color:#3c7cbc ; position:absolute; margin-top:240px; height:80px; width:250px; font-size:30px; color:white; text-align:center;}
#admin:hover {background-color:#19647a;color: white;}
#teacher:hover {background-color:#198437;color: white;}
#student:hover {background-color:#3074B8;color: white;}
</style>
</head>
<body>
<div id="banner">ONLINE INSTITUTE MANAGMENT(OIM) </div>
<div id ="login">
<a href="LOGIN/adminlogin.jsp"><div id ="admin"><img id="home" src="Student.png">Admin Login</div></a>
<a href="LOGIN/teacherlogin.jsp"><div id ="teacher"><img id="home" src="Admin.png">Teacher Login</div> </a>
<a href="LOGIN/studentlogin.jsp"><div id ="student"><img id="home" src="Teacher.png">Student Login</div></div></a>
<div id ="photos"><img id="set" src="schoolphoto.jpg"></div>
<div id ="footer"> Created By NILESH Kumar & NITIN, Course MCA , Enrolment No. 157798950 & 159612460 </div>
</body>
</html>