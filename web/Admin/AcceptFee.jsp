<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OIM Teacher Registration</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/PayFee.css">
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
                    <div id="show_Detail">
                    <% 
                        Date today = new Date();
                        SimpleDateFormat Date_Format = new SimpleDateFormat("yyyy-MM-dd");
                        String todaydate = Date_Format.format(today); 
                        String ReceiptId = request.getParameter("ReceiptId");
                        String CourseFee = request.getParameter("CourseFee");
                        String STDid = request.getParameter("StdId");
                        String Fee = request.getParameter("fee");
                        String Staff_Id = (String)session.getAttribute("Id");
                        int balance = Integer.parseInt(CourseFee)-Integer.parseInt(Fee); 
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myCon =DriverManager.getConnection("jdbc:mysql://localhost:3306/oim?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
                            String sql="insert into feereceipt (`Receipt_Id`, `STD_id`, `PaidAmount`, `Date`, `Staff_Id`) values('"+ReceiptId+"', '"+STDid+"',"+Fee+",'"+todaydate+"', '"+Staff_Id+"')";
                            Statement stmt=myCon.createStatement();
                            int receiptGenerated = stmt.executeUpdate(sql);
                            if(receiptGenerated == 1){
                                String sql1="update student set `Fee`="+balance+" where `STD_Id`='"+STDid+"'";
                                Statement stmt1=myCon.createStatement();
                                int studentFeeUpdate = stmt1.executeUpdate(sql1);
                                if(studentFeeUpdate == 1){
                                    out.print("<center><h2>Your Receipt id Number is <i>"+ReceiptId+"</i></h2><br>");
                                    out.print("<h3 style='margin-bottom:20px;'>Keep it for future Reference.</h3></center>");
                                }
                            }
                            else{
                                out.print("<center><h2>Receipt No "+ReceiptId+" is already create</h2></center>");
                            }

                        }
                        catch(Exception e){out.print("Please contact to Your IT Head <br>"+e+"<br><div style='margin-bottom:20px;width:100px;height:390px;'></div>");} 
                    %>
                    </div>
                </div>
            </div>
            <div class="Footer">Project Created by Nilesh Kumar & Nitin</div>
            
        </div>
    </body>
</html>




