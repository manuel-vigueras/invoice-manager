package com.twobig.interfaces;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.twobig.beans.Transactions;

public interface TransactionsDao {

	public boolean createTable() throws IOException;

	public void insertTransaction(Map<String, String> transactionsMap,
			String rowKey);

	public Transactions getTransactionById(String key);

	public List<Transactions> getAllTransactions();
}
