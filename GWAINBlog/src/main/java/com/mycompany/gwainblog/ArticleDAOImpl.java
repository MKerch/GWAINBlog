/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gwainblog;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author kerch
 */
public class ArticleDAOImpl implements ArticleDAO {

    static {
        try {
            DriverManager.registerDriver(new Driver());//Class.forName(className); or like this

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void add(Article article) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "insert into gwain_blog.article (title, content, short_description, amount_of_view, amount_of_vouting, user_id, date_created) VALUES (?,?,?,?,?, (SELECT id FROM gwain_blog.users WHERE name=?),? )");
            ps.setString(1, article.getTitle());
            ps.setString(2, article.getContent());
            ps.setString(3, article.getShortDescription());
            ps.setInt(4, 0);
            ps.setInt(5, 0);
            ps.setString(6, article.getAuthor());
            long currentTime = System.currentTimeMillis();
            ps.setDate(7, new Date(currentTime));
            ps.execute();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void delete(Article article) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Article oldArticle, Article newArticle) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Article> getAllArticlesByAuthor(String author) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article WHERE user_id=(SELECT id FROM gwain_blog.users WHERE name=?)");
            ResultSet rs = ps.executeQuery();
            List<Article> list = new ArrayList();
            while (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setShortDescription(rs.getString("short_description"));
                article.setAmountOfView(rs.getInt("amount_of_view"));
                article.setAmountOfVouting(rs.getInt("amount_of_vouting"));
                article.setDate(rs.getDate("date_created"));
                list.add(article);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    private Connection getConnection() throws Exception {
        // InitialContext ctx = new InitialContext();
        //  DataSource ds = (DataSource) ctx.lookup("gwainDS");
        //  return ds.getConnection();
        //JNDI
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gwain_blog?useLegacyDatetimeCode=false&serverTimezone=America/New_York", "root", "111111");
    }

    @Override
    public List<Article> getLatestArticales() {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article ORDER BY date_created LIMIT 5");
            ResultSet rs = ps.executeQuery();
            List<Article> list = new ArrayList();
            while (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setShortDescription(rs.getString("short_description"));
                article.setAmountOfView(rs.getInt("amount_of_view"));
                article.setAmountOfVouting(rs.getInt("amount_of_vouting"));
                article.setDate(rs.getDate("date_created"));
                list.add(article);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public List<Article> getMostRating() {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article ORDER BY AMOUNT_OF_VOUTING LIMIT 5");
            ResultSet rs = ps.executeQuery();
            List<Article> list = new ArrayList();
            while (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setShortDescription(rs.getString("short_description"));
                article.setAmountOfView(rs.getInt("amount_of_view"));
                article.setAmountOfVouting(rs.getInt("amount_of_vouting"));
                article.setDate(rs.getDate("date_created"));
                list.add(article);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public List<Article> getMostWatched() {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article ORDER BY amount_of_view LIMIT 5");
            ResultSet rs = ps.executeQuery();
            List<Article> list = new ArrayList();
            while (rs.next()) {
                Article article = new Article();
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setShortDescription(rs.getString("short_description"));
                article.setAmountOfView(rs.getInt("amount_of_view"));
                article.setAmountOfVouting(rs.getInt("amount_of_vouting"));
                article.setDate(rs.getDate("date_created"));
                list.add(article);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

}