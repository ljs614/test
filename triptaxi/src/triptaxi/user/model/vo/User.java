package triptaxi.user.model.vo;

import java.sql.Date;

public class User {
	private String userId;
	private String password;
	private String userName;
	private char gender;
	private String birthday;
	private String email;
	private String phone;
	private Date enrolldate;
	
	public User() {
		// TODO Auto-generated constructor stub
	
	}

	public User(String userId, String password, String userName, char gender, String birthday, String email,
			String phone) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", userName=" + userName + ", gender=" + gender
				+ ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", profile=" 
				+ ", enrolldate=" + enrolldate + "]";
	}
	
}
	

	
	



