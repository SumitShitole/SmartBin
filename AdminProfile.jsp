<%-- 
    Document   : AdminProfile
    Created on : 1 Apr, 2017, 6:04:22 PM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<%@include file="checkCache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <script type="text/javascript">
            function show_bins() {
                document.getElementById("map").innerHTML='<object type="text/html" data="showAllBinsTable.jsp" style="height: 100%; width:100%;"></object>';
            }
            function show_map() {
                document.getElementById("map").innerHTML='<object type="text/html" data="showBinonMap.jsp" style="height: 100%; width:100%;"></object>';
            }
        </script>
    </head>
	<%		
	if(session.getAttribute("username") == null)
            {
                response.sendRedirect("index.jsp");
            }
        String message=request.getParameter("message");
        if(message!=null && message.equalsIgnoreCase("success"))
        {
            out.println("<font color='green'><blink>Insertion done Successfully !</blink></font>");
        }
        %>
    <body>			
	<div align="center"><h1><b><i><ul><%=session.getAttribute("username")%></ul></i></h1></div>
        <div align="right"><input type="button" onclick="location.href='logoutForAll.jsp';" value="Logout" /></div>
	<input type="button" onclick="location.href='AddDriver.jsp';" value="Add Driver" />
        <input type="button" onclick="location.href='AddBin.jsp';" value="Add Bin" />
        <input type="button" onclick="show_map();" value="View Bins on Map" />
        <div id="map" style="height: 480px;width: 100%;"></div>
    </body>
</html>
