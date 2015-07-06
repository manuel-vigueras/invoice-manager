package com.twobig.hbaseloader;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hdfs.DistributedFileSystem;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.twobig.constants.Constants;
import com.twobig.utilities.Utilities;

public class Driver {

	private static Logger LOGGER = LoggerFactory.getLogger(Driver.class);
	private static Properties prop;

	public static void main(String args[]) throws Exception {
		
		Utilities utilities = new Utilities();
		prop = utilities.getProperties();

		int numberOfArguments = Integer.parseInt(prop
				.getProperty("number.of.arguments"));

		if (args.length != numberOfArguments) {

			LOGGER.info("Error insufficient arguments");
			LOGGER.info("Example of usage of this application:");
			LOGGER.info("hadoop jar com.twobig.hbaseloader.Driver /user/cloudera/file.csv bduFile");
			System.exit(0);
		}

		Driver driver = new Driver();
		Path filePath = new Path(args[0]);
		String fileType = args[1];

		Configuration conf = HBaseConfiguration.create(new Configuration());
		if (!driver.getFileConfiguration(fileType, conf, filePath)) {
			
			System.exit(0);
		}

		LOGGER.info("Processing " + conf.get(Constants.FILE_TYPE) + " csv file");

		// String[] hadoopArgs = new GenericOptionsParser.getRemainingArgs();
		// GenericOptionsParser genericOptionsParser = new

		TableManagement tableManagement = new TableManagement();
		tableManagement.createTable(conf);

		String jobName = prop.getProperty("job.name");
		String outputPath = prop.getProperty("output.path.mapper");

		Date currentDate = new Date();
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyyMMddHHmm");
		String stringDate = DATE_FORMAT.format(currentDate);
		outputPath = outputPath + conf.get(Constants.FILE_TYPE) + stringDate;

		Job job = Job.getInstance(conf, jobName);
		job.setJarByClass(Driver.class);
		job.setMapperClass(CsvLoaderMapper.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		FileInputFormat.addInputPath(job, filePath);
		FileOutputFormat.setOutputPath(job, new Path(outputPath));
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

	private boolean getFileConfiguration(String fileType, Configuration conf,
			Path filePath) {

		
		boolean isOk = false;
		String columnlist = "";
		String tableName = "";
		String family = "";

		switch (fileType) {
		case Constants.FILE_TYPE_BDU:

			columnlist = getHeader(filePath);
			tableName = prop.getProperty("bdu.table.name");
			family = prop.getProperty("bdu.family");
			isOk = true;
			break;

		case Constants.FILE_TYPE_TRX:

			columnlist = getHeader(filePath);
			tableName = prop.getProperty("trx.table.name");
			family = prop.getProperty("trx.family");
			isOk = true;
			break;

		default:
			LOGGER.info("Invalid file type. There are these options 'bduFile', 'trxFile'");
		}

		conf.set(Constants.FAMILY_NAME, family);
		conf.set(Constants.COLUMN_LIST, columnlist);
		conf.set(Constants.TABLE_NAME, tableName);
		conf.set(Constants.FILE_TYPE, fileType);
		return isOk;
	}

	@SuppressWarnings("resource")
	private String getHeader(Path path) {

		DistributedFileSystem fileSystem = new DistributedFileSystem();
		Configuration config = new Configuration();
		String hdfsUrl = prop.getProperty("hdfs.url");
		String header = "";
		try {
			fileSystem.initialize(new URI(hdfsUrl), config);
			FSDataInputStream input = fileSystem.open(path);
			header = new BufferedReader(new InputStreamReader(input))
					.readLine();
		} catch (IOException | URISyntaxException e) {

			LOGGER.error(e.getMessage());
		}

		return header;
	}
}
