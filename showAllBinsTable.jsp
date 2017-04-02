<%-- 
    Document   : showAllBinsTable
    Created on : 1 Apr, 2017, 4:43:18 PM
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
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <table border="1">
            <tr>
                <td>BinId</td>
                <td>Description</td>
                <td>Latitude</td>
                <td>Longitude</td>
                <td>Admin of Bin</td>
                <td>Status</td>
                <td>Installation date</td>
                <td>Address</td>
            </tr>
	<%
	try
	{
            connection = DriverManager.getConnection(Host, "root", "root");
            statement = connection.createStatement();
            String Data = "select * from bins;";
            rs=statement.executeQuery(Data);
            while(rs.next())
            {%>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
            </tr>
            <%}
            
            rs.close();
            statement.close();
            connection.close();
	} 
        catch (Exception ex) {
            ex.printStackTrace();
	}
	%>
        </table>
    </body>
</html>
