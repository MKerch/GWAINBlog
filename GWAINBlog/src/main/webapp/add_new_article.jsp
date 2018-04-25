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
        <table>
            <tr>
                <td><a href="index.jsp">Main page</a></td>
                <td><a href="add_new_article.jsp">Add Article</a></td>
                <td><a href="LogoutServlet">Logout</a></td>
            </tr>
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
                <td>
                    <form method="POST" action="AddArticaleServlet">
                        <p>Title<br>
                            <input type="text" name="title"/>
                        </p>
                        <p>Short description<br>
                            <input type="text" name="shortDescription"/>
                        </p>
                        <p>Content<br>
                            <textarea name="content" rows="50" cols="100">
                            </textarea>
                        </p>
                        <input type="submit"/>
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                    (c) 2018  All rights reserved   
                </td>
            </tr>
        </table>
    </body>
</html>
