/**
 * 
 */
package com.latbc.sivale.persistance;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.InvoiceBean;
import com.latbc.sivale.beans.TransactionBean;

public class MySqlPersistanceControllerImpl implements PersistanceController {
	
	private static Logger LOGGER = LoggerFactory.getLogger(MySqlPersistanceControllerImpl.class.getName());
	GeneralTrxDAO trxDao = new GeneralTrxDAO();

	public void saveFile(InputStream uploadedInputStream, String serverLocation) {
		
	}

	public void saveAttributesHive(BillParametersBean billParameters) {
		
	}

	public List<TransactionBean> getTransactions(String cardId, String period) {
		List<TransactionBean> transactions = new ArrayList<TransactionBean>();
		try {
			List<TransactionBean> transactionBean = trxDao.getTransactions();
		} catch (Exception e) {
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
