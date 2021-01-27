<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS View Attendance</title>
        <link rel="stylesheet" type="text/css" href="Css/mainlayout.css">
        <link rel="stylesheet" type="text/css" href="Css/View_Attendance.css">
        <script type="text/javascript" src="JavaScript/sidebarnav.js"></script>
    </head>
    <body>
        <% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
        %>
        <% 
            if((session.getAttribute("name")==null) && (session.getAttribute("usertype")!="Teacher"))
            {
                response.sendRedirect("../Login/Teacher_Login.jsp");
            } 
            
        %>
        <jsp:include page="sidebar.jsp"></jsp:include>
        <div id="Wrapper">
            <div id="Header">
                <div id="Logo"></div>
                <div id="Name">Welcome ${name}</div>
            </div>
            <div id="Content">
                <%
                    Date today = new Date();
                    SimpleDateFormat Date_Format = new SimpleDateFormat("YYYY-MM-dd");
                    String todaydate = Date_Format.format(today);
                    String Sdate=null, Edate=null;
                    Sdate=request.getParameter("Sdate");
                    Edate=request.getParameter("Edate");
                    
                    
                %>
                
                <div id="value">
                    <form method="post" action="">
                        <table style="text-decoration: none;">
                            <tr>
                                <th width="200px">Select Start Date</th><th width="200px">Select End Date</th>
                            </tr>
                            <tr>
                                <td><input type="date" name="Sdate"></td><td><input type="date" name="Edate" max="<%= todaydate%>"></td>
                            </tr>
                            <tr><td colspan="2"><button type="submit">Search</button></td></tr>
                        </table>
                    </form>
                    <table>
                    <%
                        int tr=0;
                        String Sid;
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","nilesh");
                            
                            Statement SStmt=myCon.createStatement();
                            Statement cStmt=myCon.createStatement();
                            ResultSet cRes=cStmt.executeQuery("select StdId, count(date) from attendance where Date BETWEEN '"+Sdate+"' AND '"+Edate+"' GROUP BY StdId");
                            while(cRes.next())
                            {
                                out.print("<table>");
                                Sid=cRes.getString(1);
                                tr=cRes.getInt(2); 
                                Statement Stmt=myCon.createStatement();
                                ResultSet res=Stmt.executeQuery("select StudentName from student where Id='"+Sid+"'");
                                while(res.next()){
                                    %>
                                    <tr>
                                        <th width="150px">Student Id</th><th width="350px">Student Name</th>
                                        <td></td>
                                        <th colspan="6">Result</th>
                                    </tr>
                                    <tr>
                                        <th rowspan="<%out.print((tr)/2+1);%>"><h2><% out.print(Sid); %></h2></th><th rowspan="<%out.print((tr)/2+1);%>"><h2><% out.print(res.getString(1)); %></h2></th>
                                        <th rowspan="<%out.print((tr)/2+1);%>"></th>
                                        <th width="110px">Date</th><th width="80px">Status</th><td></td>
                                        <th width="110px">Date</th><th width="80px">Status</th><td></td>
                                    </tr>
                                    <%
                                }
                                Statement mystmt=myCon.createStatement();
                                ResultSet myres = mystmt.executeQuery("select * from attendance where Date BETWEEN '"+Sdate+"' AND '"+Edate+"' AND StdId='"+Sid+"'");
                                for(int i=0;i<=tr/3;i++)
                                {
                                    out.print("<tr>");
                                    for(int j=0;j<2;j++)
                                    {
                                        while(myres.next())
                                        {
                                            %>
                                            <td><%out.print(myres.getString(2));%></td><td><%out.print(myres.getString(3));%></td><td></td>
                                            <%
                                        }
                                    }
                                    out.print("</tr>");
                                }
                                out.print("</table><hr><br>");
                            }
                            
                            %>
                    </table>
                       <% }
                        catch(Exception e)
                        {
                            out.print(e);
                        }
                        
                    %>
                 </div>
            </div>
            <div id="Footer">Copyright &copy 2018 IMS Created by Nilesh Kumar</div>
        </div>
    </body>
</html>

