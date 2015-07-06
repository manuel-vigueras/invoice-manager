package com.twobig.utilities;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utilities {

	private static Logger LOGGER = LoggerFactory.getLogger(Utilities.class);
	private static String PROPERTIES_PATH = "config.properties";

	public Properties getProperties() throws IOException {

		Properties prop = new Properties();
		InputStream input = getClass().getClassLoader().getResourceAsStream(
				PROPERTIES_PATH);
		prop.load(input);

		return prop;
	}

	public String parseDateString(String dateString) {

		DateFormat indate = new SimpleDateFormat("M/d/yy");
		SimpleDateFormat outdate = new SimpleDateFormat("yyyyMMdd");
		Date date;
		String outputDate = "";
		try {
			date = indate.parse(dateString);
			outputDate = outdate.format(date);
		} catch (ParseException e) {
			LOGGER.error("Error parsing the date: " + e.getMessage());
		}

		return outputDate;
	}
}
