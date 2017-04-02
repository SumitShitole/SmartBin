<%-- 
    Document   : AddBin
    Created on : 1 Apr, 2017, 6:11:29 PM
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
	if(session.getAttribute("username") == null)
            {
                response.sendRedirect("index.jsp");                
            }
        %>
    </head>
    <body>
		<div align="right"><input type="button" onclick="location.href='logoutForAll.jsp';" value="Logout" /></div>
		<form action="dbInsertBin.jsp" method="POST">
		<table align="center">
		<tr>
			<td>Bin Id :</td>
			<td><input type="text" name="binId" maxlength="5" placeholder="bin id" /></td>
		</tr>
		<tr>
			<td>Description :</td>
			<td><input type="text" name="description" maxlength="30" placeholder="description" /></td>
		</tr>
		<tr>
			<td>Latitude :</td>
			<td><input type="text" name="latitude" maxlength="15" placeholder="latitude" /></td>
		</tr>
		<tr>
			<td>Longitude :</td>
			<td><input type="text" name="longitude" maxlength="15" placeholder="longitude" /></td>
		</tr>
                <tr>
			<td>Status :</td>
			<td><input type="text" name="status" maxlength="15" placeholder="status" /></td>
		</tr>
                <tr>
			<td>Address :</td>
			<td><input type="text" name="address" maxlength="30" placeholder="address" /></td>
		</tr>
		<input type="hidden" name="adminid" value="<%=session.getAttribute("userID")%>" />
		<tr>
			
			<td colspan="2" align="center"><input type="submit" name="submit" value="Add Bin" /></td>
		</tr>
		</table>
    </body>
</html>
