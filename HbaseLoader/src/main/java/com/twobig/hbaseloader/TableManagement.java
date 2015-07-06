package com.twobig.hbaseloader;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.apache.hadoop.hbase.client.RetriesExhaustedWithDetailsException;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Splitter;
import com.google.common.collect.Iterables;
import com.twobig.constants.Constants;
import com.twobig.utilities.Utilities;

public class TableManagement {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TableManagement.class);
	public BufferedMutator bufferMutator = null;
	public Connection connection = null;
	private final static Splitter splitter = Splitter.on("^");
	private final static String DATE_PATTERN = "(0?[1-9]|1[012])/(0?[1-9]|[12][0-9]|3[01])/(\\d\\d)";

	public TableManagement() throws IOException {

	}

	public boolean createTable(Configuration conf) throws IOException {

		Connection conn = ConnectionFactory.createConnection(conf);
		boolean tableCreated = false;

		try {

			Admin admin = conn.getAdmin();

			HTableDescriptor tableDescriptor = new HTableDescriptor(
					TableName.valueOf(conf.get(Constants.TABLE_NAME)));
			tableDescriptor.addFamily(new HColumnDescriptor(conf
					.get(Constants.FAMILY_NAME)));

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

	public void insertRecord(String line, Configuration conf)
			throws IOException {

		if (connection == null) {

			connection = ConnectionFactory.createConnection(conf);
			String tableName = conf.get(Constants.TABLE_NAME);
			BufferedMutatorParams params = new BufferedMutatorParams(
					TableName.valueOf(tableName)).listener(listener);
			bufferMutator = connection.getBufferedMutator(params);
		}

		String[] columnValues = Iterables.toArray(splitter.split(line),
				String.class);
		String header = conf.get(Constants.COLUMN_LIST).toLowerCase();
		String[] columnNames = Iterables.toArray(splitter.split(header),
				String.class);

		String family = conf.get(Constants.FAMILY_NAME);
		byte[] columnFamily = family.getBytes();

		GeneratorKey generatorKey = new GeneratorKey(
				conf.get(Constants.FILE_TYPE));

		String rowKey = generatorKey.generateKey(columnValues);

		final Put put = new Put(Bytes.toBytes(rowKey));

		String datePattern = DATE_PATTERN;
		Pattern pattern = Pattern.compile(datePattern);
		Matcher matcher;
		Utilities utilities = new Utilities();

		for (int index = 0; index < columnValues.length; index++) {

			matcher = pattern.matcher(columnValues[index]);

			if (matcher.matches()) {

				columnValues[index] = utilities
						.parseDateString(columnValues[index]);
			}

			put.addColumn(columnFamily, Bytes.toBytes(columnNames[index]),
					Bytes.toBytes(columnValues[index]));
		}

		bufferMutator.mutate(put);
	}

	final BufferedMutator.ExceptionListener listener = new BufferedMutator.ExceptionListener() {
		public void onException(RetriesExhaustedWithDetailsException e,
				BufferedMutator mutator) {
			for (int i = 0; i < e.getNumExceptions(); i++) {
				LOGGER.error("Failed to sent put " + e.getRow(i) + ".");
			}
		}
	};
}
