package com.mycompany.gwainblog;

import com.mysql.jdbc.Driver;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author kerch
 */
@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {
    @Resource(name="gwainDS")
    private DataSource ds;
    
   
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password1");

        try (Connection c = ds.getConnection()) {
            PreparedStatement ps = c.prepareStatement("INSERT INTO users(name, email, password) VALUES (?,?,MD5(?))");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        resp.sendRedirect("index.jsp");
    }

    /*private Connection getConnection() throws SQLException {
        //return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gwain_blog?useLegacyDatetimeCode=false&serverTimezone=America/New_York", "root", "111111");
    }*/

}
