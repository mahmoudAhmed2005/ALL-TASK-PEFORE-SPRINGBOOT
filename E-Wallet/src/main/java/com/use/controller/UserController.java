package com.use.controller;

import java.io.IOException;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.account.model.Account;
import com.account.service.AccountService;
import com.account.service.impl.AccountServiceImpl;
import com.user.model.User;
import com.user.service.UserService;
import com.user.service.impl.UserServiceImpl;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	       
	@Resource(name="jdbc/item")
    private DataSource dataSource ;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String action = request.getParameter("action");
		
		if(Objects.isNull(action)) {
			action="SignUp";
		}
		
		switch(action) {
		case "SignUp":
			SignUp(request,response);
			break;
			
		case "logIn":
			logIn(request,response);
			break;
			
		case "logOut":
		    logOut(request, response);
		    break;
		    
		case "checkUserName":
		    checkUserName(request, response);
		    break;
		    

		case "resetPassword":
		    resetPassword(request, response);
		    break;
			
		default:
		    response.sendRedirect("login.jsp");
			
			
		}
	}

		
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	
	private void resetPassword(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserServiceImpl(dataSource);
		  try {

		        HttpSession session = request.getSession(false);

		        if (session == null || session.getAttribute("checkUserName") == null) {
		            response.sendRedirect(request.getContextPath() + "/check-userName.jsp");
		            return;
		        }
		        
		String userName = request.getParameter("userName");
		String newPassword = request.getParameter("newPassword");
		
		boolean isUpdated = userService.resetPassword(userName, newPassword);
		
		if(isUpdated) {
			  session.invalidate();
			  response.sendRedirect(request.getContextPath() + "/login.jsp");
			  
			  
		}else {

            request.setAttribute("error", "Password reset failed.");
            request.getRequestDispatcher("/reset-password.jsp")
                   .forward(request, response);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
		
		  
	}

	
	
	
	
	
	
	
	
	
	
	

	private void checkUserName(HttpServletRequest request, HttpServletResponse response) {

	    UserService userService = new UserServiceImpl(dataSource);

	    String userName = request.getParameter("userName");

	    boolean isUserNameExist = userService.checkUserName(userName);

	    try {

	        if (isUserNameExist) {

	            HttpSession session = request.getSession();

	            session.setAttribute("checkUserName", userName);

	            response.sendRedirect(request.getContextPath() + "/reset-password.jsp");

	        } else {

	            request.setAttribute("error", "User name not found");

	            request.getRequestDispatcher("/check-userName.jsp")
	                   .forward(request, response);
	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    }
	}

	
	
	
	
	
	
	
	
	
	


	private void logOut(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserServiceImpl(dataSource);
		
		  HttpSession session = request.getSession(false);
          
		    if (session != null) {
		        session.invalidate();
		    }

		    try {

		        response.sendRedirect(request.getContextPath() + "/login.jsp" );
		       

		    } catch (IOException e) {

		        e.printStackTrace();
		    }
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	private void logIn(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserServiceImpl(dataSource);
		
		AccountService accountService = new AccountServiceImpl(dataSource);
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		 
		 boolean isLogIn = userService.login(userName,password);
		 
		 if(isLogIn) {
			 
			 
			 
			 HttpSession session = request.getSession();

			    session.setAttribute("userName", userName);

			    session.setMaxInactiveInterval(30 * 60);

			 
			 Account account = accountService.getAccountByUserName(userName);
				
			 
	      
	        
	        // Create Cookie
	        Cookie userCookie = new Cookie("userName", userName);

	        // Cookie expires after 7 days
	        userCookie.setMaxAge(7 * 24 * 60 * 60);
	        
	        // Available for whole project
	        userCookie.setPath(request.getContextPath());

	        response.addCookie(userCookie);
	        
	    
			  try {
				  response.sendRedirect(
					        request.getContextPath()
					        + "/AccountController?action=dashboard"
					);
				
			  } catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println("Exception" + e.getMessage());
				
				}
		 }
		 
		 
	}
	
	
	
	
	
	
	


	
	
	private void SignUp(HttpServletRequest request, HttpServletResponse response) {
		UserService userService = new UserServiceImpl(dataSource);
		AccountService accountService = new AccountServiceImpl(dataSource);
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		int age = Integer.parseInt(request.getParameter("age")); 
		
		 User user = new User(userName,password,phone,age);
		 
		 
		 
		 boolean isSignUp = userService.signup(user);
		 
		 if(isSignUp) {
			 
	 boolean isAccountCreated = accountService.createAccount(userName);
	 
	 if (!isAccountCreated) {
         System.out.println("Warning: failed to create account for userName = " + userName);
     }
			 
			  // Create Cookie
		        Cookie userCookie =
		                new Cookie("userName", userName);

		        userCookie.setMaxAge(  7 * 24 * 60 * 60);
		                 
		        userCookie.setPath(request.getContextPath());
		               
		        response.addCookie(userCookie);


		        try {
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				} catch (ServletException |IOException e) {
					// TODO Auto-generated catch block
					System.out.println("Exception" + e.getMessage());
				
				}
		 }
				 
	}



}
