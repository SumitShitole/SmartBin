<%-- 
    Document   : dbInsertAdmin
    Created on : 1 Apr, 2017, 6:12:19 PM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*,java.io.*"%>
<%@include file="dbConnection.jsp" %>
<%@include file="checkCache.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
    </head>
    <body>
	<%
	try
	{
            connection = DriverManager.getConnection(Host, "root", "root");
            statement = connection.createStatement();
            String Data = "insert into admin values('"+request.getParameter("userId")+"','"+request.getParameter("fullname")+"','"+request.getParameter("password")+"','"+request.getParameter("contactno")+"','"+request.getParameter("superadminid")+"')";
            int success=statement.executeUpdate(Data);
            if(success==1)
            {
                out.print(success);
                response.sendRedirect("SuperAdminProfile.jsp?message=success");
            }
            rs.close();
            statement.close();
            connection.close();
	} 
        catch (Exception ex) {
            ex.printStackTrace();
	}
	%>
    </body>
</html>
