package com.latbc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.constants.Constants;

public class HiveUtils {
	
	private static Logger LOGGER = LoggerFactory.getLogger(HiveUtils.class.getName());

	public void createDatabase(String databaseName)
			throws ClassNotFoundException, SQLException {

		Class.forName(Constants.HIVE_DRIVER_NAME);

		Connection con = DriverManager.getConnection("jdbc:hive2://"
				+ Constants.IP_SERVER + ":10000/default", "", "");

		Statement stmt = con.createStatement();
		stmt.execute("CREATE DATABASE IF NOT EXISTS " + databaseName);

		con.close();
	}

	public void createTable(String databaseName, String tableName,
			Map<String, String> columns) throws ClassNotFoundException,
			SQLException {

		Class.forName(Constants.HIVE_DRIVER_NAME);

		Connection con = DriverManager.getConnection("jdbc:hive2://"
				+ Constants.IP_SERVER + ":10000/default", "", "");
		Statement stmt = con.createStatement();

		StringBuffer queryStmt = new StringBuffer("CREATE TABLE IF NOT EXISTS "
				+ databaseName + "." + tableName + " (");
		
		Map<String, String> columnsSorted = new TreeMap<String, String>(columns);

		for (Map.Entry<String, String> entry : columnsSorted.entrySet()) {
			queryStmt.append(entry.getKey() + " " + entry.getValue() + ",");
		}

		queryStmt.deleteCharAt(queryStmt.length() - 1);
		queryStmt.append(")");
		
		LOGGER.info("Stament create table: " + queryStmt.toString());

		stmt.execute(queryStmt.toString()); 
		con.close();
	}

	public void insertIntoTable(String databaseName, String tableName,
			Map<String, String> parameters) throws ClassNotFoundException,
			SQLException {
		
		Class.forName(Constants.HIVE_DRIVER_NAME);

		Connection con = DriverManager.getConnection("jdbc:hive2://"
				+ Constants.IP_SERVER + ":10000/default", "", "");
		Statement stmt = con.createStatement();

		StringBuffer queryStmt = new StringBuffer("INSERT INTO TABLE "
				+ databaseName + "." + tableName);
		
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
		con.close();
	}
}
