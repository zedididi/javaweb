package connectDB;

import model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  18:45
 * @package: connectDB
 * @project: javaweb
 */
public class insertUser {
    public boolean insertUser(user user){
        boolean result=false;
        int i=0;
        Connection conn=new getConn().getConn();
        System.out.println(user.toString());
        String sql="insert into user (username,password,phone,cellphone,email,address) values(?,?,?,?,?,?);";
        try{
        try(PreparedStatement pstat=conn.prepareStatement(sql)) {
            pstat.setString(1, user.getUsername());
            pstat.setString(2, user.getPassword());
            pstat.setString(3, user.getPhone());
            pstat.setString(4, user.getCellphone());
            pstat.setString(5, user.getEmail());
            pstat.setString(6, user.getAddress());
            i = pstat.executeUpdate();

            if (i > 0) {
                result = true;
                System.out.println("插入成功" + new getUser().getUser(user.getUsername()));
            }

        }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
