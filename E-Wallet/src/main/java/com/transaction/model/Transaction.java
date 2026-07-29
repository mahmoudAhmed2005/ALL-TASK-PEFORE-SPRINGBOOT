package com.transaction.model;

import java.sql.Date;

public class Transaction {
	
	

	  private Long id;

	    private Long fromAccountId;

	    private Long toAccountId;

	    private String type;

	    private double amount;

	    private String description;

	    private Date transactionDate;

	    private String status;



	    public Transaction() {

	    }



	    public Transaction(Long fromAccountId,
	                       Long toAccountId,
	                       String type,
	                       double amount,
	                       String description) {

	        this.fromAccountId = fromAccountId;
	        this.toAccountId = toAccountId;
	        this.type = type;
	        this.amount = amount;
	        this.description = description;

	    }




	    public Long getId() {
	        return id;
	    }


	    public void setId(Long id) {
	        this.id = id;
	    }



	    public Long getFromAccountId() {
	        return fromAccountId;
	    }


	    public void setFromAccountId(Long fromAccountId) {
	        this.fromAccountId = fromAccountId;
	    }



	    public Long getToAccountId() {
	        return toAccountId;
	    }


	    public void setToAccountId(Long toAccountId) {
	        this.toAccountId = toAccountId;
	    }



	    public String getType() {
	        return type;
	    }


	    public void setType(String type) {
	        this.type = type;
	    }



	    public double getAmount() {
	        return amount;
	    }


	    public void setAmount(double amount) {
	        this.amount = amount;
	    }



	    public String getDescription() {
	        return description;
	    }


	    public void setDescription(String description) {
	        this.description = description;
	    }



	    public Date getTransactionDate() {
	        return transactionDate;
	    }


	    public void setTransactionDate(Date transactionDate) {
	        this.transactionDate = transactionDate;
	    }



	    public String getStatus() {
	        return status;
	    }


	    public void setStatus(String status) {
	        this.status = status;
	    }
	    
}
