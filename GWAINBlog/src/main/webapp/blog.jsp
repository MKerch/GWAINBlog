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
            List<Article> latestArticales = articleDAO.getLatestArticales();
            List<Article> mostRating = articleDAO.getMostRating();
            List<Article> mostWatched = articleDAO.getMostWatched();
        %>
    <center>
        <table style="padding-top: 20px;">
           <%@include file="WEB-INF/jspf/header.jsp"%> 
            <tr style="font-size: xx-large; padding-top: 50px">
                <td>Date</td>
                <td>Rating</td>
                <td>Most Watched</td>                
            </tr>
            <%for (int i = 0; i < latestArticales.size(); i++) {
                    Article dateArticle = latestArticales.get(i);
                    Article ratingArticle = mostRating.get(i);
                    Article watchedArticle = mostWatched.get(i);
            %> 
            <tr>
                <td>
                    <br>
                    <%=dateArticle.getTitle()%>
                    <br>
                    <%=dateArticle.getShortDescription()%>
                    <br>
                    Views: <%=dateArticle.getAmountOfView()%>  
                    <br>
                    Rating: <%=dateArticle.getShortDescription()%>
                    <br>
                    Date: <%=dateArticle.getDate()%>
                    <br>
                    Author: <%=dateArticle.getAuthor()%>
                </td>
                <td>
                    <br>
                    <%=ratingArticle.getTitle()%>
                    <br>
                    <%=ratingArticle.getShortDescription()%>
                    <br>
                    Views: <%=ratingArticle.getAmountOfView()%>  
                    <br>
                    Rating: <%=ratingArticle.getShortDescription()%>
                    <br>
                    Date: <%=ratingArticle.getDate()%>
                    <br>
                    Author: <%=ratingArticle.getAuthor()%>
                </td>
                <td>
                    <br>
                    <%=watchedArticle.getTitle()%>
                    <br>
                    <%=watchedArticle.getShortDescription()%>
                    <br>
                    Views: <%=watchedArticle.getAmountOfView()%>  
                    <br>
                    Rating: <%=watchedArticle.getShortDescription()%>
                    <br>
                    Date: <%=watchedArticle.getDate()%>
                    <br>
                    Author: <%=watchedArticle.getAuthor()%>
                </td>
            </tr>
            <%}%>
            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>

</body>
</html>
