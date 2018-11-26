package vo;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/25  18:42
 * @package: model
 * @project: javaweb
 */

//管理员信息
public class admin {
    private String id;
    private String adminname;
    private String password;

    public admin() {
        this.id=null;
        this.adminname=null;
        this.password=null;
    }

    public admin(String id, String username, String password) {
        this.id = id;
        this.adminname = username;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public String getAdminname() {
        return adminname;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "admin{" +
                "id='" + id + '\'' +
                ", username='" + adminname + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
