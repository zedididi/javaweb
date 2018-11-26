package dao;


import vo.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  17:16
 * @package: connectDB
 * @project: javaweb
 */

//查询用户信息,用户名为查询凭证
public class getUser {

    public user getUser(String username){

        Connection conn=new getConn().getConn();
        user user=null;
        ResultSet set=null;
        String sql="select * from user where username=?; ";
        try {
            try (PreparedStatement pstat = conn.prepareStatement(sql)) {
                pstat.setString(1, username);
                set = pstat.executeQuery();

                if (set.next()) {
                    String idS = String.valueOf(set.getInt(1));
                    String usernameS = set.getString(2);
                    String passwordS = set.getString(3);
                    String phoneS = set.getString(4);
                    String cellphoneS = set.getString(5);
                    String emailS = set.getString(6);
                    String addressS = set.getString(7);
                    user = new user(idS, usernameS, passwordS, phoneS, cellphoneS, emailS, addressS);

                }
            }
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }



        return user;
    }
}
