package controller;

import dao.orderUtil;
import model.order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/29  21:39
 * @package: ${PACKAGE_NAME}
 * @project: javaweb
 */
public class changeStateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int id= Integer.parseInt(request.getParameter("id"));
        orderUtil orderUtil=new orderUtil();
        System.out.println("changeState::"+id);
        order order=orderUtil.getOrder(id);
        if (!order.isState()){
            orderUtil.updateOrderState(id,true);
            PrintWriter out=response.getWriter();
            out.print("订单："+order.getId()+" 状态修改成已完成");
        }

    }
}
