package dao;

import model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/29  9:15
 * @package: dao
 * @project: javaweb
 */
public class userUtil {

    //支持id和Name查询
    //当name为null，查询模式是以id为索引；
    //当name不为null，查询模式是以name为索引
    public user getUser(int id,String username){

        Connection conn=new getConn().getConn();
        user user=null;
        ResultSet set=null;
        String sql="select * from user where ";
        if (username==null)
            sql+=" id=?;";
        else
            sql+=" username=?;";
        try {
            try (PreparedStatement pstat = conn.prepareStatement(sql)) {
                if (username==null)
                    pstat.setInt(1,id);
                else
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

   public ArrayList<user> getAllUser(){
        ArrayList<user> userArrayList=new ArrayList<>();
        user user=null;
        Connection conn=new getConn().getConn();
        ResultSet set=null;
        String sql="select * from user;";
        try{
            try(PreparedStatement pstat=conn.prepareStatement(sql)) {
                set=pstat.executeQuery();

                while (set.next()){
                    user=new user(String.valueOf(set.getInt(1)),set.getString(2),set.getString(3),set.getString(4),set.getString(5),set.getString(6),set.getString(7));
                    userArrayList.add(user);
                }
            }
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return userArrayList;
   }

    public boolean insertUser(user user){

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
                    System.out.println("插入成功" + new getUser().getUser(user.getUsername()));
                   return true;

                }

            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
