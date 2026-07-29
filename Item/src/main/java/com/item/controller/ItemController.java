package com.item.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.item.model.Item;
import com.item.service.ItemService;
import com.item.service.impl.ItemServiceImpl;


import com.item.detls.model.ItemDetales;
import com.item.detals.service.ItemDetalesService;
import com.item.detals.service.imp.ItemDetalesServiceImpl;


import java.text.SimpleDateFormat;



//http://localhost:8080/item-serves-1/ItemController?action=showItems
//http://localhost:8080/item-serves-1/ItemController?action=showItem
//http://localhost:8080/item-serves-1/ItemController?action=addItem
//http://localhost:8080/item-serves-1/ItemController?action=updateItem
//http://localhost:8080/item-serves-1/ItemController?action=deleteItem



//http://localhost:8080/item-serves-1/ItemController
//http://localhost:8080/item-serves-1/ItemController?action=xyz


 
@WebServlet("/ItemController")
public class ItemController extends HttpServlet {
	
    @Resource(name="jdbc/item")
    private  DataSource dataSource ;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//ItemController  بالـ Session حماية 
		
		HttpSession session =
		        request.getSession(false);

		if (session == null ||
		        session.getAttribute("userName") == null) {

		    response.sendRedirect(
		        request.getContextPath() + "/login.jsp"
		    );

		    return;
		}
		
		
		
		
		String action = request.getParameter("action");
		
		if(Objects.isNull(action)) {
			action="showItems";
		}
		
		switch(action) {
		
		case "showItems" :
			showItems(request,response);
			break;
			
		case "showItem" :
			showItem(request,response);
			break;
			
		case "addItem" :
			addItem(request,response);
			break;
			
		case "updateItem" :
			updateItem(request,response);
			break;
			
		case "deleteItem" :
			deleteItems(request,response);
			break;
			
		case "showForUser" :
			showForUser(request,response);
			break;
			
		case "showItemDetales":
			showItemDetale(request,response);
			break;
			
		case "addItemDetales":
			addItemDetales(request,response);
			break;
			
		case "updateItemDetales":
			updateItemDetales(request,response);
			break;
			
		case "showItemDetalesById":
			showItemDetalesById(request,response);
			break;
			
		case "deletItemDetales":
			deletItemDetales(request,response);
			break;
			
			
			
		case "showAddItemDetales":
		    showAddItemDetales(request,response);
		    break;
			
			
			
			
		
			
			default:
				showItems(request,response);
		}
	}

	
	

	
























	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	
private void deleteItems(HttpServletRequest request, HttpServletResponse response) {
		
	 ItemService itemService =  getItemServiceDublication();
	
	Long id = Long.parseLong(request.getParameter("id")) ;
	
	boolean isItemDeleted = itemService.removeItemById(id); 
	
	if(isItemDeleted) {
		showItems(request,response);
		
	}else {
		
		   pageToError(request, response);
	   }
		
	}
		
	
	
	
	//updateItem
	
