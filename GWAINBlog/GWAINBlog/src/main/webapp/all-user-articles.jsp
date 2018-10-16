<%-- 
    Document   : main
    Created on : Apr 17, 2018, 2:00:50 PM
    Author     : kerch
--%>

<%@page import="com.mycompany.gwainblog.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gwainblog.ArticleDAOImpl"%>
<%@page import="com.mycompany.gwainblog.ArticleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%  String user = request.getUserPrincipal().getName();
            ArticleDAO articleDAO = new ArticleDAOImpl();
            List<Article> articles = articleDAO.getAllArticlesByAuthor(user);
        %>
    <center>
        <table>
            <tr>
                <%@include file="WEB-INF/jspf/header.jsp"%> 
            </tr>
        </table>
        <table>            
            <tr>
                <td>
                    <table width="100%" border="1" align="center" cellpadding="10" >
                        <tr>                                        
                        </tr>
                        <tr>
                             <%@include  file="WEB-INF/jspf/left.jsp" %>
                        </tr>
                    </table>

                </td>
                <td width="75%" >
                    <table>
                        <%for (int i = 0; i < articles.size()-2; i=i+2) {%>                        
                        <tr>
                            <td>
                                <br>
                                <a href="main.jsp?id=<%=articles.get(i).getId()%>"><%=articles.get(i).getTitle()%></a>
                                <br>
                                <%=articles.get(i).getShortDescription()%>
                                <br>
                                Views: <%=articles.get(i).getAmountOfView()%>  Rating: <%=articles.get(i).getAmountOfVouting()%> Date: <%=articles.get(i).getDate()%>
                            </td>
                            <td>
                                <br>
                                <a href="main.jsp?id=<%=articles.get(i+1).getId()%>"><%=articles.get(i+1).getTitle()%></a>
                                <br>
                                <%=articles.get(i+1).getShortDescription()%>
                                <br>
                                Views: <%=articles.get(i+1).getAmountOfView()%>  Rating: <%=articles.get(i).getAmountOfVouting()%> Date: <%=articles.get(i+1).getDate()%>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </td>
            </tr>

            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>
</body>
</html>
