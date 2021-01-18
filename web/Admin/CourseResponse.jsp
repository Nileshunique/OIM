<%@page import="java.sql.*"%>
<%
    String cid = request.getParameter("cid");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
        String sql="SELECT * FROM course where Course_Id='"+cid+"'";
        Statement stmt=myCon.createStatement();
        ResultSet res=stmt.executeQuery(sql);
        if(res.next())
        {
            out.print("<hr><center><p><b><i>"+res.getString(1)+"</i></b> Course Id is already taken for <b><i>"+res.getString(2)+"</i></b> Course, please Choose another Course Id.</p></center>");
        }
    }
    catch(Exception e){out.print(e);}
    %>