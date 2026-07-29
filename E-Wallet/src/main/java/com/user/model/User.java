package com.user.model;

public class User {
	
	    private Long id;

	    private String userName;

	    private String password;

	    private String phone;

	    private int age;
	    
	    
	    private String newPassword;





		public User() {

	    }
	    



	    public User(String userName, String password, String phone, int age) {
	        this.userName = userName;
	        this.password = password;
	        this.phone = phone;
	        this.age = age;
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



	    public String getPhone() {
	        return phone;
	    }


	    public void setPhone(String phone) {
	        this.phone = phone;
	    }



	    public int getAge() {
	        return age;
	    }


	    public void setAge(int age) {
	        this.age = age;
	    }

	    

	    public String getNewPassword() {
			return newPassword;
		}




		public void setNewPassword(String newPassword) {
			this.newPassword = newPassword;
		}



	}

