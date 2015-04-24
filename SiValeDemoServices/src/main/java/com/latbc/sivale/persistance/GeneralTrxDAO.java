package com.latbc.sivale.persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.latbc.sivale.beans.TransactionBean;

public class GeneralTrxDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/sivale_demo";
	static final String USER = "root";
	static final String PASS = null;

	public List<TransactionBean> getTransactions() {

		Connection conn = null;
		ResultSet rs;
		List<TransactionBean> listOfItems = new ArrayList<TransactionBean>();
		Statement stmt = null;
		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql;
			sql = "select * from transactions t left join invoice i on i.idtrx=t.id";
			rs = stmt.executeQuery(sql);

			while(rs.next()){
		         //Retrieve by column name
		         int id  = rs.getInt("id");
		         long trxdate = rs.getLong("trxdate");
		         String concept = rs.getString("concept");
		         Double amount = rs.getDouble("amount");
		         Double balance = rs.getDouble("balance");
		         String currentstatus = rs.getString("currentstatus");

		         //Display values
		         System.out.print("ID: " + id);
		         System.out.print(", trxdate: " + trxdate);
		         System.out.print(", Concept: " + concept);
		         System.out.println(", Amount: " + amount);
		         System.out.println(", Balance: " + balance);
		         System.out.println(", Currentstatus: " + currentstatus);
		      }
			
			rs.close();
			stmt.close();
			conn.close();

			return listOfItems;
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}// nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}// end finally try
		}// end try
		System.out.println("Goodbye!");
		return null;
	}
}