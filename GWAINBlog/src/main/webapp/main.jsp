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
        <%String user = request.getUserPrincipal().getName();
        ArticleDAO articleDAO = new ArticleDAOImpl();%>

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
                            <%@include  file="WEB-INF/jspf/left.jsp" %>
                        </tr>
                    </table>
                </td>
                <td width="75%" >

                    <%if (request.getParameter("search") != null) {
                     List<Article> searchResultList = articleDAO.getSearcheResult(request.getParameter("search"));
                    %>
                    
                    <table>
                        <%for (int i = 0; i < searchResultList.size();i++) {%>                        
                        <tr>
                            <td>
                                <br>
                                <a href="main.jsp?id=<%=searchResultList.get(i).getId()%>"><%=searchResultList.get(i).getTitle()%></a>
                                <br>
                                <%=searchResultList.get(i).getShortDescription()%>
                                <br>
                                Views: <%=searchResultList.get(i).getAmountOfView()%>  Rating: <%=searchResultList.get(i).getAmountOfVouting()%> Date: <%=searchResultList.get(i).getDate()%>
                            </td>
                            <% if(i+1<searchResultList.size()){ %>
                            <td>
                                <br>
                                <a href="main.jsp?id=<%=searchResultList.get(i+1).getId()%>"><%=searchResultList.get(i+1).getTitle()%></a>
                                <br>
                                <%=searchResultList.get(i+1).getShortDescription()%>
                                <br>
                                Views: <%=searchResultList.get(i+1).getAmountOfView()%>  Rating: <%=searchResultList.get(i).getAmountOfVouting()%> Date: <%=searchResultList.get(i+1).getDate()%>
                            </td>
                            <% i++;}%>
                        </tr>
                        <%}%>
                    </table>
                    
                    

                    <%} else if (request.getParameter("id") == null) {%>
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
