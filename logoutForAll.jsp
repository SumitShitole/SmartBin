<%-- 
    Document   : logoutForAll
    Created on : 1 Apr, 2017, 10:32:21 AM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("username");
			session.removeAttribute("userID");
            session.invalidate();
            response.setHeader("Cache-Contorl", "no-cache");
            response.setHeader("Cache-Contorl", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control","no-cache, max-age=0, must-revalidate, no-store");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
