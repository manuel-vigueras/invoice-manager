package com.twobig.driver;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.log4j.Logger;

import com.google.common.base.Splitter;
import com.google.common.collect.Iterables;
import com.twobig.implementations.TransactionsDaoImpl;

public class LoaderMapper extends Mapper<Object, Text, Text, IntWritable> {

	private static Logger LOGGER = Logger.getLogger(LoaderMapper.class);
	private final static Splitter splitter = Splitter.on(',');
	private final static String[] qualifiers = { "m", "card", "f", "account",
			"date", "hour", "amount", "f2", "balance", "commerce", "f3",
			"trxCD", "r", "aut", "commerceData", "ms", "ref", "money", "f4" };
	private boolean firstTime = true;
	private TransactionsDaoImpl transactionsImpl = null;

	public void map(Object key, Text value, Context context)
			throws IOException, InterruptedException {

		String[] results = Iterables.toArray(splitter.split(value.toString()),
				String.class);

		if (firstTime) {
			firstTime = false;
			return;
		}

		String parseDate = parseDate(results[4]);

		String hbaseKey = parseDate + results[5] + results[3] + results[13];

		if (transactionsImpl == null) {

			transactionsImpl = new TransactionsDaoImpl();
		}

		Map<String, String> transactionsMap = new HashMap<String, String>();

		LOGGER.info("Record to be inserted: " + value.toString());

		for (int i = 0; i < qualifiers.length; i++) {

			if (i == 4) {

				transactionsMap.put(qualifiers[i], parseDate);
			} else {

				transactionsMap.put(qualifiers[i], results[i]);
			}
		}

		transactionsImpl.insertTransaction(transactionsMap, hbaseKey,
				context.getConfiguration());

		LOGGER.info("The record was inserted");
	}

	private String parseDate(String dateString) {

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
