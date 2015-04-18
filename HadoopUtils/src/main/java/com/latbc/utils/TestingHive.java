package com.latbc.utils;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.latbc.constants.Constants;

public class TestingHive {

	public static void main(String[] args) throws SQLException,
			ClassNotFoundException, InstantiationException,
			IllegalAccessException {

		int Hive_edition = 0;
		Driver hiveDriver;
		Connection con;
		String connection_string;
		Properties props = new Properties();

		if (args.length == 2) {
			System.out.println("Performing a Hive1 connect to: " + args[0]
					+ ":" + args[1]);
			Hive_edition = 1;
		} else if (args.length == 3) {
			System.out.println("Performing a KERBEROS Hive2 connect to: "
					+ args[0] + ":" + args[1] + " with Kerberos principle "
					+ args[2]);
			Hive_edition = 2;
		} else {
			System.out
					.println("Invalid invocation, #args must be 2 or 3, this invocation gave: "
							+ args.length);
			System.out.println("");
			System.out
					.println("A valid 2 arg invocation supplies server and port, and assumes a Hive1 server");
			System.out.println("");
			System.out
					.println("A valid 3 arg invocation supplies server, port, and Kerberos JDBC principal, and assumes a Hive2 server");
			System.exit(1);
		}

		if (Hive_edition == 1) {
			connection_string = "jdbc:hive2://" + args[0] + ":" + args[1]
					+ "/default";
			System.out.println("Full connection string is: "
					+ connection_string);
			hiveDriver = (Driver) Class.forName(
					"org.apache.hive.jdbc.HiveDriver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:hive2://" + Constants.IP_SERVER + ":10000/default", "", "");
		} else {
			connection_string = "jdbc:hive2://" + args[0] + ":" + args[1]
					+ "/default;principal=" + args[2];
			System.out.println("Full connection string is: "
					+ connection_string);
			hiveDriver = (Driver) Class.forName(
					"org.apache.hive.jdbc.HiveDriver").newInstance();
			con = hiveDriver.connect(connection_string, props);
		}

		Statement stmt = con.createStatement();

		// See if show tables works
		ResultSet res;
		String sql = "show databases";
		System.out.println("Running: " + sql);
		res = stmt.executeQuery(sql);
		int table_count = 1;
		while (res.next()) {
			System.out.println(res.getString(1));
			if (table_count++ == 3) {
				System.out.println("");
				System.out
						.println("Connectivity SUCCESSFULLY demonstrated, exiting after 3 table names displayed");
				System.exit(1);
			}
		}
	}
}
