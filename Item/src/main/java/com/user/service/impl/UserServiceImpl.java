package com.user.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.user.model.User;
import com.user.service.UserService;

public class UserServiceImpl implements UserService {
	
	private  DataSource dataSource ;
	
	  public UserServiceImpl(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	
	

	  @Override
	  public boolean signUp(User user) {
	      String sql = """
	              INSERT INTO USERS2
	              (USER_NAME,PASSWORD,EMAIL,PHONE_NUMBER)
	              VALUES (?,?,?,?)
	              """;
	      try (Connection connection = dataSource.getConnection();
	              PreparedStatement statement = connection.prepareStatement(sql)) {

	          statement.setString(1, user.getUserName());
	          statement.setString(2, user.getPassword());
	          statement.setString(3, user.getEmail());
	          statement.setString(4, user.getPhoneNumber());

	         

	          return statement.executeUpdate() > 0;

	      } catch (Exception e) {
	    	    e.printStackTrace();
	    	    System.out.println("SIGNUP ERROR: " + e.getMessage());
	    	}

	      return false;
	  }


	

	
	
	@Override
	public boolean logIn(String userName, String password) {
		// TODO Auto-generated method stub
	  String sql = """
                SELECT *
                FROM USERS2
                WHERE USER_NAME=?
                AND PASSWORD=?
                """;
	  try(Connection connection = dataSource.getConnection();
		PreparedStatement statement =connection.prepareStatement(sql)){
		  
		  statement.setString(1,userName);
		  statement.setString(2,password);
		  
		  ResultSet resultSet = statement.executeQuery();
		  return resultSet.next();
		  

      } catch (Exception e) {
          e.printStackTrace();
      }

      return false;
  }



	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		  String sql = """
		            SELECT EMAIL
		            FROM USERS2
		            WHERE EMAIL = ?
		            """;
		  try(Connection connection = dataSource.getConnection();
				  PreparedStatement statement = connection.prepareStatement(sql)) {
			  
			  statement.setString(1, email);
			  ResultSet resultSet = statement.executeQuery();
			  return resultSet.next();
			 
			  
		  } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return false;
		}
	



	@Override
	public boolean resetPassword(String email, String newPassword) {
		// TODO Auto-generated method stub
		  String sql = """
		            UPDATE USERS2
		            SET PASSWORD = ?
		            WHERE EMAIL = ?
		            """;

		    try (Connection connection = dataSource.getConnection();
		         PreparedStatement statement = connection.prepareStatement(sql)) {

		        statement.setString(1, newPassword);
		        statement.setString(2, email);

		        return statement.executeUpdate() > 0;

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return false;
		}
		   
	}
	
	
	



		  
		  
		  
	  


