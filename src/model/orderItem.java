package model;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/28  22:31
 * @package: model
 * @project: javaweb
 */
//
    //id orderItem表的ID
    //price orderItem表的price
    //book orderItem对应的书本信息
public class orderItem {

    private int id;
    private int quantity;
    private double price;
    private String order_id;
    private String book_id;
    private book book;

    public orderItem() {
        this.id = 0;
        this.quantity = 0;
        this.price = 0;
        this.book = null;
        this.order_id=null;
        this.book_id=null;
    }

    public orderItem(int id, int quantity, double price, model.book book) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.book = book;
        this.order_id=null;
        this.book_id=null;
    }

    public orderItem(int id, int quantity, double price, String order_id, String book_id, model.book book) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.order_id = order_id;
        this.book_id = book_id;
        this.book = book;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public model.book getBook() {
        return book;
    }

    public void setBook(model.book book) {
        this.book = book;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    @Override
    public String toString() {
        return "orderItem{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", price=" + price +
                ", order_id='" + order_id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", book=" + book +
                '}';
    }
}
