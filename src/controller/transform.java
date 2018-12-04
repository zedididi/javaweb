package controller;

import dao.bookUtil;
import dao.userUtil;
import model.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/12/4  10:53
 * @package: controller
 * @project: javaweb
 */
public class transform {

    public order getOrder(HashMap<Integer, Map.Entry<BookModel,Integer>> shoppingCar,int userId){

        userUtil userUtil=new userUtil();
        user user=userUtil.getUser(userId,null);
        ArrayList<orderItem> orderItemArrayList=new ArrayList<>();
        order order=null;
        if (!(shoppingCar.size()==0||user==null)){

            order=new order();
            double all=0;

            for (Integer book_id:shoppingCar.keySet()
                 ) {
                Map.Entry entry = shoppingCar.get(book_id);
                BookModel bookModel= (BookModel) entry.getKey();
                orderItem orderItem=new orderItem();
                orderItem.setQuantity((Integer) entry.getValue());
                orderItem.setBook(BookModelTobook(bookModel));
                orderItem.setPrice(bookModel.getPrice()*orderItem.getQuantity());
                all+=bookModel.getPrice()*orderItem.getQuantity();  //每一子单的总价
                orderItem.setBook_id(String.valueOf(bookModel.getId()));
                orderItemArrayList.add(orderItem);
            }
            order.setOrderItemArrayList(orderItemArrayList);
            order.setPrice(all);
            order.setUser_id(user.getId());
        }


        return order;

    }

    public book BookModelTobook(BookModel bookModel){
        book book=new book();

        bookUtil bookUtil=new bookUtil();
        book.setId(bookModel.getId());
        book.setAuthor(bookModel.getAuthor());
        book.setName(bookModel.getAuthor());
        book.setPrice(bookModel.getPrice());
        book.setCategory_id(Integer.parseInt(bookModel.getCategory_id()));
        book.setCategory_name(bookUtil.getCategory(Integer.parseInt(bookModel.getCategory_id())).getName());
        book.setImage(bookModel.getImage());
        book.setDescription(bookModel.getDescription());

        return book;

    }

}
