package com.latbc.sivale.persistance;

import java.io.InputStream;

import com.latbc.sivale.beans.BillParametersBean;

public interface PersistanceController {

	public void saveFile(InputStream uploadedInputStream, String serverLocation);
	public void saveAttributesHive(BillParametersBean billParameters);
	
}
