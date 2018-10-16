<%-- 
    Document   : left
    Created on : Apr 30, 2018, 9:40:04 PM
    Author     : kerch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<td width="25%" valign="top" align="left">
    Hello, <%=user%>!!!<br><br>
    <form action="main.jsp" method="get">
        <p>
            <input type="text" size="40" name="search">
            <input type="submit" value="search">
        </p>
    </form>
    <p><a href="all-user-articles.jsp">All articles of <%=user%>: </a><br></p>
    <p><a href="main.jsp">Add new article</a><BR></p>
    <p><a href="main.jsp?statistics=true">Statistics</a></p>
</td>