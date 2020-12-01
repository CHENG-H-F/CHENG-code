package dao;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;
import util.DBconnect;

public class personalDao {
	
	//返回json字符串
//	public static String getJsonStr(User user) {
//		String carJson = "{ \"photo\": \""+user.getPhoto()+"\", \"username\": \""+user.getUsername()+"\",\"sex\": \""+user.getSex()+"\",\"tel\": \""+user.getTel()+"\",\"birthday\": \""+user.getBirthday()+"\",\"address\": \""+user.getAddress()+"\",\"email\": \""+user.getEmail()+"\"}";
//		return carJson;
//	}
	
	//返回用户信息(通过用户名)
    public User getUserByName(String username)
    {
    	User user = new User();
        
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
	        
	        ResultSet rs = DBconnect.selectSql("select * from users where username='" + username + "';");
	        
	        if (rs.next())
	        {
	        	user.setUsername(username);
	        	user.setPassword(rs.getString("password"));
	        	user.setQuestion(rs.getString("question"));
	        	user.setAnswer(rs.getString("answer"));
	        	user.setPhoto(rs.getString("photo"));
	        	user.setSex(rs.getString("sex"));
	        	user.setTel(rs.getString("tel"));
	        	user.setGrade(rs.getString("grade"));
	        	user.setBirthday(rs.getString("birthday"));
	        	user.setAddress(rs.getString("address"));
	        	user.setEmail(rs.getString("email"));
	        	user.setAudit(rs.getInt("audit"));
	        }
	        
	        DBconnect.closeConn();
	        DBconnect.closePs();
        	DBconnect.closeRs();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
	    
        return user;
    }
    
    //修改个人中心
    public static Boolean updatePersonal(String[] arry,String username) { // arry保存前端的数据
    	User user = new User();
    	try {
			DBconnect.init();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String sql = "update users set photo='"+arry[0]
    			+"', sex='"+arry[1]
    			+"', tel='"+arry[2]
    			+"', birthday='"+arry[3]
    			+"', address='"+arry[4]
    			+"', email='"+arry[5]
    			+"' where username='"+username+"';";
    	boolean flag = false;
    	try {
			int rs = DBconnect.addUpdateDelete(sql);
			if (rs > 0)
	        {
	            flag = true;
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return flag;
    }
	
}
