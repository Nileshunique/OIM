<% response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");
    if((session.getAttribute("name")==null) && (session.getAttribute("usertype")!="Teacher"))
    {
        response.sendRedirect("../Login.jsp");
    } 
%>