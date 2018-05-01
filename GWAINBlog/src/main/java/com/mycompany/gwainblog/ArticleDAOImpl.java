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
    public void delete(int articleId) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement("DELETE FROM article where id=?");
            ps.setInt(1, articleId);
            ps.execute();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void update(int articleId, Article newArticle) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement("update article SET title=?,content=?, short_description=?, date_created=? WHERE id=?");
            ps.setString(1, newArticle.getTitle());
            ps.setString(2, newArticle.getContent());
            ps.setString(3, newArticle.getShortDescription());
            long currentTime = System.currentTimeMillis();
            ps.setDate(4, new Date(currentTime));
            ps.setInt(5, articleId);
            ps.execute();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public List<Article> getAllArticlesByAuthor(String author) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article WHERE user_id=(SELECT id FROM gwain_blog.users WHERE name=?) ORDER BY date_created DESC LIMIT 10");
            ps.setString(1, author);
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
                article.setId(rs.getInt("id"));
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
                    "SELECT article.*, users.name FROM gwain_blog.article join users on article.user_id=users.id  ORDER BY date_created DESC LIMIT 5");
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
                article.setId(rs.getInt("id"));
                article.setAuthor(rs.getString("name"));
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
                    "SELECT article.*, users.name FROM gwain_blog.article join users on article.user_id=users.id ORDER BY AMOUNT_OF_VOUTING DESC LIMIT 5");
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
                article.setId(rs.getInt("id"));
                article.setAuthor(rs.getString("name"));
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
                    "SELECT article.*, users.name FROM gwain_blog.article join users on article.user_id=users.id ORDER BY amount_of_view DESC LIMIT 5");
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
                article.setId(rs.getInt("id"));
                article.setAuthor(rs.getString("name"));
                list.add(article);
            }
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public Article getArticleById(int id) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement("SELECT article.*, users.name FROM article JOIN users ON (users.id=article.user_id and article.id=?)");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            Article article = new Article();
            while (rs.next()) {
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                article.setShortDescription(rs.getString("short_description"));
                article.setAmountOfView(rs.getInt("amount_of_view"));
                article.setAmountOfVouting(rs.getInt("amount_of_vouting"));
                article.setDate(rs.getDate("date_created"));
                article.setId(rs.getInt("id"));
                article.setAuthor(rs.getString("name"));
            }
            return article;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public List<Article> getSearcheResult(String searchKey) {
        try (Connection c = getConnection()) {
            PreparedStatement ps = c.prepareStatement(
                    "SELECT * FROM gwain_blog.article where title like ? or content like ? or short_description like ?");
            ps.setString(1, "%" + searchKey + "%");
            ps.setString(2, "%" + searchKey + "%");
            ps.setString(3, "%" + searchKey + "%");
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
                article.setId(rs.getInt("id"));
                list.add(article);
            }
            System.out.println("Search size:" + list.size());
            return list;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void vote(int articleId, String user) {
        try (Connection c = getConnection()) {
            c.setAutoCommit(false);
            PreparedStatement validationStatement = c.prepareStatement("SELECT count(*) FROM user_article_vote "
                    + "WHERE article_id=? and user_id=(SELECT id FROM users WHERE name=?)");
            validationStatement.setInt(1, articleId);
            validationStatement.setString(2, user);
            ResultSet rs = validationStatement.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
            }
            if (count == 0) {

                PreparedStatement validationStatement2
                        = c.prepareStatement("SELECT article.*, users.name FROM article JOIN users ON (users.id=article.user_id and article.id=?)");
                validationStatement2.setInt(1, articleId);
                ResultSet rs2 = validationStatement2.executeQuery();
                boolean isDifferentAuthor = true;
                while (rs2.next()) {
                    String articleAuthor = rs2.getString("name");
                    if (articleAuthor.equalsIgnoreCase(user)) {
                        isDifferentAuthor = false;
                    }
                }

                if (isDifferentAuthor) {
                    PreparedStatement validationStatement3 = c.prepareStatement("SELECT COUNT(*) FROM users WHERE name=?");
                    validationStatement3.setString(1, user);
                    ResultSet rs3 = validationStatement3.executeQuery();
                    int amountOfUsers = 0;
                    while (rs3.next()) {
                        amountOfUsers = rs3.getInt(1);
                    }
                    if (amountOfUsers > 0) {

                        PreparedStatement increaseStataement = c.prepareStatement("UPDATE article SET amount_of_vouting=1+amount_of_vouting where article.id=?");
                        increaseStataement.setInt(1, articleId);
                       
                        increaseStataement.execute();

                        PreparedStatement ps = c.prepareStatement("INSERT INTO user_article_vote(article_id, user_id) VALUES(?, (SELECT id FROM users WHERE name=?))");
                        ps.setInt(1, articleId);
                        ps.setString(2, user);
                        ps.execute();
                    }
                }

            }
            c.commit();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

}
