<%-- 
    Document   : main
    Created on : Apr 17, 2018, 2:00:50 PM
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
        <title>JSP Page</title>

    </head>
    <body>
        <%String user = request.getUserPrincipal().getName();%>
    <center>
        <table>
            <tr>
                <%@include file="WEB-INF/jspf/header.jsp"%> 
            </tr>
        </table>
        <table >            
            <tr>
                <td>
                    <table width="100%" border="1" align="center" cellpadding="10" >
                        <tr>                                        
                        </tr>
                        <tr>
                            <td width="25%" valign="top" align="left">
                                Hello, <%=user%>!!!<br><br>
                                <form action="search.jsp" method="get">
                                    <p><input type="text" size="=40" name="search">
                                        <input type="submit" value="search"></p>
                                </form>
                                <p><a href="all-user-articles.jsp">All publications of <%=user%>: </a><br></p>
                                <p>   <a href="addNews.jsp">Add news</a><BR></p>
                                <p> <a href="GraphicServlet">Statistics</a></p>
                            </td>
                        </tr>
                    </table>

                </td>
                <td width="75%" >

                    <%if (request.getParameter("id") == null) {%>
                    <form action="AddArticaleServlet" method="post">
                        <p>
                            Title<br>
                            <input type="text" name="title"><br>
                        </p>
                        <p>
                            Short description<br>
                            <textarea cols="45" rows="5" name="shortDescription"></textarea></p>
                        <p>
                            Content<br>
                            <textarea cols="55" rows="15" name="content"></textarea></p>
                        <p>
                            <input type="submit" name="submitNews" value="GO!!!">
                    </form>
                    <%} else {
                        ArticleDAO articleDAO = new ArticleDAOImpl();
                        int id = Integer.parseInt(request.getParameter("id"));
                        Article article = articleDAO.getArticleById(id);
                    %>

                    <form action="UpdateArticleServlet" method="post">
                        <p>
                            Title<br>
                            <input type="text" name="title" value="<%=article.getTitle()%>" ><br>
                        </p>
                        <p>
                            Short description<br>
                            <textarea cols="45" rows="5" name="shortDescription">
                                <%=article.getShortDescription()%>
                            </textarea></p>
                        <p>
                            Content<br>
                            <textarea cols="55" rows="15" name="content">
                                <%=article.getContent()%>
                            </textarea></p>
                        <p>
                            <input type="hidden" name="id" value="<%=id%>"/>
                            <input type="submit" name="submitNews" value="Update">
                    </form>
                            
                    <form action="DeleteArticleServlet" method="post">
                        <input type="hidden" name="id" value="<%=id%>"/>
                        <input type="submit" name="submitNews" value="Delete">
                    </form>        

                    <%}%>                    
                </td>
            </tr>

            <%@include file="WEB-INF/jspf/footer.jsp"%> 
        </table>
    </center>
</body>
</html>
