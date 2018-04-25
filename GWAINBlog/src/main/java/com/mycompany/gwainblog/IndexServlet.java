/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gwainblog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kerch
 */
@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {

    private ArticleDAO articleDAO;

    @Override
    public void init() {
        articleDAO = new ArticleDAOImpl();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       ArticleDAO articleDAO = new ArticleDAOImpl();
        
        StringBuilder page = new StringBuilder();
        List<Article> latestArticales = articleDAO.getLatestArticales();
        List<Article> mostRating = articleDAO.getMostRating();
        List<Article> mostWatched = articleDAO.getMostWatched();
        page.append("<%-- \n"
                + "    Document   : index\n"
                + "    Created on : Apr 22, 2018, 1:05:58 PM\n"
                + "    Author     : kerch\n"
                + "--%>\n"
                + "\n"
                + "<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>\n"
                + "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <head>\n"
                + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "        <title>JSP Page</title>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <table>\n"
                + "            <tr>\n"
                + "                <td><a href=\"index.html\">Main page</a></td>\n"
                + "                <td><a href=\"main.jsp\">Login</a></td>\n"
                + "                <td><a href=\"signup.jsp\">Signup</a></td>\n"
                + "            </tr>\n"
                + "            <tr>\n"
                + "                <td>Date</td>\n"
                + "                <td>Rating</td>\n"
                + "                <td>Most Watched</td>                \n"
                + "            </tr>\n"
                
                + "            <tr>\n"
                + "                <td>Date</td>\n"
                + "                <td>Rating</td>\n"
                + "                <td>Most Watched</td>                \n"
                + "            </tr>\n"
                
                
                + "            <tr>\n"
                + "                <td>\n"
                + "                    (c) 2018  All rights reserved   \n"
                + "                </td>\n"
                + "            </tr>\n"
                + "        </table>\n"
                + "    </body>\n"
                + "</html>\n"
                + "");
    }

}
