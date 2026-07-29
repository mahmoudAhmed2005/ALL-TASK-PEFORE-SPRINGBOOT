package com.transaction.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.transaction.model.Transaction;
import com.transaction.service.TransactionService;

public class TransactionServiceImpl   implements  TransactionService {
	
	
	 private DataSource dataSource;



	    public TransactionServiceImpl(DataSource dataSource){

	        this.dataSource = dataSource;

	    }
	    
	    
	    


	@Override
	public boolean saveTransaction(Connection connection, Transaction transaction){
	                             

        String sql =
        """
        INSERT INTO TRANSACTIONS
        (
        FROM_ACCOUNT_ID,
        TO_ACCOUNT_ID,
        TYPE,
        AMOUNT,
        DESCRIPTION
        )
        VALUES
        (?,?,?,?,?)
        """;
        
        
        try(
        		
        		//deleate this becuse connicton come from out in the method
               // Connection connection = dataSource.getConnection();
                        

              PreparedStatement statement =  connection.prepareStatement(sql)
                       

            ){
        	
        	  statement.setObject( 1, transaction.getFromAccountId()  );
                     
                     
             


            statement.setObject( 2, transaction.getToAccountId());
                     
                     
              


              statement.setString(3, transaction.getType());
                      
                     
              


              statement.setDouble( 4, transaction.getAmount());
                    
                    
              


              statement.setString( 5, transaction.getDescription());
                     
                     
              



             
                 return statement.executeUpdate() > 0;



             


          }catch(Exception e){

              e.printStackTrace();

          }


          return false;

      }
        

	@Override
	public List<Transaction> getTransactionsByAccountId(Long accountId) {
		
		 List<Transaction> transactionlist = new ArrayList<>();
		 
		  String sql =
			        """
			        SELECT *
			        FROM TRANSACTIONS
			        WHERE FROM_ACCOUNT_ID = ?
			        OR TO_ACCOUNT_ID = ?
			        ORDER BY TRANSACTION_DATE DESC
			        """;
		  
		  
		  try(
		            Connection connection = dataSource.getConnection();
		                 


		 PreparedStatement statement = connection.prepareStatement(sql) ){
		                   

		       
			  
			  statement.setLong(1, accountId);

	            statement.setLong(2, accountId);

	            System.out.println("Searching transactions for accountId = " + accountId);

	      ResultSet result = statement.executeQuery();
	                   



	            while(result.next()){


	                Transaction transaction =  new Transaction();
	                       


	                transaction.setId( result.getLong("ID"));
	                    
	                


	            transaction.setFromAccountId( result.getLong("FROM_ACCOUNT_ID") );
	                   
	               


	                transaction.setToAccountId( result.getLong("TO_ACCOUNT_ID"));
	                   
	                


	                transaction.setType( result.getString("TYPE"));
	                   
	                


	                transaction.setAmount( result.getDouble("AMOUNT"));
	                   
	                


	                transaction.setDescription(result.getString("DESCRIPTION"));
	                    
	                


	                transaction.setTransactionDate( result.getDate("TRANSACTION_DATE"));
	                   
	                


	                transaction.setStatus( result.getString("STATUS"));
	                   
	                


	                transactionlist.add(transaction);

	            }



	        }catch(Exception e){

	            e.printStackTrace();

	        }


	        return transactionlist;

	    }

		  

	                
	

	@Override
	public List<Transaction> getAllTransactions() {
	    List<Transaction> transactionList =  new ArrayList<>();
               


        String sql =
        """
        SELECT *
        FROM TRANSACTIONS
        ORDER BY TRANSACTION_DATE DESC
        """;



        try(
            Connection connection =  dataSource.getConnection();
                   


            PreparedStatement statement =  connection.prepareStatement(sql);
                   


            ResultSet result = statement.executeQuery();
                    

        ){


            while(result.next()){


                Transaction transaction =   new Transaction();
                      


                transaction.setId( result.getLong("ID"));
                       
                


                transaction.setType( result.getString("TYPE"));
                       
               


                transaction.setAmount( result.getDouble("AMOUNT"));
                       
                


                transaction.setStatus(result.getString("STATUS"));
                        
                


                transactionList.add(transaction);

            }



        }catch(Exception e){

            e.printStackTrace();

        }


        return transactionList;

    
	}

}
