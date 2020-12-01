package dao;

import util.DBconnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Order;
import entity.User;
import entity.notice;

public class noticeDao {
    //返回全部通过公告
	public List<notice> getAllpassnotice() {
        List<notice> list = new ArrayList<notice>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from notice where notice_audit = 1");
			while (rs.next())
            {
            	String notice_id = rs.getString("notice_id");
            	String notice_content = rs.getString("notice_content");
            	String notice_title = rs.getString("notice_title");
            	String notice_time = rs.getString("notice_time");
            	int notice_audit = rs.getInt("notice_audit");
            	String notice_username = rs.getString("username");
            	notice n = new notice(notice_id,notice_content,notice_title,notice_time,notice_audit,notice_username);
                list.add(n);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//返回全部通过公告（指定用户名）
	public List<notice> getAllpassnotice(String username) {
        List<notice> list = new ArrayList<notice>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from notice where notice_audit = 1 and username = '" + username + "';");
			while (rs.next())
            {
            	String notice_id = rs.getString("notice_id");
            	String notice_content = rs.getString("notice_content");
            	String notice_title = rs.getString("notice_title");
            	String notice_time = rs.getString("notice_time");
            	int notice_audit = rs.getInt("notice_audit");
            	String notice_username = rs.getString("username");
            	notice n = new notice(notice_id,notice_content,notice_title,notice_time,notice_audit,notice_username);
                list.add(n);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//返回全部未通过公告
	public List<notice> getAllunpassnotice() {
        List<notice> list = new ArrayList<notice>();
		try {
			
			try {
				DBconnect.init();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			ResultSet rs = DBconnect.selectSql("select * from notice where notice_audit = 0");
			while (rs.next())
            {
            	String notice_id = rs.getString("notice_id");
            	String notice_content = rs.getString("notice_content");
            	String notice_title = rs.getString("notice_title");
            	String notice_time = rs.getString("notice_time");
            	int notice_audit = rs.getInt("notice_audit");
            	String notice_username = rs.getString("username");
            	notice n = new notice(notice_id,notice_content,notice_title,notice_time,notice_audit,notice_username);
                list.add(n);
            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	//发布公告
	public boolean addnotice(notice notice)
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
	        
	        ResultSet rs = DBconnect.selectSql("select * from notice where notice_id='" + notice.getNotice_id() + "';");
	             
	        if (!rs.next())
	        {
	        	int i = DBconnect.addUpdateDelete("insert into notice values('" + notice.getNotice_id() + "','" + notice.getNotice_content() + "','" + notice.getNotice_title() +"','" + notice.getNotice_time()+"',"+ notice.getNotice_audit() +",'"+ notice.getUsername() + "');");
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
	//通过公告，修改grade为1
		public boolean passNotice(String notice_id) {
			boolean flag = false;
			try {
				DBconnect.init();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				int i = DBconnect.addUpdateDelete("update notice set notice_audit=1 where notice_id='"+notice_id+"';");
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
			public boolean unpassNotice(String notice_id) {
				boolean flag = false;
				try {
					DBconnect.init();
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					int i = DBconnect.addUpdateDelete("delete from notice where notice_id='"+notice_id+"';");
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
			//返回标题
			public String getNoticeTitle(String notice_id) {
				String str = "";
				try {
					DBconnect.init();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				ResultSet rs = DBconnect.selectSql("select  from notice where notice_id='" +notice_id+ "';");
				try {
					str = rs.getString("notice_title");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return str;
			}
}
