<%-- 
    Document   : checkCache
    Created on : 1 Apr, 2017, 10:35:56 AM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%
            response.setHeader("Cache-Contorl", "no-cache");
            response.setHeader("Cache-Contorl", "no-store");
            response.setDateHeader("Expires", 1);
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control","no-cache, max-age=0, must-revalidate, no-store");
       %>
    </head>
    <body>
     
    </body>
</html>
