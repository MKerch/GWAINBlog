/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gwainblog;

import java.util.List;

/**
 *
 * @author kerch
 */
public interface ArticleDAO {

    public void add(Article article);

    public void delete(Article article);

    public void update(Article oldArticle, Article newArticle);

    public List<Article> getAllArticlesByAuthor(String author);

    public List<Article> getLatestArticales();

    public List<Article> getMostRating();

    public List<Article> getMostWatched();
}
