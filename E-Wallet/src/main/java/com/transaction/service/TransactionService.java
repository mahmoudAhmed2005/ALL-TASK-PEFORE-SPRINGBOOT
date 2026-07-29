package com.transaction.service;

import java.sql.Connection;
import java.util.List;

import com.transaction.model.Transaction;

public interface TransactionService {
	
	boolean saveTransaction(Connection connection, Transaction transaction);



	    List<Transaction> getTransactionsByAccountId(Long accountId);



	    List<Transaction> getAllTransactions();

}
