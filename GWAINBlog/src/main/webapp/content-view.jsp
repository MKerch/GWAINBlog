<%-- 
    Document   : blog
    Created on : Apr 25, 2018, 4:02:51 PM
    Author     : kerch
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.gwainblog.Article"%>
<%@page import="com.mycompany.gwainblog.ArticleDAOImpl"%>
<%@page import="com.mycompany.gwainblog.ArticleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" type="text/css" href="images/style.css" />
    </head>
    <body>
        <%
            ArticleDAO articleDAO = new ArticleDAOImpl();
        %>
    <center>
        <table style="padding-top: 20px;">
            <%@include file="WEB-INF/jspf/header.jsp"%> 
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                Article article = articleDAO.getArticleByIdAndUpdateView(id);
            %> 
            <tr>
                <td colspan="3">                                      
                    <%=article.getContent()%>                    
                </td>
            </tr>
            <%if (request.getUserPrincipal() != null && request.getUserPrincipal().getName()!=null) {
                    if (!article.getAuthor().equalsIgnoreCase(request.getUserPrincipal().getName())) {

            %>
            <tr>
                <td colspan="3">                                      
                    <form method="post" action="VoteServlet">
                        <input type="hidden" value="<%=article.getId()%>" name="articleId"/>
                        <input type="submit" value="Vote"/>
                    </form>
                </td>
            </tr>
            <%}
                }%>
            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>

</body>
</html>
