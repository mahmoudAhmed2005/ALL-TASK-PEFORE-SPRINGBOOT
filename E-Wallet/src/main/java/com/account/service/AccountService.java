package com.account.service;

import com.account.model.Account;

public interface AccountService {

	boolean createAccount(String userName);


	    Account getAccountByUserName(String userName);


	    boolean deposit(String userName , double amount);


	    boolean withdraw(String userName , double amount);


	    boolean transfer(String fromUserName , String toUserName , double amount);



	    double getBalance(String userName);
}
