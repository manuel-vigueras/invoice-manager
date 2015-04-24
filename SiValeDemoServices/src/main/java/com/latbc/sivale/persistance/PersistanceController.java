package com.latbc.sivale.persistance;

import java.io.InputStream;
import java.util.Collection;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.TransactionBean;

public interface PersistanceController {

	public void saveFile(InputStream uploadedInputStream, String serverLocation);
	public void saveAttributesHive(BillParametersBean billParameters);
	public Collection<TransactionBean> getTransactions(String cardId, String period);
}
