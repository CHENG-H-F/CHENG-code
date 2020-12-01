 
package entity;
public class User {
	private String username;
	private String password;
	private String question;
	private String answer;
	private String photo = "resources/img/defaultuser1.png";
	private String sex;
	private String tel;
	private String grade;
	private String birthday;
	private String address;
	private String email;
	private int audit;
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAudit() {
		return audit;
	}
	public void setAudit(int audit) {
		this.audit = audit;
	}
	public User(){
		
	}
	public User(String username,String password,String question,String answer) {
		super();
		this.username = username;
		this.password = password;
		this.question = question;
		this.answer = answer;
	}
	
	public User(String username, String password, String question, String answer, String photo, String sex, String tel,
			String grade, String birthday, String address, String email, int audit) {
		super();
		this.username = username;
		this.password = password;
		this.question = question;
		this.answer = answer;
		this.photo = photo;
		this.sex = sex;
		this.tel = tel;
		this.grade = grade;
		this.birthday = birthday;
		this.address = address;
		this.email = email;
		this.audit = audit;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
