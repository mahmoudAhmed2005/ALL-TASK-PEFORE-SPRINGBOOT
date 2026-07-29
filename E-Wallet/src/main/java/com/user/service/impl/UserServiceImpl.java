package com.user.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.user.model.User;
import com.user.service.UserService;

public class UserServiceImpl implements UserService  {
	
	private  DataSource dataSource ;
	
	  public UserServiceImpl(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	  
	  
	

	@Override
	public boolean signup(User user) {
		 String sql =
	                """
	                INSERT INTO USERS4
	                (
	                 USERNAME,
	                PASSWORD,
	                PHONE,
	                AGE
	                )
	                VALUES
	                (?,?,?,?)
	                """;
		 
		  try(
	                Connection connection =
	                dataSource.getConnection();


	                PreparedStatement statement =
	                connection.prepareStatement(sql);


	        ){
			  statement.setString(1,user.getUserName());
			  statement.setString(2,user.getPassword() );
			  statement.setString(3, user.getPhone());
			  statement.setInt(4, user.getAge());
			  
			  return  statement.executeUpdate()>0;
			  

	        }catch(SQLException e){

	            e.printStackTrace();

	        }


	        return false;

	    }

			  
		  
	

	@Override
	public boolean login(String userName, String password) {
		 String sql =
	                """
	                SELECT *
	                FROM USERS4
	                WHERE  USERNAME=?
	                AND PASSWORD=?
	                """;
		 
		 try(
	                Connection connection =
	                dataSource.getConnection();


	                PreparedStatement statement =
	                connection.prepareStatement(sql);


	        ){
			 statement.setString(1,userName);
			 statement.setString(2,password);
			 
			 ResultSet resultSet =  statement.executeQuery();
	                   



	            return resultSet.next();
	            

	        }catch(SQLException e){

	            e.printStackTrace();

	        }


	        return false;

			 
		 }

	

	@Override
	public boolean checkUserName(String userName) {
		 String sql =
	                """
	                SELECT  USERNAME
	                FROM USERS4
	                WHERE USERNAME=?
	                """;



	        try(
	                Connection connection =
	                dataSource.getConnection();


	                PreparedStatement statement =
	                connection.prepareStatement(sql);


	        ){
	        	 statement.setString(1,userName);


	   ResultSet resultSet = statement.executeQuery();
	                     



	             return resultSet.next();



	         }catch(SQLException e){

	             e.printStackTrace();

	         }


	         return false;

	     
	        }
	

	
	
	@Override
	public boolean resetPassword(String userName, String newPassword) {
		 String sql =
	                """
	                UPDATE USERS4
	                SET PASSWORD=?
	                WHERE  USERNAME=?
	                """;



	        try(
	                Connection connection =
	                dataSource.getConnection();

      PreparedStatement statement =  connection.prepareStatement(sql);
	               


	        ){
	        	
	        	
	        	  statement.setString(1,newPassword);
	        	  statement.setString(2,userName);

	            
	              return   statement.executeUpdate()>0;


	          }catch(SQLException e){

	              e.printStackTrace();

	          }



	          return false;

	      }
	       
	

	@Override
	public boolean logout() {
		// TODO Auto-generated method stub
		return true;
	}

}
