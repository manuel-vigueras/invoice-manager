package com.latbc.sivale.persistance;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.utils.HiveUtils;

public class HivePersistanceControllerImpl implements PersistanceController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(HivePersistanceControllerImpl.class.getName());

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
			e.printStackTrace();
		}
	}
	
	public BillParametersBean parseUrl(String url) {
		
		String[] wordsArray = url.split("&");
		String[] results;
		
		BillParametersBean billParametersBean = new BillParametersBean();
		
		for (String word : wordsArray) {
			
			results = word.split("=");
			
			if (word.matches(".*\\bre=\\b.*")) {
				billParametersBean.setRfcIssuer(results[1]);
			} else if (word.matches(".*\\brr=\\b.*")) {
				billParametersBean.setRfcReceiver(results[1]);
			} else if (word.matches(".*\\btt=\\b.*")) {
				
				String amount = results[1];
				amount = amount.replaceFirst("^0+(?!$)", "");
				amount = amount.replaceFirst("(?!$)0+$", "");
				billParametersBean.setAmount(amount);
			} else if (word.matches(".*\\bid=\\b.*")) {
				billParametersBean.setTrxId(results[1]);
			}
		}
		
		return billParametersBean;
	}
	
	public void saveAttributesHive(BillParametersBean billParameters) {
		
		HiveUtils hiveUtils = new HiveUtils();
		try {
			
			LOGGER.info("Antes de crear la base de datos");
			hiveUtils.createDatabase("sivale_demo");

			Map<String, String> columns = new HashMap<String, String>();
			columns.put("rfc_issuer", "string");
			columns.put("rfc_receiver", "string");
			columns.put("amount", "string");
			columns.put("trx_id", "string");
			columns.put("f_conciliation", "boolean");
			hiveUtils.createTable("sivale_demo", "invoice", columns);

			columns.put("rfc_issuer", billParameters.getRfcIssuer());
			columns.put("rfc_receiver", billParameters.getRfcReceiver());
			columns.put("amount", billParameters.getAmount());
			columns.put("trx_id", billParameters.getTrxId());
			columns.put("f_conciliation", "false");
			hiveUtils.insertIntoTable("sivale_demo", "invoice", columns);
		} catch (ClassNotFoundException e) {
			LOGGER.error("Class not found: " + e.getMessage());
		} catch (SQLException e) {
			LOGGER.error("Sql exception: " + e.getMessage());
		}
	}
}
