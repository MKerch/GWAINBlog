/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gwainblog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kerch
 */
@WebServlet(name = "AddArticaleServlet", urlPatterns = {"/AddArticaleServlet"})
public class AddArticaleServlet extends HttpServlet {

    private ArticleDAO articleDAO;

    @Override
    public void init() {
        articleDAO = new ArticleDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String shortDescription = req.getParameter("shortDescription");
        String content = req.getParameter("content");
        String author = req.getUserPrincipal().getName();
        Article article = new Article();
        article.setAuthor(author);
        article.setContent(content);
        article.setShortDescription(shortDescription);
        article.setTitle(title);
        articleDAO.add(article);
        resp.sendRedirect("main.jsp");
    }

}
