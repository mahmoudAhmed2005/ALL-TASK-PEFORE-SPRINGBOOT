package com.item.service.impl;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.item.model.Item;
import com.item.service.ItemService;





public class ItemServiceImpl implements ItemService {
	
	private DataSource dataSource ;
	
	public ItemServiceImpl (DataSource dataSource) {
		this.dataSource = dataSource;
		
	}
	
	
	
	//addItem

	@Override
	public boolean addItem(Item item) {

	    String query = "INSERT INTO HR.ITEM (NAME, PRICE, TOTAL_NUMBER) VALUES (?, ?, ?)";

	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, item.getName());
	        statement.setDouble(2, item.getPrice());
	        statement.setInt(3, item.getTotalNumber());

	        statement.executeUpdate();

	        return true;

	    } catch (SQLException e) {
	        System.out.println("Exception: " + e.getMessage());
	    }

	    return false;
	}
	
	
	
	
	
	
	@Override
	public boolean updateItem(Item item) {

	    String query = "UPDATE HR.ITEM SET NAME = ?, PRICE = ?, TOTAL_NUMBER = ? WHERE ID = ?";

	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setString(1, item.getName());
	        statement.setDouble(2, item.getPrice());
	        statement.setInt(3, item.getTotalNumber());
	        statement.setLong(4, item.getId());

	        return statement.executeUpdate() > 0;

	    } catch (SQLException e) {
	        System.out.println("Exception: " + e.getMessage());
	    }

	    return false;
	}
	
	
	
	

	@Override
	public Item getItemById(Long id) {

	    String query = "SELECT * FROM ITEM WHERE ID = ?";

	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setLong(1, id);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            if (resultSet.next()) {
	                return mapValusDublication(resultSet);
	            }
	        }

	    } catch (SQLException e) {
	        System.out.println("Exception: " + e.getMessage());
	    }

	    return null;
	}
	
	
	
	
	
	// getItems = showItems
	

	@Override
	public List<Item> getItems() {
		
		List<Item> items = new ArrayList<>();
		String query = "SELECT * FROM item";
		
		try (Connection connection = dataSource.getConnection();
		         Statement statement = connection.createStatement();
		         ResultSet resultSet = statement.executeQuery(query)) {

		        while (resultSet.next()) {
		            items.add(mapValusDublication(resultSet));
		        }

		    } catch (SQLException e) {
		        System.out.println("Exception: " + e.getMessage());
		    }

		    return items;
		}
	
	
	
	
	
	
	
	

	//removeItem = deleteItem
	
	@Override
	public boolean removeItemById(Long id) {

	    String query = "DELETE FROM ITEM WHERE ID = ?";

	    try (Connection connection = dataSource.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setLong(1, id);

	        return statement.executeUpdate() > 0;

	    } catch (SQLException e) {
	        System.out.println("Exception: " + e.getMessage());
	    }

	    return false;
	}
	
	
	
	
	
	//solveDublication
	private Item mapValusDublication(ResultSet resultSet) throws SQLException {

	    Long id = resultSet.getLong("ID");
	    String name = resultSet.getString("NAME");
	    Double price = resultSet.getDouble("PRICE");
	    int totalNumber = resultSet.getInt("TOTAL_NUMBER");

	    return new Item(id, name, price, totalNumber);
	}



	@Override
	public List<Item> showForUser() {
		// TODO Auto-generated method stub
		List<Item> items = new ArrayList<>();
		String query = "SELECT * FROM item";
		
		try (Connection connection = dataSource.getConnection();
		         Statement statement = connection.createStatement();
		         ResultSet resultSet = statement.executeQuery(query)) {

		        while (resultSet.next()) {
		            items.add(mapValusDublication(resultSet));
		        }

		    } catch (SQLException e) {
		        System.out.println("Exception: " + e.getMessage());
		    }

		    return items;
		
	}
	
	
	
	
	
	
	
	
    
	
		
	
	
	
	
	
	
	}

	


