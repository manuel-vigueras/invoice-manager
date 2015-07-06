package com.twobig.hbaseloader;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.log4j.Logger;

public class CsvLoaderMapper extends Mapper<Object, Text, Text, IntWritable> {

	private static Logger LOGGER = Logger.getLogger(CsvLoaderMapper.class);
	private TableManagement tableManagement = null;

	public void map(Object key, Text value, Context context)
			throws IOException, InterruptedException {

		if (tableManagement == null) {
			tableManagement = new TableManagement();
		}

		LOGGER.info("Line to be processed: " + value.toString());

		tableManagement.insertRecord(value.toString(),
				context.getConfiguration());
	}

	public void cleanup(Context context) throws IOException,
			InterruptedException {

		tableManagement.bufferMutator.flush();
		tableManagement.connection.close();
		LOGGER.info("Closing connection and buffer mutator");
	}

}
