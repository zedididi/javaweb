package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/10/12  12:14
 * @package: connectDB
 * @project: webHomework
 */
//连接数据库
public class getConn {


    public  Connection getConn() {

        String driver = "org.sqlite.JDBC";
        String url = "jdbc:sqlite:D:\\Bookstore\\resource\\bookstore.db";
        Connection conn = null;
        try {
            Class.forName(driver); //classLoader,加载对应驱动
            System.out.println("Connecting to database.....v");
            conn = DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("找不到驱动程序类 ，加载驱动失败！");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
