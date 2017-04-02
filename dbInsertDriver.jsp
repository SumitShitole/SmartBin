<%-- 
    Document   : dbInsertDriver
    Created on : 1 Apr, 2017, 6:14:31 PM
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
        int success=0;
	try
	{          
            
            statement = connection.createStatement();
            String Data = "insert into driver values('"+request.getParameter("userId")+"','"+request.getParameter("fullname")+"','"+request.getParameter("password")+"','"+request.getParameter("contactno")+"','"+request.getParameter("adminid")+"')";
            success=statement.executeUpdate(Data);
            out.print(success);
            if(success==1)
            {
                out.print(success);
                response.sendRedirect("AdminProfile.jsp?message=success");
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
