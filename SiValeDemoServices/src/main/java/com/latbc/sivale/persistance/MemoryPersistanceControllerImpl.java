package com.latbc.sivale.persistance;

import java.io.InputStream;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.InvoiceBean;
import com.latbc.sivale.beans.TransactionBean;

public class MemoryPersistanceControllerImpl implements PersistanceController {
	static Map<String, TransactionBean> transactions = new LinkedHashMap<String, TransactionBean>();
	
	public MemoryPersistanceControllerImpl() {
		System.out.println("Memory Controller created");
		TransactionBean trx = new TransactionBean();
		trx.setId("12347");
		trx.setDate(new Date());
		trx.setStatus("No Conciliada");
		trx.setConcept("ATRIX SA CV");
		trx.setAmount(2895.36);
		trx.setBalance(2354.50);
		transactions.put(trx.getId(), trx);
		trx = new TransactionBean();
		trx.setId("12348");
		trx.setDate(new Date());
		trx.setStatus("Conciliada");
		trx.setConcept("Italianis");
		trx.setAmount(350.50);
		trx.setBalance(2004.00);
		trx.addInvoice(new InvoiceBean("1234-123456-1234-1234", "SAPL850123986", null, new Date(), 350.50));
		transactions.put(trx.getId(), trx);
	}

	public void saveFile(InputStream uploadedInputStream, String serverLocation) {
		// TODO Auto-generated method stub
	}

	public void saveAttributesHive(BillParametersBean billParameters) {
		System.out.println("Actualizando transaccion 12347");
		TransactionBean trx = transactions.get("12347");
		trx.setStatus("Conciliada");
		trx.addInvoice(new InvoiceBean(
				billParameters.getTrxId(),
				billParameters.getRfcIssuer(),
				billParameters.getRfcReceiver(), 
				new Date(),
				Double.parseDouble(billParameters.getAmount())
				));
		System.out.println(transactions.get("12347"));
		transactions.put("12347", trx);
	}

	public Collection<TransactionBean> getTransactions(String cardId, String period) {
		return transactions.values();
	}

}
