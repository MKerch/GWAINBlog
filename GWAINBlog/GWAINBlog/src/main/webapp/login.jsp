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
    <center>
        <table style="padding-top: 20px;">
            <%@include file="WEB-INF/jspf/header.jsp"%> 
            <tr>
                <td>
                    Login
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
                </td>
                <td>
                    
                    Signup
                    <br>
                    <form method="POST" action="SignupServlet">
                        <p>Username <br>
                            <input type="text" name="username"/>
                        </p>
                        <p>Email <br>
                            <input type="text" name="email"/>
                        </p>
                        <p>Password <br>
                            <input type="password" name="password1"/>
                        </p>
                        <p>Retype password <br>
                            <input type="password" name="password2"/>
                        </p>
                        <input type="submit"/> 

                    </form>    
                </td>
            </tr>
            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>
    </body>
</html>
