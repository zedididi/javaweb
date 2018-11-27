package model;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  17:26
 * @package: model
 * @project: javaweb
 */

//用户信息
public class user {
    private String id;
    private String username;
    private String password;
    private String phone;
    private String cellphone;
    private String email;
    private String address;

    public user() {
        id=null;
        username=null;
        password=null;
        phone=null;
        cellphone=null;
        email=null;
        address=null;
    }

    public user(String id, String username, String password, String phone, String cellphone, String email, String address) {

        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.cellphone = cellphone;
        this.email = email;
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "user{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", cellphone='" + cellphone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
