package com.twobig.implementations;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.twobig.beans.Transactions;
import com.twobig.interfaces.TransactionsDao;

public class TransactionsDaoImpl implements TransactionsDao {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TransactionsDaoImpl.class);

	public boolean createTable() throws IOException {

		Configuration config = HBaseConfiguration.create();

		Connection connection = ConnectionFactory.createConnection(config);
		Admin admin = connection.getAdmin();

		HTableDescriptor tableDescriptor = new HTableDescriptor(
				TableName.valueOf("transactions"));
		tableDescriptor.addFamily(new HColumnDescriptor("csvFile"));

		if (admin.tableExists(tableDescriptor.getTableName())) {

			LOGGER.info("The tables already exists");
			return true;
		}

		admin.createTable(tableDescriptor);
		LOGGER.info("The tables was created");
		return true;
	}

	public void insertTransaction(Map<String, String> transactionsMap,
			String rowKey) {

		Configuration config = HBaseConfiguration.create();

		try {

			byte[] CF = "csvFile".getBytes();

			Put put = new Put(Bytes.toBytes(rowKey));

			for (Map.Entry<String, String> entry : transactionsMap.entrySet()) {

				put.addColumn(CF, Bytes.toBytes(entry.getKey()),
						Bytes.toBytes(entry.getValue()));
			}

			Connection connection = ConnectionFactory.createConnection(config);
			Table table = connection
					.getTable(TableName.valueOf("transactions"));

			table.put(put);
			table.close();
		} catch (IOException e) {

			LOGGER.error("The record was not inserted: " + e.getMessage());
		}
	}

	public Transactions getTransactionById(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Transactions> getAllTransactions() {
		// TODO Auto-generated method stub
		return null;
	}

}
