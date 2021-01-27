<div class="Header">
    <div class="HeaderContent InstituteLogo"><img src="http://localhost:8080/OIM/Image/InstituteLogo.jpg" alt="Logo" width="100px" Height="70px"></div>
    <div class="HeaderContent InstituteName"><a href=http://localhost:8080/OIM/index.html>Online Institute Management</a></div>
    <div class="HeaderContent Links">
        <a href="http://localhost:8080/OIM/Teacher/Dashboard.jsp">Teacher Dashboard | </a><a href="http://localhost:8080/OIM/Logout.jsp"><% out.print(session.getAttribute("name")+" "); %>Logout</a>
    </div>
</div>