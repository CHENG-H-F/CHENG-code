package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Order;
import entity.goods;
import entity.shop;
import util.DBconnect;

public class shopDao {
	//添加超市
	public boolean addshop(shop s) {
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
	        ResultSet rs = DBconnect.selectSql("select * from 超市省份表 where 超市名称 ='" + s.getShop_title() + "';");
	             
	        if (!rs.next())
	        {
	        	int i = DBconnect.addUpdateDelete("insert into 超市省份表 values('" + s.getShop_name() + "','" + s.getShop_province() +"','" + s.getShop_city()+"','"+ s.getShop_title() +"','"+ s.getshop_address() + "','" + s.getShop_tel() +"','" + s.getShop_time() +"');");
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
	//返回所有超市
	public List<shop> getAllshop() {
        List<shop> list = new ArrayList<shop>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from 超市省份表");
			while (rs.next())
            {
            	String shop_name = rs.getString("超市名称");
            	String shop_province = rs.getString("省份");
            	String shop_city = rs.getString("城市");
            	String shop_title = rs.getString("店名简称");
            	String shop_address = rs.getString("地址");
            	String shop_tel = rs.getString("联系电话");
            	String shop_time = rs.getString("营业时间");

            	shop s = new shop(shop_name,shop_province,shop_city,shop_title,shop_address,shop_tel,shop_time);
                list.add(s);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//删除超市
			public boolean deleteShop(String shop_title) {
				boolean flag = false;
				try {
					DBconnect.init();
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					int i = DBconnect.addUpdateDelete("delete from 超市省份表 where 店名简称='"+shop_title+"';");
					if (i > 0)
			        {
			            flag = true;
			        }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return flag;
			}
			//修改超市
			public boolean updateshop(shop s) {
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
			        ResultSet rs = DBconnect.selectSql("select * from 超市省份表 where 超市名称 ='" + s.getShop_title() + "';");
			             
			        if (rs.next())
			        {
			        	int i = DBconnect.addUpdateDelete("update 超市省份表 set 超市名称 = '"+ s.getShop_name() +"',省份 = '"+s.getShop_province()+"',城市 = '"+s.getShop_city()+"',地址 = '"+s.getshop_address()+"',联系电话 = '"+s.getShop_tel()+"',营业时间 = '"+s.getShop_time()+"' where 店名简称  = '"+s.getShop_title()+"';");
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
