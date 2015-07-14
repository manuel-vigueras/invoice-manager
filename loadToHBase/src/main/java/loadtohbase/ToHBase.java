package loadtohbase;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.NavigableMap;
import java.util.Map.Entry;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hdfs.DistributedFileSystem;

public class ToHBase {

	private static String TABLE_NAME;
	private static  String CF_DEFAULT;
//	private static Connection connection;
	private static TableName TABLE_NAME1;
	private static byte[] CF;
	private static String[] columns;
	
	public static void readFile(String pathfileCSV) {
		 
//		String csvFile = pathfileCSV;
//		BufferedReader br = null;
//		String line = "";
//		String cvsSplitBy = ",";
		
//		HTable table = null;
	 
//		try {
//			br = new BufferedReader(new FileReader(csvFile));
//			while ((line = br.readLine()) != null) {
//	 
//			    // use comma as separator
//				String[] country = line.split(cvsSplitBy);
//	 
//				System.out.println("Country [code= " + country[4] 
//	                                 + " , name=" + country[5] + "]");
//	 
//			}
//	 
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			if (br != null) {
//				try {
//					br.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
	 
		System.out.println("Done");
	}
	
	public static boolean scanTable (Configuration config) throws IOException, URISyntaxException{
		
		/** Connection to the cluster. A single connection shared by all application threads. */
		Connection connection = null;
		/** A lightweight handle to a specific table. Used from a single thread. */
		Table table = null;
		
		Scan scan = null;
		
		ResultScanner scanner = null;
		
//		String[] columns = null;
	    
		try {
			// establish the connection to the cluster.
			connection = ConnectionFactory.createConnection(config);
			// retrieve a handle to the target table.
			table = connection.getTable(TABLE_NAME1);
		    // Instantiating the Scan class
		    scan = new Scan();
		    // Recommended tuning Ch12 HBase Performance Tuning
		    scan.setCaching(5000); // Defined rows returned from server during next()
		    scan.setCacheBlocks(false); // Disable server side cache
		    // Scanning the required columns
		    scan.addFamily(CF);	
		    // Getting the scan result
		    scanner = table.getScanner(scan);
	
		    System.out.println("Rows founded");
		    StringBuffer line= new StringBuffer();
		    
		    int counter = 0;
		    // Reading values from scan result
		    for (Result result = scanner.next(); result != null; result = scanner.next()){
		    	columns = getColumnsInColumnFamily(result,CF);
		    	
		    	//clean line
//		    	line.delete(0, line.length());
		    	
		    	line.append(Bytes.toString(result.getRow()));
		    	for (String column:columns){
		    		line.append("^" + Bytes.toString(result.getValue(CF, Bytes.toBytes(column))));
		    	}
		    	line.append("\n");
		    	counter++;
		    	System.out.println("Linea: "+counter);
		    	
//		    	line.append("" 
//		    		+ Bytes.toString(result.getRow()) + ","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("account"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("amount"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("aut"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("balance"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("card"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("commerce"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("commerceData"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("date"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("f"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("f2"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("f3"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("f4"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("hour"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("m"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("money"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("ms"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("r"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("ref"))) +","
//		    		+ Bytes.toString(result.getValue(CF, Bytes.toBytes("trxcd")))  +"\n"
//		    		);
//		    	System.out.println(Bytes.toString(result.getRow()) +","+ Bytes.toString(result.getValue(CF, qualifier)));
		    }
		    
		    DistributedFileSystem hdfs = new DistributedFileSystem();
			hdfs.initialize(new URI("hdfs://quickstart.cloudera:8020"),
					config);
		    
	        Path homeDir=hdfs.getHomeDirectory();
	        //Print the home directory
	        System.out.println("Home folder HDFS-" +homeDir);
	        
	        Path newFilePath=new Path(homeDir+"/datatest/"+TABLE_NAME+"/file.csv");
	        
	        byte[] byt=line.toString().getBytes();
	        FSDataOutputStream fsOutStream = hdfs.create(newFilePath);
	        fsOutStream.write(byt);

	        fsOutStream.close();
		    hdfs.close();
		    
		    System.out.println("File exported to " +homeDir+"/datatest/"+TABLE_NAME+"/file.csv");
		    
		}finally {
			// close everything down
			if (table != null) table.close();
			if (connection != null) connection.close();
			if (scanner !=null) scanner.close();
		}
		return true;
		
	}
	
	public static int exportToImpala (Configuration config){
		
		
		
		return 0;
	}
	
	
	
	
	public static int getDynamicTable (Configuration config) {
		/** Connection to the cluster. A single connection shared by all application threads. */
		Connection connection = null;
		/** A lightweight handle to a specific table. Used from a single thread. */
		Table table = null;
		
		try {
			connection = ConnectionFactory.createConnection(config);
			table = connection.getTable(TABLE_NAME1);
            Get get = new Get(Bytes.toBytes("cloudera"));
            get.addFamily(CF);
            get.setMaxVersions(Integer.MAX_VALUE);
            Result result = table.get(get);


            NavigableMap<byte[],NavigableMap<byte[],NavigableMap<Long,byte[]>>> map = result.getMap();
            for (Entry<byte[], NavigableMap<byte[], NavigableMap<Long,byte[]>>> columnFamilyEntry : map.entrySet())
            {
            	NavigableMap<byte[],NavigableMap<Long,byte[]>> columnMap = columnFamilyEntry.getValue();
            	for( Entry<byte[], NavigableMap<Long, byte[]>> columnEntry : columnMap.entrySet())
            	{
            		NavigableMap<Long,byte[]> cellMap = columnEntry.getValue();
            		for ( Entry<Long, byte[]> cellEntry : cellMap.entrySet())
            		{
            			System.out.println(String.format("Key : %s, Value :%s", Bytes.toString(columnEntry.getKey()), Bytes.toString(cellEntry.getValue())));
            		}

            	}
            }
		}
		catch (IOException e) {
            e.printStackTrace();
        }
		
		return 0;
		
	}
	
	public static int getTable (Configuration config) throws IOException {
		/** Connection to the cluster. A single connection shared by all application threads. */
		Connection connection = null;
		/** A lightweight handle to a specific table. Used from a single thread. */
		Table table = null;
		try {
			// establish the connection to the cluster.
			connection = ConnectionFactory.createConnection(config);
			// retrieve a handle to the target table.
			table = connection.getTable(TABLE_NAME1);
			// describe the data we want to write.
			Get g = new Get(Bytes.toBytes("row4"));
			
			// send the data.
			table.get(g);
		} finally {
			// close everything down
			if (table != null) table.close();
			if (connection != null) connection.close();
		}
		return 0;
	}
	
	@SuppressWarnings("deprecation")
	public static int putTable (Configuration config) throws IOException {
		/** Connection to the cluster. A single connection shared by all application threads. */
		Connection connection = null;
		/** A lightweight handle to a specific table. Used from a single thread. */
		Table table = null;
		try {
			// establish the connection to the cluster.
			connection = ConnectionFactory.createConnection(config);
			// retrieve a handle to the target table.
			table = connection.getTable(TABLE_NAME1);
			// describe the data we want to write.
			Put p = new Put(Bytes.toBytes("row4"));
			p.add(CF, Bytes.toBytes("b"), Bytes.toBytes("datos agregados desde java"));
			p.add(CF, Bytes.toBytes("qual"), Bytes.toBytes("segunda columna"));
			// send the data.
			table.put(p);
		} finally {
			// close everything down
			if (table != null) table.close();
			if (connection != null) connection.close();
		}
		return 0;
	}
	
	public static String[] getColumnsInColumnFamily(Result r, byte[] cF2)
	{

	      NavigableMap<byte[], byte[]> familyMap = r.getFamilyMap(cF2);
	      String[] Quantifers = new String[familyMap.size()];

	      int counter = 0;
	      for(byte[] bQunitifer : familyMap.keySet())
	      {
	          Quantifers[counter++] = Bytes.toString(bQunitifer);

	      }

	      return Quantifers;
	}
	
	public static void main(String... args) throws IOException {
		Configuration config = HBaseConfiguration.create();
		//Add any necessary configuration files (hbase-site.xml, core-site.xml)
//		config.addResource(new Path(System.getenv("HBASE_CONF_DIR"), "hbase-site.xml"));
//		config.addResource(new Path(System.getenv("HADOOP_CONF_DIR"), "core-site.xml"));
		
		System.out.println("Argumentos: " + args.length);
		if (args.length == 2){
			CF_DEFAULT = args[0];
			TABLE_NAME = args[1];
			
			TABLE_NAME1 = TableName.valueOf(TABLE_NAME);
			CF = Bytes.toBytes(CF_DEFAULT);
		}
		else{
			System.out.println("Error de argumentos validos");
			System.out.println("Ejemplo de ejecucion: hadoop jar /home/cloudera/Desktop/loadtohbase-0.0.1-SNAPSHOT.jar loadtohbase.ToHBase csvFile bdu");
			System.exit(0);
		}
		
		
		
//		putTable(config);
		try {
			scanTable(config);
			
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}
}
