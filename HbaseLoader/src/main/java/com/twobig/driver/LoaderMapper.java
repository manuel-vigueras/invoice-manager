package com.twobig.driver;

import java.io.IOException;
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
	private final static IntWritable one = new IntWritable(1);
	private final static Splitter splitter = Splitter.on(',');
	private final static String[] qualifiers = { "m", "card", "f", "date", "hour", "amount",
		"f2", "balance", "commerce", "f3", "trxCD", "r", "aut",
		"commerceData", "ms", "ref", "money", "f4" };
	private Text word = new Text();
	private boolean firstTime = true;

	public void map(Object key, Text value, Context context)
			throws IOException, InterruptedException {

		String[] results = Iterables.toArray(splitter.split(value.toString()),
				String.class);

		if (firstTime) {
			firstTime = false;
			return;
		}

		String hbaseKey = results[4] + results[5] + results[2] + results[13];

		TransactionsDaoImpl transactionsImpl = new TransactionsDaoImpl();

		if (transactionsImpl.createTable()) {

			Map<String, String> transactionsMap = new HashMap<String, String>();

			for (int i = 0; i < qualifiers.length; i++) {
				
				transactionsMap.put(qualifiers[i], results[i]);
			}

			transactionsImpl.insertTransaction(transactionsMap, hbaseKey);

			LOGGER.info("The record was inserted");
		} else {

			LOGGER.info("Records was not inserted " + value.toString());
		}

		// word.set(hbaseKey); // Set word to next token (word in line)
		// context.write(word,one);
	}
}
