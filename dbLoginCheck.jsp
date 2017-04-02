<%-- 
    Document   : dbLoginCheck
    Created on : 1 Apr, 2017, 10:19:31 AM
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
            statement = connection.createStatement();
            String Data = "select * from "+request.getParameter("utype")+" where userid='"+request.getParameter("username")+"' and password='"+request.getParameter("password")+"';";
            rs=statement.executeQuery(Data);
            if(rs.next())
            {
		session.setAttribute("username",rs.getString("fullname"));
		session.setAttribute("userID",rs.getString("userid"));
                if(rs.getInt("userid") <= 20000)
                {
                    response.sendRedirect("SuperAdminProfile.jsp");
                }
                else if(rs.getInt("userid") >= 20000 && rs.getInt("userid") <= 29999)
                {
                    response.sendRedirect("AdminProfile.jsp");
                }
                else
                {
                    response.sendRedirect("DriverProfile.jsp");
                }
            }
            else
            {
                response.sendRedirect("index.jsp");
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
