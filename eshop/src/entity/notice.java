package entity;
import org.joda.time.*;

public class notice {
    private String notice_id;
    private String notice_content;
    private String notice_title;
    private String notice_time;
    private int notice_audit = 0;
    private String username;
	
    public notice() {
    	super();
    }
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public notice(String notice_id, String notice_content, String notice_title, String notice_time, int notice_audit,
			String username) {
		super();
		this.notice_id = notice_id;
		this.notice_content = notice_content;
		this.notice_title = notice_title;
		this.notice_time = notice_time;
		this.notice_audit = notice_audit;
		this.username = username;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}
	public int getNotice_audit() {
		return notice_audit;
	}
	public void setNotice_audit(int notice_audit) {
		this.notice_audit = notice_audit;
	}
    
}
