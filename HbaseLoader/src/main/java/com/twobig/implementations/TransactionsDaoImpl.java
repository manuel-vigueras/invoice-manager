package com.twobig.implementations;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.BufferedMutator;
import org.apache.hadoop.hbase.client.BufferedMutatorParams;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.twobig.beans.Transactions;
import com.twobig.interfaces.TransactionsDao;

public class TransactionsDaoImpl implements TransactionsDao {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TransactionsDaoImpl.class);
	private BufferedMutator bufferMutator = null;
	private Connection connection = null;

	public boolean createTable(Configuration config) throws IOException {

		Connection conn = ConnectionFactory.createConnection(config);
		boolean tableCreated = false;

		try {

			Admin admin = conn.getAdmin();

			HTableDescriptor tableDescriptor = new HTableDescriptor(
					TableName.valueOf("transactions"));
			tableDescriptor.addFamily(new HColumnDescriptor("csvFile"));

			if (admin.tableExists(tableDescriptor.getTableName())) {

				LOGGER.info("The table already exists");
				return true;
			}

			admin.createTable(tableDescriptor);
			LOGGER.info("The tables was created");
			tableCreated = true;
		} finally {
			conn.close();
		}

		return tableCreated;
	}

	public void insertTransaction(Map<String, String> transactionsMap,
			String rowKey, Configuration config) throws IOException {
		
		if (connection == null) {
			
			connection = ConnectionFactory.createConnection(config);
			BufferedMutatorParams params = new BufferedMutatorParams(TableName.valueOf("transactions"));
			bufferMutator = connection.getBufferedMutator(params);
		}
		
		try {

			byte[] CF = "csvFile".getBytes();

			Put put = new Put(Bytes.toBytes(rowKey));

			for (Map.Entry<String, String> entry : transactionsMap.entrySet()) {

				put.addColumn(CF, Bytes.toBytes(entry.getKey()),
						Bytes.toBytes(entry.getValue()));
			}

			bufferMutator.mutate(put);
			//connection.close();
		} finally {
			//connection.close();
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
