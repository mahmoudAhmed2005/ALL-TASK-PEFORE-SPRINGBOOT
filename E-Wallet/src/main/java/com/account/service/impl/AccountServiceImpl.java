package com.account.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.account.model.Account;
import com.account.service.AccountService;
import com.transaction.model.Transaction;
import com.transaction.service.TransactionService;
import com.transaction.service.impl.TransactionServiceImpl;

public class AccountServiceImpl implements AccountService {

	private TransactionService transactionService;
	
	  private DataSource dataSource;



	    public AccountServiceImpl(DataSource dataSource){

	        this.dataSource=dataSource;

	        this.transactionService =
	                new TransactionServiceImpl(dataSource);
	    }
	    

	
	@Override
	public boolean createAccount(String userName) {
		
		  Account oldAccount =
		            getAccountByUserName(userName);


		    if(oldAccount != null){

		        return false;

		    }

		
		  String accountNumber =
		            "ACC" + System.currentTimeMillis();
		  String sql =
				  """
				  INSERT INTO ACCOUNT
				  (
				  USER_ID,
				  BALANCE,
				  ACCOUNT_NUMBER,
				  STATUS
				  )

				  VALUES
				  (
				  (
				  SELECT ID 
				  FROM USERS4
				  WHERE USERNAME=?
				  ),
				  ?,
				  ?,
				  ?
				  )

				  """;
		  
		  try(
	                Connection connection =
	                dataSource.getConnection();


	                PreparedStatement statement =
	                connection.prepareStatement(sql);

	        ){ 
                    
                  
           

			  statement.setString(1,userName);

			  statement.setDouble(2,0);

			  statement.setString(3,accountNumber);

			  statement.setString(4,"ACTIVE");
                   
                   
 
  

            return statement.executeUpdate()>0;



	        }catch(SQLException e){

	            e.printStackTrace();

	        }



	        return false;
	    }
	
	

	

	@Override
	public Account getAccountByUserName(String userName) {
		String sql =
				"""
				SELECT 

				ACCOUNT.ID,
				ACCOUNT.USER_ID,
				ACCOUNT.BALANCE,
				ACCOUNT.ACCOUNT_NUMBER,
				ACCOUNT.STATUS,
				USERS4.USERNAME

				FROM ACCOUNT

				JOIN USERS4

				ON ACCOUNT.USER_ID = USERS4.ID

				WHERE USERS4.USERNAME=?

				""";
		 try(
	                Connection connection =
	                dataSource.getConnection();


	                PreparedStatement statement =
	                connection.prepareStatement(sql);

	        ){ 
			 statement.setString(1,userName);
		 



            ResultSet resultSet = statement.executeQuery();
            
            if(resultSet.next()){


                Account account =  new Account();
                      



                account.setId( resultSet.getLong("ID") );
                       
               

                account.setUserId(resultSet.getInt("USER_ID"));
                       
                


                account.setBalance(
                        resultSet.getDouble("BALANCE")
                );


                account.setAccountNumber(
                        resultSet.getString("ACCOUNT_NUMBER")
                );

                     

                account.setStatus(
                        resultSet.getString("STATUS")
                );
                
                account.setUserName(
                	    resultSet.getString("USERNAME")
                	);


                return account;


            }



        }catch(SQLException e){

            e.printStackTrace();

        }



        return null;

    }
	
	


	@Override
	public boolean deposit(String userName, double amount) {
		 String sql =
				    """
				    UPDATE ACCOUNT
				    SET BALANCE = BALANCE + ?
				    WHERE USER_ID =
				    (
				        SELECT ID
				        FROM USERS4
				        WHERE USERNAME = ?
				    )
				    """;


	   try(    Connection connection =  dataSource.getConnection();
				     
				               
			   PreparedStatement statement = connection.prepareStatement(sql) ){
				       
				               
				        statement.setDouble(1, amount);
				        statement.setString(2, userName);



		 int result =  statement.executeUpdate();
				               



				        if(result > 0){


				  Account account =  getAccountByUserName(userName);
				                   



		  Transaction transaction =  new Transaction();
				                   


				  transaction.setFromAccountId(null);


		      transaction.setToAccountId(  account.getId()  );
				                   
				           


	    transaction.setType( "DEPOSIT" );
				                    
	    transaction.setAmount(amount);          

	    transaction.setDescription("Money Deposit");
				           
	    transactionService.saveTransaction(connection,transaction);	                   
				            


	    return true;     
				                    				     }



				    }catch(Exception e){

				        e.printStackTrace();

				    }


				    return false;

				}
		  
	       
	
	
	
	
	

