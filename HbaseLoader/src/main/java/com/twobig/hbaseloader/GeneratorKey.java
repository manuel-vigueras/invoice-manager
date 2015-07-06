package com.twobig.hbaseloader;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.twobig.constants.Constants;
import com.twobig.utilities.Utilities;

public class GeneratorKey {

	private static Logger LOGGER = LoggerFactory.getLogger(GeneratorKey.class);
	private static final int DATE_INDEX = 4;
	private static final int HOUR_INDEX = 5;
	private static final int ACCOUNT_INDEX = 1;
	private static final int AUT_INDEX = 13;
	private static final int AFFILIATION_INDEX = 1;

	private String fileType;

	public GeneratorKey(String filetype) {

		this.fileType = filetype;
	}

	public String generateKey(String[] values) throws IOException {

		String rowKey = "";
		Utilities utilities = new Utilities();

		switch (fileType) {

		case Constants.FILE_TYPE_BDU:

			rowKey = values[AFFILIATION_INDEX];

			break;

		case Constants.FILE_TYPE_TRX:
			
			String parseDate = utilities.parseDateString(values[DATE_INDEX]);
			rowKey = parseDate + values[HOUR_INDEX] + values[ACCOUNT_INDEX] + values[AUT_INDEX];

			break;

		default:
			LOGGER.info("Invalid file type. There are these options 'bduFile', 'trxFile'");
			return rowKey;
		}

		return rowKey;
	}
}
