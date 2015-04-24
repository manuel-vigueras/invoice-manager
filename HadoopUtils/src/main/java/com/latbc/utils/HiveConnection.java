package com.latbc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.constants.Constants;

public class HiveConnection {
	
	private static Logger LOGGER = LoggerFactory.getLogger(HiveConnection.class.getName());
	private Connection connection;

	private HiveConnection(){
	}
	
	public static HiveConnection createHiveConnection() {
		return new HiveConnection();
	}
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		
		if (this.connection==null || this.connection.isClosed()) {
			Class.forName(Constants.HIVE_DRIVER_NAME);
			this.connection = DriverManager.getConnection("jdbc:hive2://" + Constants.IP_SERVER + ":10000/default", "", "");
		}
		return this.connection;
		
	}
	
	public void createDatabase(String databaseName) throws ClassNotFoundException, SQLException {

		Connection con =  getConnection();
		Statement stmt = con.createStatement();
		stmt.execute("CREATE DATABASE IF NOT EXISTS " + databaseName);

		safeClose(con);
		
	}

	public void createTable(String databaseName, String tableName, Map<String, String> columns) throws ClassNotFoundException, SQLException {

		Connection con =  getConnection();
		Statement stmt = con.createStatement();

		StringBuffer queryStmt = new StringBuffer("CREATE TABLE IF NOT EXISTS " + databaseName + "." + tableName + " (");
		
		Map<String, String> columnsSorted = new TreeMap<String, String>(columns);

		for (Map.Entry<String, String> entry : columnsSorted.entrySet()) {
			queryStmt.append(entry.getKey() + " " + entry.getValue() + ",");
		}

		queryStmt.deleteCharAt(queryStmt.length() - 1);
		queryStmt.append(")");
		
		LOGGER.info("Stament create table: " + queryStmt.toString());

		stmt.execute(queryStmt.toString()); 
		safeClose(con);
	}

	public void insertIntoTable(String databaseName, String tableName,
			Map<String, String> parameters) throws ClassNotFoundException,
			SQLException {
		
		Connection con =  getConnection();
		Statement stmt = con.createStatement();

		StringBuffer queryStmt = new StringBuffer("INSERT INTO TABLE " + databaseName + "." + tableName);
		
		StringBuffer values = new StringBuffer(" (");
		
		Map<String, String> columnsSorted = new TreeMap<String, String>(parameters);

		for (Map.Entry<String, String> entry : columnsSorted.entrySet()) {
			values.append("\"" + entry.getValue() + "\"" + ",");
		}

	    String substring = "\"false\"";
	    String replacement = "false";
	    int position = values.lastIndexOf(substring);
	    values.replace(position, position + substring.length(), replacement);

		queryStmt.append(" VALUES");
		values.deleteCharAt(values.length() - 1);
		values.append(")");
		queryStmt.append(values.toString());

		LOGGER.info("Stament insert into table: " + queryStmt.toString());

		stmt.execute(queryStmt.toString());
		safeClose(con);
	}
	
	/**
	 * @param statement
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @deprecated shouldn't return result set
	 */
	public ResultSet executeQuery(String statement) throws ClassNotFoundException, SQLException {
		Connection con =  getConnection();
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(statement);
		safeClose(con);
		return results;
	}
	
	private static void safeClose (AutoCloseable closeable) {
		if (closeable != null) {
			try {
				closeable.close();
			} catch (Exception e) {
				if (LOGGER.isWarnEnabled()) LOGGER.warn("unable to close: " + closeable);
			}
		}
	}
	
}
