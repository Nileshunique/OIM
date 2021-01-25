<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/ConfirmStaffDetail.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
    <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
        %>
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
                    <div id="show_Detail">
                        <%
                            String update = request.getParameter("update");
                            String cid = request.getParameter("cid");
                            String cname = request.getParameter("cname");
                            String cdur = request.getParameter("cdur");
                            String cfee = request.getParameter("cfee");
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                                if(cfee!=null){
                                    int fee=Integer.parseInt(cfee);
                                    if(update.equals("update")){
                                        String sql="UPDATE course SET `Duration` = '"+cdur+"', `Fee` = "+cfee+" WHERE `Course_Id` = '"+cid+"'";
                                    }
                                    else{
                                        String sql=" INSERT INTO course (`Course_Id`, `CourseName`, `Duration`, `Fee`) VALUES ('"+cid+"', '"+cname+"', '"+cdur+"', "+fee+");";
                                    }
                                    Statement stmt=myCon.createStatement();
                                    stmt.executeUpdate(sql);
                                    if(update.equals("update")){
                                        out.print("<h1>Course is Updated into Database.</h1>");
                                    }
                                    else{
                                        out.print("<h1>Course is Stored into Database</h1>");
                                    }
                                    out.print("<h1><a href='ViewCourseList.jsp'> Click Here to See </a></h1>");
                                }
                                
                            }
                            catch(Exception e){out.print(e);}
                        %>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
        </div>
    </body>
</html>