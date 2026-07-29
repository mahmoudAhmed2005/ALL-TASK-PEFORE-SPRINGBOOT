package com.account.model;

public class Account {
	
	    private Long id;
	    
	    private Integer userId;


	    private Double balance;


	    private String accountNumber;


	    private String status;
	    
	    private String userName;
	    
	    




	    public Account(){

	    }
	    
	    




	    public Account(Integer userId, Double balance, String accountNumber, String status) {
			
			this.userId = userId;
			this.balance = balance;
			this.accountNumber = accountNumber;
			this.status = status;
		}






		public Account(Integer userId) {

	        this.userId = userId;
	        this.balance = 0.0;
	        this.status = "ACTIVE";

	    }





	    public Long getId() {
	        return id;
	    }


	    public void setId(Long id) {
	        this.id = id;
	    }




	    public Integer getUserId() {
	        return userId;
	    }


	    public void setUserId(Integer userId) {
	        this.userId = userId;
	    }




	    public Double getBalance() {
	        return balance;
	    }


	    public void setBalance(Double balance) {
	        this.balance = balance;
	    }





	    public String getAccountNumber() {
	        return accountNumber;
	    }


	    public void setAccountNumber(String accountNumber) {
	        this.accountNumber = accountNumber;
	    }





	    public String getStatus() {
	        return status;
	    }


	    public void setStatus(String status) {
	        this.status = status;
	    }






		public String getUserName() {
			return userName;
		}






		public void setUserName(String userName) {
			this.userName = userName;
		}
	    
	    


	}

