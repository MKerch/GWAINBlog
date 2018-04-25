<%-- 
    Document   : login.jsp
    Created on : Apr 17, 2018, 1:47:31 PM
    Author     : kerch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Please enter login and password</h1>
        <br>

        <form method="POST" action="j_security_check">
            <p>Username:<br>
                <input type="text" name="j_username"/> 
            </p>
            <p>Password:<br>
                <input type="password" name="j_password"/> 
            </p>
            <input type="submit" value="Submit"/> 
        </form>
        
        
        <br>
        <br>
        <br>
        
        <form name="loginForm" method="POST" action="j_security_check">
            <p>User name: <input type="text" name="j_username" size="20"/></p>
            <p>Password: <input type="password" size="20" name="j_password"/></p>
            <p>  <input type="submit" value="Submit"/></p>
        </form>     
        
    </body>
</html>
