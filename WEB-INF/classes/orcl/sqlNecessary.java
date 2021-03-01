package orcl;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class sqlNecessary{   
    public static ResultSet execute(String sql) throws SQLException,ClassNotFoundException{
        Connection cn = getConnection();

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        return rs;
    }

    public static void closeDB() throws SQLException,ClassNotFoundException{
        Connection cn = getConnection();
        cn.close();
    }

    public static Connection getConnection() throws SQLException,ClassNotFoundException{
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // OracleÇ…ê⁄ë±Ç∑ÇÈ
        Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

        return cn;
    }
}