private void updateItem(HttpServletRequest request, HttpServletResponse response) {
		

	 ItemService itemService =  getItemServiceDublication();
	Long id = Long.parseLong(request.getParameter("id")) ;
	
	
	Item item = getItemValuesDublication(request);
	  item.setId(id);
	boolean isItemUpdated = itemService.updateItem(item); 
	
	if(isItemUpdated) {
		showItems(request,response);

	}else {
		
		   pageToError(request, response);
	   }
			
			
		
	}
		 
		 
		 
    //addItem

	private void addItem(HttpServletRequest request, HttpServletResponse response) {
		
		 ItemService itemService =  getItemServiceDublication();
		
		 Item item = getItemValuesDublication(request);;
		boolean isItemAdded = itemService.addItem(item); 
		
		if(isItemAdded) {
			showItems(request,response);

		}
			
			else {
				
				   pageToError(request, response);
			   }
			
		}
	

	
	
	
	
	//showItem

	private void showItem(HttpServletRequest request, HttpServletResponse response) {
		
		
		 ItemService itemService =  getItemServiceDublication();
		
		Long id = Long.parseLong(request.getParameter("id")) ;
		
	   Item item = itemService.getItemById(id); 
	   
	   if(Objects.nonNull(item)) {
		   
		   request.setAttribute("itemData", item);
		   
		   try {
				request.getRequestDispatcher("update-item.jsp").forward(request, response);
			} catch (ServletException |IOException e) {
				// TODO Auto-generated catch block
				System.out.println("Exception" + e.getMessage());
			
			}
	   }else {
			
		   pageToError(request, response);
	   }
		
		
	}
	
	
			 
			 
     //showItems

	private void showItems(HttpServletRequest request, HttpServletResponse response) {
		
		 ItemService itemService =  getItemServiceDublication();
		 ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource); 
			
	List <Item> items = itemService.getItems();
	
	
	//hasItemDetails
	
	// Why Write item.getName()   instead of itemName?
	
	//because:
	//itemName  in table item_detales = name  in table item ther are join
	// in same collmns   FROM ITEM_DETAILS  JOIN ITEM 
   // ON ITEM.NAME = ITEM_DETAILS.ITEM_NAME
   
	 for (Item item : items) {

  boolean hasDetails = itemDetalesService.hasItemDetails(item.getName());
	        		

	        request.setAttribute("hasDetails_" + item.getName(),hasDetails );
	                
	                
	       
	    }
	 
	 //showItems
		
	request.setAttribute("itemsData",items );
	
			
			
			
	
	
	try {
		request.getRequestDispatcher("showItems.jsp").forward(request, response);
		
	} catch (ServletException |IOException e) {
		// TODO Auto-generated catch block
		System.out.println("Exception" + e.getMessage());
	
	}
	
	
	
	
		
	}
	
	
	

	private void showForUser(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 ItemService itemService =  getItemServiceDublication();
			
			List <Item> items = itemService.showForUser(); 
				
			request.setAttribute("itemData",items );
			
			
			try {
				request.getRequestDispatcher("show-for-user.jsp").forward(request, response);
				
			} catch (ServletException |IOException e) {
				// TODO Auto-generated catch block
				System.out.println("Exception" + e.getMessage());
			
			}
	}

	
	
	
	
	
	
	

	private void deletItemDetales(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource);
       
        Long id =Long.parseLong(request.getParameter("id") );
        
        boolean isItemDetalesDeleted = itemDetalesService.deleteItemDetales(id);
        
        if(isItemDetalesDeleted) {
        	 showItemDetale(request,response);
        }
        
        else{

            pageToError(request,response);
        }
        

	}















	private void showItemDetalesById(HttpServletRequest request, HttpServletResponse response) {
	    ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource); 
	    Long id = Long.parseLong(request.getParameter("id"));
	    ItemDetales itemDetales = itemDetalesService.getItemDetailsById(id);
	    
	    if(Objects.nonNull(itemDetales)) {
	        request.setAttribute("itemDetalesDate", itemDetales);
	        try {
	            request.getRequestDispatcher("update-item-details.jsp").forward(request, response);
	        } catch (ServletException | IOException e) {
	            System.out.println("Exception" + e.getMessage());
	        }
	    } else {
	        pageToError(request, response);   // ✅ كده أي فشل هيبان بدل صفحة فاضية
	    }
	}	








	private void updateItemDetales(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource); 	
		
		Long id = Long.parseLong(request.getParameter("id"));
		String description = request.getParameter("description");
		 Date itemDate =java.sql.Date.valueOf(request.getParameter("itemDat")) ;
		 String itemName = request.getParameter("itemName") ;
		
		 ItemDetales itemDetales = new ItemDetales(id, description, itemDate, itemName);
		 
		 boolean isItemDetalesUpdate = itemDetalesService.updateItemDetales(itemDetales);
		 
		 if(isItemDetalesUpdate) {
			 showItemDetale(request,response);

			}else {
				
				   pageToError(request, response);
			   }
			 
		 }
	















	private void addItemDetales(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource); 
		
		String description = request.getParameter("description");
		 Date itemDate =java.sql.Date.valueOf(request.getParameter("itemDate")) ;
		; 
		 String itemName = request.getParameter("itemName") ;
		 
		 ItemDetales itemDetales = new ItemDetales( description, itemDate, itemName);
		
		 
		 boolean isItemDetalesAdded =  itemDetalesService.addItemDetales(itemDetales);
		 
		 if(isItemDetalesAdded) {
			
			 showItems(request,response);
		      
			}
		}
			 
		 
	





	private void showItemDetale(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ItemDetalesService itemDetalesService = new ItemDetalesServiceImpl(dataSource); 
		
		 List<ItemDetales> itemDetales =
		            itemDetalesService.getAllItemDetail();

                    

		    request.setAttribute("itemDetalesData", itemDetales);
		            
		           
		    


		    try {

		        request.getRequestDispatcher("showItemDetale.jsp").forward(request,response);
		                
		        


		    } catch(Exception e){

		        System.out.println(e.getMessage());
		    }

		}
	












	/*
	 * add-item-detales== :Item تجهيز صفحة   إضافة تفاصيل   الـ 

 *   من الصفحة السابقة itemName واستقبال select لعرضها في Items جلب كل الـ 

 *الذي اختاره المستخدم بشكل تلقائي Item لتحديد الـ ..
	 */

	private void showAddItemDetales(HttpServletRequest request,  HttpServletResponse response) {
	      
		//showItems		
		 ItemService itemService = new ItemServiceImpl(dataSource);
		 List<Item> items = itemService.getItems();
		 
		 
	   
	    	
	    
//add-item-detales
		 String itemName = 	request.getParameter("itemName");
	    		request.setAttribute("itemName",itemName);
	    		
	    		
	    		
//showItems
	    		    request.setAttribute("itemsData", items);

	    try {

	        request.getRequestDispatcher(
	                "add-item-detales.jsp"
	        ).forward(request,response);


	    } catch(Exception e){

	        System.out.println(e.getMessage());
	    }

	}
	
	
	

	
	
	
	
	
	//-----------------------------------------------------------------
	
	//solveDublication
	
	private ItemService getItemServiceDublication() {
	    return new ItemServiceImpl(dataSource);
	} // ==  	 ItemService itemService = ItemServiceImpl(dataSource);
	
	
	
	//add and update
	private Item getItemValuesDublication(HttpServletRequest request) {

	    String name = request.getParameter("name");
	    Double price = Double.parseDouble(request.getParameter("price"));
	    int totalNumber = Integer.parseInt(request.getParameter("totalNumber"));

	    return new Item(name, price, totalNumber);
	}
	
	
	//pageError
	private void pageToError(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        request.getRequestDispatcher("error.jsp").forward(request, response);
	    } catch (ServletException | IOException e) {
	        System.out.println("Exception: " + e.getMessage());
	    }
	}

}
