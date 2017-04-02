<%-- 
    Document   : DriverProfile
    Created on : 1 Apr, 2017, 3:55:45 PM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="checkCache.jsp" %>
<%@ page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <script type="text/javascript">
            function show_bins() {
                document.getElementById("map").innerHTML='<object type="text/html" data="showBinonMap.jsp" style="height: 100%; width:100%;"></object>';
            }
            function show_routes() {
                document.getElementById("map").innerHTML='<object type="text/html" data="showRouteonMap.jsp" style="height: 100%; width:100%;"></object>';
            }
        </script>
    </head>
	<%		
	if(session.getAttribute("username") == null)
        {
            response.sendRedirect("index.jsp");            
        }
        %>
    <body>
        <div align="center"><h1><b><i><ul><%=session.getAttribute("username")%></ul></i></h1></div>
        <div align="right"><input type="button" onclick="location.href='logoutForAll.jsp';" value="Logout" /></div>
                <input type="button" onclick="show_bins();" value="Show bins" />
                <input type="button" onclick="show_routes();" value="Show Routes" />
                <div id="map" style="height: 480px;width: 100%;"></div>
    </body>
</html>