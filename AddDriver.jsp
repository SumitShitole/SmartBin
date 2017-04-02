<%-- 
    Document   : AddDriver
    Created on : 1 Apr, 2017, 8:28:46 PM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
	<%
            response.setHeader("Cache-Contorl", "no-cache");
            response.setHeader("Cache-Contorl", "no-store");
            response.setDateHeader("Expires", 1);
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control","no-cache, max-age=0, must-revalidate, no-store");			
            if(session.getAttribute("username") == null)
            {
                response.sendRedirect("index.jsp");                
            }
            
        %>
    </head>
    <body>
		<div align="right"><input type="button" onclick="location.href='logoutForAll.jsp';" value="Logout" /></div>
		<form action="dbInsertDriver.jsp" method="POST">
		<table align="center">
		<tr>
			<td>UserId :</td>
			<td><input type="text" name="userId" maxlength="5" placeholder="userid" /></td>
		</tr>
		<tr>
			<td>Full Name :</td>
			<td><input type="text" name="fullname" maxlength="20" placeholder="full name" /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="text" name="password" maxlength="10" placeholder="password" /></td>
		</tr>
		<tr>
			<td>Contact No :</td>
			<td><input type="text" name="contactno" maxlength="15" placeholder="contact no" /></td>
		</tr>
                        <input type="hidden" name="adminid" value="<%=session.getAttribute("userID")%>" />
		<tr>
			
			<td colspan="2" align="center"><input type="submit" name="submit" value="Add Driver" /></td>
		</tr>
		</table>
    </body>
</html>
