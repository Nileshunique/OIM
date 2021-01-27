<% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
    if((session.getAttribute("name")==null) && (session.getAttribute("usertype")!="Student"))
    {
        response.sendRedirect("../Login.jsp");
    } 
%>