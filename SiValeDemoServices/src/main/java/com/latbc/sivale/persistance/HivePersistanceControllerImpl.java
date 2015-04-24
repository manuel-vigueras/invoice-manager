package com.latbc.sivale.persistance;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.InvoiceBean;
import com.latbc.sivale.beans.TransactionBean;
import com.latbc.utils.HiveConnection;

public class HivePersistanceControllerImpl implements PersistanceController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(HivePersistanceControllerImpl.class.getName());
	HiveConnection hiveConn = HiveConnection.createHiveConnection();

	public void saveFile(InputStream uploadedInputStream, String serverLocation) {

		try {
			OutputStream outpuStream = new FileOutputStream(new File(
					serverLocation));

			int read = 0;
			byte[] bytes = new byte[1024];

			outpuStream = new FileOutputStream(new File(serverLocation));

			while ((read = uploadedInputStream.read(bytes)) != -1) {

				outpuStream.write(bytes, 0, read);
			}

			outpuStream.flush();
			outpuStream.close();
			uploadedInputStream.close();

		} catch (IOException e) {
			LOGGER.error("I/O exception: " + e.getMessage(), e);
		}
	}
	
	public void saveAttributesHive(BillParametersBean billParameters) {
		
		try {
			
			LOGGER.info("Antes de crear la base de datos");
			hiveConn.createDatabase("sivale_demo");

			Map<String, String> columns = new HashMap<String, String>();
			columns.put("rfc_issuer", "string");
			columns.put("rfc_receiver", "string");
			columns.put("amount", "string");
			columns.put("trx_id", "string");
			columns.put("f_conciliation", "boolean");
			hiveConn.createTable("sivale_demo", "invoice", columns);

			columns.put("rfc_issuer", billParameters.getRfcIssuer());
			columns.put("rfc_receiver", billParameters.getRfcReceiver());
			columns.put("amount", billParameters.getAmount());
			columns.put("trx_id", billParameters.getTrxId());
			columns.put("f_conciliation", "false");
			hiveConn.insertIntoTable("sivale_demo", "invoice", columns);
		} catch (ClassNotFoundException e) {
			LOGGER.error("Class not found: " + e.getMessage(), e);
		} catch (SQLException e) {
			LOGGER.error("Sql exception: " + e.getMessage(), e);
		}
	}

	public List<TransactionBean> getTransactions(String cardId, String period) {
		List<TransactionBean> transactions = new ArrayList<TransactionBean>();
		try {
			hiveConn.executeQuery("select * from sivale_demo.invoice");
			
		} catch (ClassNotFoundException e) {
			LOGGER.error("Class not found: " + e.getMessage(), e);
		} catch (SQLException e) {
			LOGGER.error("Sql exception: " + e.getMessage(), e);
			
			//TODO hardcode
			TransactionBean trx = new TransactionBean();
			trx.setId("12347");
			trx.setDate(new Date());
			trx.setStatus("No Conciliada");
			trx.setConcept("7 Eleven Lomas Verdes");
			trx.setAmount(140.50);
			trx.setBalance(2354.50);
			transactions.add(trx);
			trx = new TransactionBean();
			trx.setId("12348");
			trx.setDate(new Date());
			trx.setStatus("Conciliada");
			trx.setConcept("Olive Garden palmas");
			trx.setAmount(350.50);
			trx.setBalance(2004.00);
			trx.addInvoice(new InvoiceBean("1234-123456-1234-1234", "SAPL850123986", null, new Date(), 350.50));
			transactions.add(trx);
			//end hardcode
			
		}
		
		return transactions;
	}
}
