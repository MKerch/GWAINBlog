<%@page import="com.mycompany.gwainblog.Article"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gwainblog.ArticleDAO"%>
<%@page import="com.mycompany.gwainblog.ArticleDAOImpl"%>
<% ArticleDAO dao = new ArticleDAOImpl();
    String author = request.getUserPrincipal().getName();
    List<Article> articles = dao.getAllArticlesByAuthor(author);
%>



<script>
            window.onload = function () {

        //Better to construct options first and then pass it as a parameter
                var options = {
                    title: {
                        text: "Rating"
                    },
                    data: [
                        {
                            // Change type to "doughnut", "line", "splineArea", etc.
                            type: "column",
                            dataPoints: [
                                        <%for(Article article: articles){%>
                                            {label: "<%=article.getDate()%>", y: <%=article.getAmountOfVouting()%>},
                                         <%}%>
                            ]
                        }
                    ]
                };
                
                var options2 = {
                    title: {
                        text: "View"
                    },
                    data: [
                        {
                            // Change type to "doughnut", "line", "splineArea", etc.
                            type: "column",
                            dataPoints: [
                                <%for(Article article: articles){%>
                                            {label: "<%=article.getDate()%>", y: <%=article.getAmountOfView()%>},
                                <%}%>
                            ]
                        }
                    ]
                };


                $("#chartContainer").CanvasJSChart(options);
                
                $("#chartContainer2").CanvasJSChart(options2);
            }
        </script>
    </head>
        <div id="chartContainer" style="height: 300px; width: 100%;"></div>
        <div id="chartContainer2" style="height: 300px; width: 100%;"></div>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    