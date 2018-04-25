<%-- 
    Document   : main
    Created on : Apr 17, 2018, 2:00:50 PM
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
        <table>
            <%@include file="WEB-INF/jspf/header.jsp"%> 
            <tr>
                <td>
                    <table>
                        <tr>
                                <td>
                                    <ul>
                                        <li><a href="">Add new article</a></li>
                                        <li><a href="">Statistics</a></li>
                                    </ul>
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>
    </body>
</html>
