package com.twobig.driver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hdfs.DistributedFileSystem;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Splitter;
import com.google.common.collect.Iterables;

public class Driver {

	private static Logger LOGGER = LoggerFactory.getLogger(Driver.class);

	public static void main(String args[]) throws Exception {

		Path path = new Path(args[0]);
		Driver driver = new Driver();
		
		boolean isHEaderOk = driver.checkHeader(path);
		
		if (isHEaderOk) {
			
			LOGGER.info("Processing csv file");
			
			Configuration conf = new Configuration();
			Job job = Job.getInstance(conf, "testing");
			job.setJarByClass(Driver.class);
			job.setMapperClass(LoaderMapper.class);
			job.setOutputKeyClass(Text.class);
			job.setOutputValueClass(IntWritable.class);
			FileInputFormat.addInputPath(job, path);
			FileOutputFormat.setOutputPath(job, new Path("/user/cloudera/test"));
			System.exit(job.waitForCompletion(true) ? 0 : 1);
		} else {
			
			LOGGER.info("Number of columns is not matching");
		}
	}

	@SuppressWarnings({ "resource" })
	private boolean checkHeader(Path path) throws IOException,
			URISyntaxException {

		Splitter splitter = Splitter.on(',');
		DistributedFileSystem fileSystem = new DistributedFileSystem();
		Configuration config = new Configuration();
		fileSystem.initialize(new URI("hdfs://quickstart.cloudera:8020"),
				config);
		FSDataInputStream input = fileSystem.open(path);
		String header = new BufferedReader(new InputStreamReader(input))
				.readLine();

		String[] results = Iterables.toArray(splitter.split(header),
				String.class);
		if (results.length == 19) {
			return true;
		}

		return false;
	}
}
