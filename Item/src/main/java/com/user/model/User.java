package com.user.model;

public class User {
	
	private Long id;
	private String userName;
	private String password;
	private String email;
	private String phoneNumber;
	private String newPassword;
	
	
	

	public User() {
		
	}
	
	
	public User(String userName, String password, String email, String phoneNumber) {
	
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}
	
	

	public User(String userName, String password) {
	
		this.userName = userName;
		this.password = password;
		
	}
	
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getNewPassword() {
		return newPassword;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	

}
