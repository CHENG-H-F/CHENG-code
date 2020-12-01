package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.User;
import entity.User;
import util.DBconnect;

public class UserDao {
	//注册
    public boolean regist(User user)
    {
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
	        
	        ResultSet rs = DBconnect.selectSql("select * from users where username='" + user.getUsername() + "';");
	             
	        if (!rs.next())
	        {
	        	if(user.getGrade().equals("普通用户")) {
	        		int i = DBconnect.addUpdateDelete("insert into users values('" + user.getUsername() + "','" + user.getPassword() + "','" + user.getQuestion() +"','" + user.getAnswer()+"','"+ user.getPhoto() +"',null,null,'"+ user.getGrade() + "',null,null,null,1);");
			        if (i > 0)
			        {
			            flag = true;
			        }
	        	}else {
	        		int i = DBconnect.addUpdateDelete("insert into users values('" + user.getUsername() + "','" + user.getPassword() + "','" + user.getQuestion() +"','" + user.getAnswer()+"','"+ user.getPhoto() +"',null,null,'"+ user.getGrade() + "',null,null,null,0);");
			        if (i > 0)
			        {
			            flag = true;
			        }
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
  //登录
    public static boolean login(String username, String password)
    {
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
            
            ResultSet rs = DBconnect.selectSql("select * from users where username='" + username + "' and password='" + password + "';");
            while (rs.next())
            {
                if (rs.getString("username").equals(username) && rs.getString("password").equals(password) && rs.getString("audit").equals("1"))
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
    //返回用户等级
    public int getgrade(String username) {
    	String grade = "普通用户";
    	String a = "超市用户";
    	String b = "系统管理员";
    	try {
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from users where username='" + username + "';");
			
			while (rs.next())
            {
            	grade = rs.getString("grade");
            	if(grade.equals(b)) {
            		return 0;
            	}else if(grade.equals(a)){
            		return 1;
            	}else {
            		return 2;
            	}
            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return 2;
    }
  //验证用户名
    public static Boolean check_username(String username) {
    	Boolean itemBoolean = false;
    	//初始化连接
    	try {
			DBconnect.init();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	ResultSet rs = DBconnect.selectSql("select * from users where username='"+username+"';");
    	try {
			while (rs.next()) {
				if (rs.getString("username").equals(username)) {
					itemBoolean = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return itemBoolean;
    }
    //返回未通过用户
    public List<User> getAllunpassUser() {
        List<User> list = new ArrayList<User>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from users where audit = 0");
			while (rs.next())
            {
            	String username = rs.getString("username");
            	String password = rs.getString("password");
            	String question = rs.getString("question");
            	String answer = rs.getString("answer");
            	String photo = rs.getString("photo");
            	String sex = rs.getString("sex");
            	String tel = rs.getString("tel");
            	String grade = rs.getString("grade");
            	String birthday = rs.getString("birthday");
            	String address = rs.getString("address");
            	String email = rs.getString("email");
            	int audit = rs.getInt("audit");
            	User u = new User(username,password,question,answer,photo,sex,tel,grade,birthday,address,email,audit);
                list.add(u);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
  //返回用户图片路径
    public String geturl(String username) {
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from users where username = '" + username + "';");
			while (rs.next())
            {
            	
            	String photo = rs.getString("photo");
            	return photo;
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
  //通过公告，修改grade为1
  	public boolean passUser(String username) {
  		boolean flag = false;
  		try {
  			DBconnect.init();
  		} catch (ClassNotFoundException | SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		try {
  			int i = DBconnect.addUpdateDelete("update users set audit=1 where username='"+username+"';");
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
  	//不通过公告，删除记录
  		public boolean unpassUser(String username) {
  			boolean flag = false;
  			try {
  				DBconnect.init();
  			} catch (ClassNotFoundException | SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
  			try {
  				int i = DBconnect.addUpdateDelete("delete from users where username='"+username+"';");
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
}
