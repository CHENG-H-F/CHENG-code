package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconnect;
import entity.Order;
public class OrderDao {
	//返回全部订单
		public List<Order> getAllOrder(String username) {
	        List<Order> list = new ArrayList<Order>();
			try {
				
				try {
					DBconnect.init();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				ResultSet rs = DBconnect.selectSql("select * from orderitem where order_username = '" + username + "';");
				while (rs.next())
	            {
	            	String order_id = rs.getString("order_id");
	            	String order_goods = rs.getString("order_goods");
	            	float order_price = rs.getFloat("order_price");
	            	String order_time = rs.getString("order_time");

	            	Order n = new Order(order_id,order_goods,order_price,order_time,username);
	                list.add(n);
	            }
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return list;
		}
		//下单
		public boolean ordergoods(Order g) {
			boolean flag = false;	        
	        try
	        {
		        try
		        {
		            DBconnect.init();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        ResultSet rs = DBconnect.selectSql("select * from orderitem where order_id ='" + g.getOrder_id() + "';");
		             
		        if (!rs.next())
		        {
		        	int i = DBconnect.addUpdateDelete("insert into orderitem values('" + g.getOrder_id() + "','" + g.getOrder_goods() +"','" + g.getOrder_price()+"','"+ g.getOrder_time() +"','"+ g.getOrder_username() + "');");
			        if (i > 0)
			        {
			            flag = true;
			        }
		        }
		        
		        DBconnect.closeConn();
	        	DBconnect.closePs();
	        	DBconnect.closeRs();
	        }
	        catch (SQLException e)
	        {
	            e.printStackTrace();
	        }		    
	        return flag;
		}
		
}
