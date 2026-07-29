package com.transaction.controller;

import java.io.IOException;
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

import com.account.model.Account;
import com.account.service.AccountService;
import com.account.service.impl.AccountServiceImpl;
import com.transaction.model.Transaction;
import com.transaction.service.TransactionService;
import com.transaction.service.impl.TransactionServiceImpl;

import java.util.List;

import com.transaction.model.Transaction;
@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {
	

    @Resource(name="jdbc/item")
    private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
                

        if(Objects.isNull(action)){

            action="showTransactions";

        }




        switch(action){


        case "showTransactions":

            showTransactions(request,response);

            break;



        default:

            response.sendRedirect("profile.jsp");

        }

		
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}
	
	private void showTransactions(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    TransactionService transactionService =
	            new TransactionServiceImpl(dataSource);

	    AccountService accountService =
	            new AccountServiceImpl(dataSource);

	    try {

	        HttpSession session = request.getSession(false);

	        if (session == null) {
	            response.sendRedirect(request.getContextPath() + "/login.jsp");
	            return;
	        }

	        String userName = (String) session.getAttribute("userName");

	        if (userName == null) {
	            response.sendRedirect(request.getContextPath() + "/login.jsp");
	            return;
	        }

	        Account account =
	                accountService.getAccountByUserName(userName);

	        if (account == null) {

	            request.setAttribute("error", "Account not found");
	            request.getRequestDispatcher("/dashboard.jsp")
	                   .forward(request, response);
	            return;
	        }

	        Long accountId = account.getId();

	        List<Transaction> transactions =
	                transactionService.getTransactionsByAccountId(accountId);

	        request.setAttribute("transactions", transactions);

	        request.getRequestDispatcher("/transaction.jsp")
	               .forward(request, response);

	    } catch (Exception e) {

	        e.printStackTrace();

	        request.setAttribute("error", "Cannot load transactions");

	        request.getRequestDispatcher("/dashboard.jsp")
	               .forward(request, response);
	    }
	}
	}
	
	
	
	
