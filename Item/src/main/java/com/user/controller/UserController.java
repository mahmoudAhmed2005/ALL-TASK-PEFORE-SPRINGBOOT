package com.user.controller;

import java.io.IOException;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.user.model.User;
import com.user.service.UserService;
import com.user.service.impl.UserServiceImpl;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	
	@Resource(name="jdbc/item")
    private DataSource dataSource ;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		    
		case "checkEmail":
		    checkEmail(request, response);
		    break;
		    

		case "resetPassword":
		    resetPassword(request, response);
		    break;
			
		default:
		    response.sendRedirect("login.jsp");
			
			
		}
	}

	



	





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	
	
	private void logIn (HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
UserService userService = new UserServiceImpl(dataSource);
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		boolean isLoginCorrect = userService.logIn(userName, password);
		
		if (isLoginCorrect) {
			
			 // Create Session
	        HttpSession session = request.getSession();
	        
	        // Save username inside session
	        session.setAttribute("userName", userName);
	        
	        // Session expires after 30 minutes
	        session.setMaxInactiveInterval(30 * 60);
	        
	        // Create Cookie
	        Cookie userCookie = new Cookie("userName", userName);

	        // Cookie expires after 7 days
	        userCookie.setMaxAge(7 * 24 * 60 * 60);
	        
	        // Available for whole project
	        userCookie.setPath(request.getContextPath());

	        response.addCookie(userCookie);

			 try {
				response.sendRedirect("ItemController?action=showItems");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
		    try {
		      
		        request.getRequestDispatcher("/error.jsp").forward(request, response);
		    } catch (ServletException | IOException e) {
		        System.out.println("Exception" + e.getMessage());
		    }
		}
		
	
	}
	
	
	
	
	

	private void SignUp(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
	
	UserService userService = new  UserServiceImpl (dataSource); 
	
	String userName =  request.getParameter("userName");
	
	String password =  request.getParameter("password");
	String email =  request.getParameter("email");
	String phoneNumber =  request.getParameter("phoneNumber");
	
	
	
	
	
	User user = new User(userName,password,email,phoneNumber);
	
	boolean isSignUpCorrect =  userService.signUp(user);
	
	
	
	 if(isSignUpCorrect){
		 
		 

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
	       
	 }else {try {
	      
	        request.getRequestDispatcher("/error.jsp").forward(request, response);
	    } catch (ServletException | IOException e) {
	        System.out.println("Exception" + e.getMessage());
	    }
	}
		 
		 
	 }
	 
	
	
	

	private void logOut(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
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
	
	
	
	

	
	
	
	private void resetPassword(HttpServletRequest request, HttpServletResponse response) {

	    UserService userService = new UserServiceImpl(dataSource);

	    try {

	        HttpSession session = request.getSession(false);

	        if (session == null || session.getAttribute("ckeckEmail") == null) {
	            response.sendRedirect(request.getContextPath() + "/check-email.jsp");
	            return;
	        }

	        
	       
	        String email = (String) session.getAttribute("ckeckEmail");
	        String newPassword = request.getParameter("newPassword");

	        boolean isUpdated = userService.resetPassword(email, newPassword);

	        if (isUpdated) {

	            session.invalidate();

	            response.sendRedirect(request.getContextPath() + "/login.jsp");

	        } else {

	            request.setAttribute("error", "Password reset failed.");
	            request.getRequestDispatcher("/reset-password.jsp")
	                   .forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}





	





	private void checkEmail(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
      UserService userService = new UserServiceImpl(dataSource);

		    String email = request.getParameter("email");

		    boolean isEmailExist = userService.checkEmail(email);

		    try {

		        if (isEmailExist) {

		            HttpSession session = request.getSession();

		            session.setAttribute("ckeckEmail", email);

		            response.sendRedirect( request.getContextPath() + "/reset-password.jsp");
		                  
		                   
		            

		        } else {

		            request.setAttribute("error", "Email not found");

		            request.getRequestDispatcher( "/check-email.jsp").forward(request, response);
		            

		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		
	}
	
	
	
	
	
	
	
	
	
	

}
