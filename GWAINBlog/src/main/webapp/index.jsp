<%-- 
    Document   : index
    Created on : Apr 22, 2018, 1:05:58 PM
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
    <%
        ArticleDAO articleDAO = new ArticleDAOImpl();
        List<Article> latestArticales = articleDAO.getLatestArticales();
        List<Article> mostRating = articleDAO.getMostRating();
        List<Article> mostWatched = articleDAO.getMostWatched();    
    %>
    
    
    <body>
        <table>
            <tr>
                <td><a href="index.jsp">Main page</a></td>
                <td><a href="main.jsp">Login</a></td>
                <td><a href="signup.jsp">Signup</a></td>
            </tr>
            <tr>
                <td>Date</td>
                <td>Rating</td>
                <td>Most Watched</td>                
            </tr>
            <tr>
                <td>
                    <table>
                        <%for(int i=0;i<latestArticales.size();i++){
                            Article article = latestArticales.get(i);
                        %>
                        <tr>
                            <td>
                                <br>
                                <%=article.getTitle()%>
                                <br>
                                <%=article.getShortDescription()%>
                                <br>
                                Views: <%=article.getAmountOfView()%>  
                                <br>
                                Rating: <%=article.getShortDescription()%>
                                <br>
                                Date: <%=article.getDate()%>
                                <br>
                                Date: <%=article.getAuthor()%>
                            </td>                            
                        </tr>   
                        <%}%>
                    </table>
                </td>
                <td>
                    <table>
                        <%for(int i=0;i<mostRating.size();i++){
                            Article article = mostRating.get(i);
                        %>
                        <tr>
                            <td>
                                <br>
                                <%=article.getTitle()%>
                                <br>
                                <%=article.getShortDescription()%>
                                <br>
                                Views: <%=article.getAmountOfView()%>  
                                <br>
                                Rating: <%=article.getShortDescription()%>
                                <br>
                                Date: <%=article.getDate()%>
                                <br>
                                Date: <%=article.getAuthor()%>
                            </td>                            
                        </tr>   
                        <%}%>
                    </table>
                </td>
                <td>
                    <table>
                        <%for(int i=0;i<mostWatched.size();i++){
                            Article article = mostWatched.get(i);
                        %>
                        <tr>
                            <td>
                                <br>
                                <%=article.getTitle()%>
                                <br>
                                <%=article.getShortDescription()%>
                                <br>
                                Views: <%=article.getAmountOfView()%>  
                                <br>
                                Rating: <%=article.getShortDescription()%>
                                <br>
                                Date: <%=article.getDate()%>
                                <br>
                                Date: <%=article.getAuthor()%>
                            </td>                            
                        </tr>   
                        <%}%>
                    </table>
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
