package dao;
import util.DBconnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.goods;
public class goodsDao {
    //返回所有商品
	public goodsDao() {
		
	}
	public List<goods> getAllgoods(){
		List<goods> list = new ArrayList<goods>();
		try {			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from goods");
			while (rs.next())
            {
            	String goods_id = rs.getString("goods_id");
            	String goods_classify = rs.getString("goods_classify");
            	String goods_title = rs.getString("goods_title");
                float goods_price = rs.getFloat("goods_price");
                String goods_photo = rs.getString("goods_photo");
            	goods n = new goods(goods_id,goods_classify,goods_title,goods_price,goods_photo);
                list.add(n);
            }			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//返回指定分类的商品
	public List<goods> getgoods(String classify){
		List<goods> list = new ArrayList<goods>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from goods where goods_classify='" + classify + "';");
			while (rs.next())
            {
            	String goods_id = rs.getString("goods_id");
            	String goods_classify = rs.getString("goods_classify");
            	String goods_title = rs.getString("goods_title");
                float goods_price = rs.getFloat("goods_price");
                String goods_photo = rs.getString("goods_photo");

            	goods n = new goods(goods_id,goods_classify,goods_title,goods_price,goods_photo);
                list.add(n);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//添加商品
	public static boolean addgoods(goods g) {
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
	        ResultSet rs = DBconnect.selectSql("select * from goods where goods_id ='" + g.getGoods_id() + "';");
	             
	        if (!rs.next())
	        {
	        	int i = DBconnect.addUpdateDelete("insert into goods values('" + g.getGoods_id() + "','" + g.getGoods_classify() +"','" + g.getGoods_title()+"',"+ g.getGoods_price() +",'"+ g.getGoods_photo() + "');");
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
	//删除商品
		public boolean deleteGoods(String goods_id) {
			boolean flag = false;
			try {
				DBconnect.init();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				int i = DBconnect.addUpdateDelete("delete from goods where goods_id='"+goods_id+"';");
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
	//更新商品
		public static boolean updategoods(goods g) {
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
		        ResultSet rs = DBconnect.selectSql("select * from goods where goods_id ='" + g.getGoods_id() + "';");
		        if (rs.next())
		        {
		        	int i = DBconnect.addUpdateDelete("update goods set goods_classify = '"+g.getGoods_classify()+ "',goods_title = '" + g.getGoods_title() + "',goods_price = '" +g.getGoods_price() + "',goods_photo = '" + g.getGoods_photo() + "'where goods_id = '" +g.getGoods_id()+ "';");
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
		//返回指定商品（通过goods_id）
		public goods getonegoods(String goods_id) {
			goods n= new goods();

			try {
				try {
					DBconnect.init();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				ResultSet rs = DBconnect.selectSql("select * from goods where goods_id = '" + goods_id + "';");
				while (rs.next())
	            {
	            	String goods_classify = rs.getString("goods_classify");
	            	String goods_title = rs.getString("goods_title");
	                float goods_price = rs.getFloat("goods_price");
	                String goods_photo = rs.getString("goods_photo");

	            	goods g = new goods(goods_id,goods_classify,goods_title,goods_price,goods_photo);
	            	return g;
	            }
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
            return n;
		}
		//模糊查询
		public List<goods> fuzzyQuery(String goods_title){
			List<goods> list = new ArrayList<goods>();
			try {
				DBconnect.init();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql = "select * from goods where goods_title like '%"+goods_title+"%'";
			ResultSet rs = DBconnect.selectSql(sql);
			try {
				while (rs.next())
				{
					String goods_id = rs.getString("goods_id");
					String goods_classify = rs.getString("goods_classify");
					String goodstitle = rs.getString("goods_title");
					float goods_price = rs.getFloat("goods_price");
					String goods_photo = rs.getString("goods_photo");
					goods n = new goods(goods_id,goods_classify,goodstitle,goods_price,goods_photo);
				    list.add(n);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
}
