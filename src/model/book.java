package model;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  17:31
 * @package: model
 * @project: javaweb
 */

//前端显示书本信息

    //description :书本信息的表述
    //category_id ：书本对应的类型id  要联合查询book表与category表
    //category_name  :这一类书本的描述
public class book {
    private int id;
    private String name;
    private String author;
    private double price;
    private String image;
    private String description;
    private int category_id;
    private String category_name;

    public book(int id, String name, String author, double price, String image, String description, int category_id, String category_name) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.price = price;
        this.image = image;
        this.description = description;
        this.category_id = category_id;
        this.category_name = category_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    @Override
    public String toString() {
        return "book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", description='" + description + '\'' +
                ", category_id=" + category_id +
                ", category_description='" + category_name + '\'' +
                '}';
    }
}
