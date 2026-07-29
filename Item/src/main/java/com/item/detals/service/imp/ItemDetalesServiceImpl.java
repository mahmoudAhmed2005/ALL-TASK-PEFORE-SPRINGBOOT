package com.item.detals.service.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.item.detals.service.ItemDetalesService;
import com.item.detls.model.ItemDetales;

public class ItemDetalesServiceImpl implements ItemDetalesService {

    private DataSource dataSource;

    public ItemDetalesServiceImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public boolean addItemDetales(ItemDetales itemDetales) {
    	  String sql = """
                  INSERT INTO ITEM_DETAILS
                  (
                      DESCRIPTION,
                      ITEM_DATE,
                      ITEM_NAME
                  )
                  VALUES (?, ?, ?)
                  """;

        try (
                Connection connection = dataSource.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

        	statement.setString( 1, itemDetales.getDescription());
        	statement.setDate( 2,  itemDetales.getItemDate() );
        	statement.setString( 3, itemDetales.getItemName());
                   
            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    
    

    @Override
    public boolean updateItemDetales(ItemDetales itemDetales) {
    	 String sql = """
                 UPDATE ITEM_DETAILS
                 SET
                     DESCRIPTION = ?,
                     ITEM_DATE = ?,
                     ITEM_NAME = ?
                 WHERE ID = ?
                 """;

    	  try(
    			  Connection connection = dataSource.getConnection();
    			  PreparedStatement statement = connection.prepareStatement(sql);
    	   ){
    		  statement.setString(1,itemDetales.getDescription());
    		  statement.setDate(2,itemDetales.getItemDate());
    		  statement.setString(3,itemDetales.getItemName());
    		  statement.setLong(4,itemDetales.getId());
    		return  statement.executeUpdate() >0;
    		
    	  }catch (SQLException e) {
              e.printStackTrace();
          }
		return false;
      }
    		  
    		  
    	 
    

    @Override
    public List<ItemDetales> getAllItemDetail() {
    	 List<ItemDetales> itemDetailsList = new ArrayList<>();
    	 

         String sql = """
                 SELECT
                     ITEM_DETAILS.ID,
                     ITEM_DETAILS.DESCRIPTION,
                     ITEM_DETAILS.ITEM_DATE,
                     ITEM_DETAILS.ITEM_NAME
                 FROM ITEM_DETAILS
                 JOIN ITEM
                 ON ITEM.NAME = ITEM_DETAILS.ITEM_NAME
                 """;
    	 
    	  try (
                  Connection connection = dataSource.getConnection();
                  PreparedStatement statement =
                          connection.prepareStatement(sql);

                ResultSet resultSet =  statement.executeQuery()
                		 
          ) {
    		    while (resultSet.next()) {

    		    	ItemDetales itemDetales = new ItemDetales ();

                    itemDetales.setId(  resultSet.getLong("ID"));
                           
                    

                    itemDetales.setDescription(
                            resultSet.getString("DESCRIPTION")
                    );

                    itemDetales.setItemDate(
                            resultSet.getDate("ITEM_DATE")
                    );

                    itemDetales.setItemName( resultSet.getString("ITEM_Name") );

                   

                    itemDetailsList.add(itemDetales);  
    }  
    		    
    	  } catch (SQLException e) {
        e.printStackTrace();
    }

    return itemDetailsList;
}
    
    
    
    

    @Override
    public ItemDetales getItemDetailsById(Long id) {
    	
    	   String sql = """
                   SELECT
                       ITEM_DETAILS.ID,
                       ITEM_DETAILS.DESCRIPTION,
                       ITEM_DETAILS.ITEM_DATE,
                       ITEM_DETAILS.ITEM_NAME
                   FROM ITEM_DETAILS
                   JOIN ITEM
                   ON ITEM.NAME = ITEM_DETAILS.ITEM_NAME
                   WHERE ITEM_DETAILS.ID = ?
                   """;

    	  try (
                  Connection connection = dataSource.getConnection();
                  PreparedStatement statement =
                          connection.prepareStatement(sql)
          ) {
    		 statement.setLong(1, id);

              try (
                      ResultSet resultSet =
                             statement.executeQuery()
              ) {

                  if (resultSet.next()) {

                	  ItemDetales itemDetales = new ItemDetales();

              itemDetales.setId(resultSet.getLong("ID"));
                              
                      

             itemDetales.setDescription(resultSet.getString("DESCRIPTION") );
                              
                     
                      
             itemDetales.setItemDate( resultSet.getDate("ITEM_DATE"));
                             
                      

             itemDetales.setItemName( resultSet.getString("ITEM_Name") );
                            
                     

            
                             
                     

                      return itemDetales;
                  }

                  }
    	  } catch (SQLException e) {
              e.printStackTrace();
          }

          return null;
      }
                  
              

    
    
    
    
    
    
    	  

    @Override
    public boolean deleteItemDetales(Long id) {

        String sql = """
                DELETE FROM ITEM_DETAILS
                WHERE ID = ?
                """;

  	   try( Connection connection = dataSource.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql);
  			   ){
  		   statement.setLong(1, id);
  		   
  		return  statement.executeUpdate()>0 ;

         } catch (SQLException e) {
             e.printStackTrace();
         }
  	 return false;
    }
    
    
    
    
    

	@Override
	public boolean hasItemDetails(String itemName){


        String sql = """
                SELECT COUNT(*)
                FROM ITEM_DETAILS
                WHERE ITEM_NAME = ?
                """;


		try(Connection connection=dataSource.getConnection();
		PreparedStatement statement=connection.prepareStatement(sql)){


			statement.setString(1,itemName);


			 try (ResultSet resultSet = statement.executeQuery()) {

		            if (resultSet.next()) {
		                return resultSet.getInt(1) > 0;
		            }
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return false;



		}
	}
    
    
  
    



