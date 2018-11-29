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
    private book book;

    public orderItem(int id, int quantity, double price, model.book book) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
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

    @Override
    public String toString() {
        return "orderItem{" +
                "id='" + id + '\'' +
                ", quanrity=" + quantity +
                ", price=" + price +
                ", book=" + book +
                '}';
    }
}
