package com.item.detls.model;

import java.sql.Date;

public class ItemDetales {
	
	private Long id;
	private String  description;
	private Date itemDate;
	
	
	private String itemName;
	
	
	
	
	
	public ItemDetales() {
		
	}


	public ItemDetales(String description, Date itemDate, String itemName ) {
		
		this.description = description;
		this.itemDate = itemDate;
		this.itemName=itemName;
	}
	
	
	public ItemDetales(Long id, String description, Date itemDate, String itemName) {
		
		this.id = id;
		this.description = description;
		this.itemDate = itemDate;
		this.itemName=itemName;
	}
	
	
	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getItemDate() {
		return itemDate;
	}
	public void setItemDate(Date itemDate) {
		this.itemDate = itemDate;
	}
	

}
