import dao.orderUtil;

/**
 * @auther: Liu Zedi.
 * @date: Create in 2018/11/24  19:41
 * @package: PACKAGE_NAME
 * @project: javaweb
 */
public class testMian {

    public static void main(String []a){

        /*user user=new getUser().getUser("秋水");
        System.out.println(user.toString());*/

        new orderUtil().getOrderItem(1);
        new orderUtil().getOrder(1);
        new orderUtil().getUserOrders(1,1);
    }

}
