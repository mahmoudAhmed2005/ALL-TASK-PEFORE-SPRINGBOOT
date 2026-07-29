package com.item.detals.service;

import java.util.List;

import com.item.detls.model.ItemDetales;

public interface ItemDetalesService {
	
	boolean addItemDetales(ItemDetales  ItemDetales );
	boolean updateItemDetales(ItemDetales  ItemDetales);
	
	List<ItemDetales>  getAllItemDetail();
	
	ItemDetales getItemDetailsById(Long id);
	
	boolean deleteItemDetales(Long id);
	
	boolean hasItemDetails(String itemName);

}
