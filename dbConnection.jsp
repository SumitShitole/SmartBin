<%-- 
    Document   : dbConnection
    Created on : 1 Apr, 2017, 10:00:02 AM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<html>
    <%
        String Host="jdbc:mysql://localhost:3306/smartbin";
        Connection connection=null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Host, "root", "root");
    %>
</html>
