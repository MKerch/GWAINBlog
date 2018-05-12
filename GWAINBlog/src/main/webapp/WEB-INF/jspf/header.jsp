<%-- 
    Document   : header
    Created on : Apr 25, 2018, 4:46:19 PM
    Author     : kerch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<tr>
    <td><input type="image" src="images/logo.png" onclick="location.href = 'blog.jsp'"></td>
    <td><input type="image" src="images/but_new.png" 
               onmouseover="src = 'images/but_new_in.png'"
               onmouseout="src = 'images/but_new.png'"
               onclick="location.href = 'main.jsp'"></td>
        <% if (request.getUserPrincipal() != null) {%>
    <td>
        <input type="image" src="images/but_logout.png"
               onmouseover="src = 'images/but_logout_in.png'"
               onmouseout="src = 'images/but_logout.png'"
               onclick="location.href = 'LogoutServlet'">                    
    </td>
    <%} else {%>

    <td>
        <input type="image" src="images/but_login_in.png"
               onmouseover="src = 'images/but_login_in.png'"
               onmouseout="src = 'images/but_login.png'"
               onclick="location.href = 'main.jsp'">                    
    </td>
    <%}%>
</tr>