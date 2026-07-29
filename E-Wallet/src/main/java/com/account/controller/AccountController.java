package com.account.controller;

import java.io.IOException;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.account.model.Account;
import com.account.service.AccountService;
import com.account.service.impl.AccountServiceImpl;


@WebServlet("/AccountController")
public class AccountController extends HttpServlet {

	

    @Resource(name="jdbc/item")
    private DataSource dataSource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        String action = request.getParameter("action");
		

        if(Objects.isNull(action)){

            action="showAccount";

        }


        switch(action){
        
        case "dashboard":

            dashboard(request,response);

            break;



        case "createAccount":

            createAccount(request,response);

            break;
            
            

        case "showAccount":

            showAccount(request,response);

            break;



        case "deposit":

            deposit(request,response);

            break;



        case "withdraw":

            withdraw(request,response);

            break;
            
        case "transfer":

            transfer(request,response);

            break;



        default:

            response.sendRedirect("profile.jsp");
            
        }

	}

		
	

	
	





	








































	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	private void createAccount(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		AccountService accountService = new AccountServiceImpl(dataSource);
		

        try {

            HttpSession session = request.getSession(false);

            String userName =  (String) session.getAttribute("userName");
                   

            

            boolean isAccountCriated =
            		accountService.createAccount(userName);

           
                    

            if (isAccountCriated) {

                response.sendRedirect(request.getContextPath()
                        + "/profile.jsp");

            } else {

                request.setAttribute("error",
                        "Account already exists");

                response.sendRedirect(
                		request.getContextPath()
                		+"/AccountController?action=showAccount"
                		);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

    }
		
	
	
	
	
	
	
	
	private void deposit(HttpServletRequest request, HttpServletResponse response) {
		
		
		 AccountService accountService =  new AccountServiceImpl(dataSource);
	              



	        try{


	         HttpSession session = request.getSession(false);
	                    



	     String userName =  (String) session.getAttribute("userName");
	                   



	    double amount =  Double.parseDouble( request.getParameter("amount") );
	                  
	                   
	                   



	  boolean isDeposit =  accountService.deposit( userName, amount);
	                  
	                           
	                           
	   if(isDeposit){

		   response.sendRedirect( request.getContextPath()
	                
	                    +"/AccountController?action=showAccount" );
	                
	     }else{

	             request.setAttribute(  "error",	"Deposit Failed");
	                       
	             request.getRequestDispatcher(  "/deposit.jsp" ).forward(request,response);
	                

   

	            }



	        }catch(Exception e){

	            e.printStackTrace();

	        }

		
	}





	private void showAccount(HttpServletRequest request, HttpServletResponse response) {
		
 AccountService accountService =  new AccountServiceImpl(dataSource);
	               



	        try{


	            HttpSession session =  request.getSession(false);
	                   



	   String userName =  (String) session.getAttribute("userName");
	                   



	      Account account =  accountService.getAccountByUserName(userName);
	                   
              if(Objects.nonNull(account)) {


	            request.setAttribute( "account",account  );
	                   
	                    
              } 



     request.getRequestDispatcher(  "/profile.jsp").forward(request,response);
	                   
	            



	        }catch(Exception e){

	            e.printStackTrace();

	        }


	    }
		
	





	
	
	private void withdraw(HttpServletRequest request, HttpServletResponse response) {

        AccountService accountService =  new AccountServiceImpl(dataSource);
               



        try{


        HttpSession session =  request.getSession(false);
                   



      String userName =   (String) session.getAttribute("userName");
                   



     double amount = Double.parseDouble( request.getParameter("amount"));
                   
                   
                    



   boolean isWithdraw = accountService.withdraw( userName,  amount);
                    
                           
                          
      if(isWithdraw){


                response.sendRedirect(
                    request.getContextPath()
                    +"/AccountController?action=showAccount"
                );


            }else{


                request.setAttribute(
                        "error",
                        "Withdraw Failed"
                );


                request.getRequestDispatcher(
                        "/withdraw.jsp"
                ).forward(request,response);

            }



        }catch(Exception e){

            e.printStackTrace();

        }


    }
	
	
	
	
	
	
	
	

	private void transfer(HttpServletRequest request, HttpServletResponse response) {
		  AccountService accountService =  new AccountServiceImpl(dataSource);
		           


		    try {

		        HttpSession session = request.getSession(false);


		        String fromUserName =
		                (String) session.getAttribute("userName");


		        String toUserName =
		                request.getParameter("toUserName");


		        double amount =
		                Double.parseDouble(request.getParameter("amount"));



		        boolean isTransfer =
		                accountService.transfer(
		                        fromUserName,
		                        toUserName,
		                        amount
		                );



		        if(isTransfer){


		            response.sendRedirect(
		                    request.getContextPath()
		                    +"/AccountController?action=showAccount"
		            );


		        }else{


		            request.setAttribute(
		                    "error",
		                    "Transfer Failed"
		            );


		            request.getRequestDispatcher(
		                    "/transfer.jsp"
		            ).forward(request,response);


		        }



		    }catch(Exception e){

		        e.printStackTrace();

		    }
		
	}
	
	
	
	
	
	
	
	
	
	

	private void dashboard(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {


		  AccountService accountService =
		            new AccountServiceImpl(dataSource);



		    try {


		        HttpSession session =
		                request.getSession(false);



		        String userName =
		                (String) session.getAttribute("userName");



		        Account account =
		                accountService.getAccountByUserName(userName);



		        int accountsCount = 0;


		        if(account != null){

		            accountsCount = 1;

		        }



		        request.setAttribute(
		                "account",
		                account
		        );


		        request.setAttribute(
		                "accountsCount",
		                accountsCount
		        );



		        request.getRequestDispatcher(
		                "/dashboard.jsp"
		        ).forward(request,response);



		    }catch(Exception e){

		        e.printStackTrace();

		    }


		
	}
	}





