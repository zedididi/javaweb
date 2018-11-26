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
    //category_description  :这一类书本的描述
public class book {
    private String id;
    private String name;
    private String author;
    private String price;
    private String image;
    private String description;
    private String category_id;
    private String category_description;

    public book(String id, String name, String author, String price, String image, String description, String category_id, String category_description) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.price = price;
        this.image = image;
        this.description = description;
        this.category_id = category_id;
        this.category_description = category_description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
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

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getCategory_description() {
        return category_description;
    }

    public void setCategory_description(String category_description) {
        this.category_description = category_description;
    }

    @Override
    public String toString() {
        return "book{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price='" + price + '\'' +
                ", image='" + image + '\'' +
                ", description='" + description + '\'' +
                ", category_id='" + category_id + '\'' +
                ", category_description='" + category_description + '\'' +
                '}';
    }
}
