package model;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/25  22:15
 * @package: model
 * @project: javaweb
 */

//用于储存购物车单类书本的信息
public class books {

    private String id;
    private String username;
    private String bookname;
    private String num;

    public books(String id, String username, String bookname, String num) {
        this.id = id;
        this.bookname = bookname;
        this.num = num;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "books{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", bookname='" + bookname + '\'' +
                ", num='" + num + '\'' +
                '}';
    }
}
