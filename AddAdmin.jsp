<%-- 
    Document   : AddAdmin
    Created on : 1 Apr, 2017, 6:09:49 PM
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
	<%
			
	if(session.getAttribute("username") != null)
        {
                
        }
	else
	{
            response.sendRedirect("index.jsp");
	}
        %>
    </head>
    <body>
		<div align="right"><input type="button" onclick="location.href='logoutForAll.jsp';" value="Logout" /></div>
		<form action="dbInsertAdmin.jsp" method="POST">
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
		<input type="hidden" name="superadminid" value="<%=session.getAttribute("userID")%>" />
		<tr>
			
			<td colspan="2" align="center"><input type="submit" name="submit" value="Add Admin" /></td>
		</tr>
		</table>
    </body>
</html>
