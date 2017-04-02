<%-- 
    Document   : Login
    Created on : 1 Apr, 2017, 10:17:26 AM
    Author     : Sumit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="checkCache.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Bin</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        
<script>  
function validateform(){     
    var name=document.Loginform.name.value;  
    var password=document.Loginform.password.value;  

    if (name==null || name==""){  
      alert("Name can't be blank");
      document.getElementById("name").focus();
      return false;  
    }else if(password.length>10 || password.length<5){  
      alert("Password must be 5 to 10 characters long.");  
      document.getElementById("password").focus();
      return false;  
      }

}  
</script>
    </head>
    <body>
	<%
            if(session.getAttribute("username") != null)
            {
                response.sendRedirect("logoutForAll.jsp");
            }
	%>
        <h1 align="center">WELCOME</h1><hr>
    <marquee><h2>Smart Bin Alert System</h2></marquee><hr>
            <form name="Loginform" action="dbLoginCheck.jsp" method="POST" onsubmit="return validateform()">
		<table align="center" >
                <tr>
                    <td colspan=2 align="center"><h3>Login</h3></td>
		</tr>
		<tr>
			<td>Username :</td>
                        <td><input type="text" id="name" name="username" placeholder="Enter Username" maxlength="10"></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" id="password" name="password" placeholder="Enter Password" maxlength="10"></td>
		</tr>
                <tr>
                        <td>Login As :</td>
                        <td>
                            <select name="utype">
                                <option value="superadmin">Super Admin</option>
                                <option value="admin">Admin</option>
                                <option value="driver" selected>Driver</option>
                            </select>
                        </td>
                </tr>
                <tr>
			<td colspan=2 align="center"><input type="submit" name="submit" value="Login"></td>
		</tr>
                </table>
       </form>
    </body>
</html>
