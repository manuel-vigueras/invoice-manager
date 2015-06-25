package com.twobig.interfaces;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;

import com.twobig.beans.Transactions;

public interface TransactionsDao {

	public boolean createTable(Configuration config) throws IOException;

	public void insertTransaction(Map<String, String> transactionsMap,
			String rowKey, Configuration config) throws IOException;

	public Transactions getTransactionById(String key);

	public List<Transactions> getAllTransactions();
}
