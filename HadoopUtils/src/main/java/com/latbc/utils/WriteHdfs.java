package com.latbc.utils;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.util.Progressable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WriteHdfs {

	private static String IP_ADDRESS = "192.168.56.101";
	private static String FOLDER_PATH = "/user/sivale/";
	private static Logger LOGGER = LoggerFactory.getLogger(WriteHdfs.class.getName());

	public boolean saveAttachmentInHdfs(InputStream inputStream, String fileName) {
		
		boolean fileCreatedSuccessfully = false;

		try {

			Configuration configuration = new Configuration();

			configuration.set("fs.hdfs.impl",
					org.apache.hadoop.hdfs.DistributedFileSystem.class
							.getName());
			configuration.set("fs.file.impl",
					org.apache.hadoop.fs.LocalFileSystem.class.getName());
			
			LOGGER.info("Antes de poner el filesystem");
			
			FileSystem hdfs = FileSystem.get(new URI("hdfs://" + IP_ADDRESS
					+ ":8020"), configuration);
			
			Path path = new Path("hdfs://"
					+ IP_ADDRESS + ":8020" + FOLDER_PATH + fileName);
			
			OutputStream outputStream = hdfs.create(path,
					new Progressable() {
						public void progress() {
							LOGGER.info("It's writing the file ****");
						}
					});
			try {
				IOUtils.copyBytes(inputStream, outputStream, 4096, false);
			} finally {
				IOUtils.closeStream(inputStream);
				IOUtils.closeStream(outputStream);
			}
			
			boolean isFileExists = hdfs.exists(path);
			
			if (isFileExists) {
				
				long fileSize = hdfs.getFileStatus(path).getLen();
				
				if (fileSize > 0) {
					fileCreatedSuccessfully = true;
				}
			}
		} catch (Exception e) {
			LOGGER.error("There was an error writing the file ***: "
					+ e.getMessage());
		}
		
		return fileCreatedSuccessfully;
	}
}
