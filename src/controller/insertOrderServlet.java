package controller;

import dao.orderUtil;
import model.order;
import model.orderItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/12/4  21:42
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
@WebServlet(name = "insertOrderServlet")
public class insertOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        order order= (model.order) request.getAttribute("order");
        PrintWriter out=response.getWriter();
        if (order!=null){
            orderUtil orderUtil=new orderUtil();
            orderUtil.insertOrder(order);
            ArrayList<orderItem> orderItemArrayList=order.getOrderItemArrayList();
            int orderId=orderUtil.getAOrderB_2(order).getId();
            System.out.println("orderId +++:"+orderId);
            for (orderItem orderItem:orderItemArrayList
                 ) {
                orderItem.setOrder_id(String.valueOf(orderId));
                orderUtil.insertOrderItem(orderItem);
            }

            out.println("支付成功！已下单！");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