	@Override
	public boolean withdraw(String userName, double amount) {
		String sql =
				"""
				UPDATE ACCOUNT
				SET BALANCE = BALANCE - ?
				WHERE USER_ID =
				(
				 SELECT ID
				 FROM USERS4
				 WHERE USERNAME = ?
				)
				AND BALANCE >= ?
				""";


		try(Connection connection =dataSource.getConnection();
				
			PreparedStatement statement = connection.prepareStatement(sql)){

				

			statement.setDouble(1, amount);

			statement.setString(2,userName);

			statement.setDouble(3,amount);


				




				int result = 	statement.executeUpdate();
			
				if(result > 0){


				Account account = getAccountByUserName(userName);




				Transaction transaction =  new Transaction();
				       



				transaction.setFromAccountId( account.getId());
				       
				
				transaction.setToAccountId(null);



				transaction.setType("WITHDRAW");

				transaction.setAmount(amount);
				       
				transaction.setDescription("Money Withdraw");


				transactionService.saveTransaction(connection,transaction);
				
				        
				return true;


				}



				}catch(Exception e){

				e.printStackTrace();

				}


				return false;


				}

	           
	

	@Override
	public boolean transfer(String fromUserName, String toUserName, double amount) {
		
		 if(amount <= 0){  return false; }
		      
		   



		    Account sender =   getAccountByUserName(fromUserName);
		         

		    Account receiver = getAccountByUserName(toUserName);

		     



		    if(sender == null || receiver == null){

		        return false;

		    }



		    if(sender.getBalance() < amount){

		        return false;

		    }




		    Connection connection = null;


		    try {


		        connection = dataSource.getConnection();


		        // Start Transaction
		        connection.setAutoCommit(false);




		        String withdrawSql =
		        """
		        UPDATE ACCOUNT
		        SET BALANCE = BALANCE - ?
		        WHERE ID = ?
		        AND BALANCE >= ?
		        """;



		        try(PreparedStatement statement =
		                connection.prepareStatement(withdrawSql)){


		            statement.setDouble(1, amount);

		            statement.setLong(2, sender.getId());

		            statement.setDouble(3, amount);



		            int result =
		                    statement.executeUpdate();



		            if(result == 0){

		                connection.rollback();

		                return false;
		            }

		        }





		        String depositSql =
		        """
		        UPDATE ACCOUNT
		        SET BALANCE = BALANCE + ?
		        WHERE ID = ?
		        """;



		        try(PreparedStatement statement =
		                connection.prepareStatement(depositSql)){



		            statement.setDouble(1, amount);


		            statement.setLong(2, receiver.getId());



		            int result =
		                    statement.executeUpdate();



		            if(result == 0){

		                connection.rollback();

		                return false;

		            }


		        }






		        Transaction transaction =
		                new Transaction();



		        transaction.setFromAccountId(
		                sender.getId()
		        );


		        transaction.setToAccountId(
		                receiver.getId()
		        );



		        transaction.setType(
		                "TRANSFER"
		        );



		        transaction.setAmount(
		                amount
		        );



		        transaction.setDescription(
		                "Transfer from "
		                + fromUserName
		                + " to "
		                + toUserName
		        );



		        transactionService.saveTransaction(connection,transaction);




		        // Save changes
		        connection.commit();



		        return true;




		    }catch(Exception e){


		        e.printStackTrace();


		        try {

		            if(connection != null){

		                connection.rollback();

		            }

		        }catch(SQLException ex){

		            ex.printStackTrace();

		        }


		    }finally{


		        try {

		            if(connection != null){

		                connection.setAutoCommit(true);

		                connection.close();

		            }


		        }catch(SQLException e){

		            e.printStackTrace();

		        }

		    }



		    return false;

		
	}
	
	
	
	
	
	
	
	
	

	@Override
	public double getBalance(String userName) {
		 Account account =
	                getAccountByUserName(userName);


	        if(account!=null)

	            return account.getBalance();


	        return 0;

	    }
	
	}


