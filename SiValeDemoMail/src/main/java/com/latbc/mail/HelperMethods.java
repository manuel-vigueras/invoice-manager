package com.latbc.mail;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.utils.HiveUtils;

public class HelperMethods {
	
	private static Logger LOGGER = LoggerFactory.getLogger(HelperMethods.class.getName());

	public boolean saveAttributesHive(BillParametersBean billParameters) {
		
		boolean savedSuccessfully = false;
		
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
			savedSuccessfully = true;
		} catch (ClassNotFoundException e) {
			LOGGER.error("Class not found: " + e.getMessage());
		} catch (SQLException e) {
			LOGGER.error("Sql exception: " + e.getMessage());
		}
		
		return savedSuccessfully;
	}
}
