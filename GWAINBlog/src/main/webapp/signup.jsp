<%-- 
    Document   : signup
    Created on : Apr 16, 2018, 11:26:36 AM
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
        <table>
            <tr>
                <td><a href="index.jsp">Main page</a></td>
                <td><a href="AddArticaleServlet">New Article</a></td>
                <td><a href="LoginServlet">Login</a></td>
            </tr>
            <tr>
                <td>
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
            <tr>
                <td>
                    (c) 2018  All rights reserved   
                </td></tr>
        </table>
    </body>
</html>
