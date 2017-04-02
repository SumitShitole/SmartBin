<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="checkCache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
	<%
            if(session.getAttribute("username") != null)
            {
                response.sendRedirect("logoutForAll.jsp");
            }
	%>
        <div align="right"><input type="button" onclick="location.href='Login.jsp';" value="Login"/></div>
        <b><h1 align="center">WELCOME</h1><hr>
            <marquee><h2>Smart Bin Alert System</h2></marquee></b><hr>
        <div align="center">
            <b>Team Name :</b> JSCOE-COMP_SIG_1<br><br>
            <b>Team Members</b><br>
            Sandip Karande<br>
            Priyanka Bhosale<br>
            Prasanna Kadam<br>
            Abhijith Nair<br>
            Nikhilesh Satnurkar<br>
            Sumit Shitole<br><br>
            <b>Mentors</b><br>
            Prof. Dattatray Waghole<br>
            Prof. Nikhilkumar Shardoor<br>
        </div>
    </body>
</html>
