package com.latbc.sivale.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.BillServiceBean;
import com.latbc.sivale.beans.InvoiceBean;
import com.latbc.sivale.beans.TransactionBean;
import com.latbc.sivale.parser.ParseXml;
import com.latbc.sivale.persistance.HivePersistanceControllerImpl;
import com.latbc.sivale.persistance.PersistanceController;
import com.sun.jersey.core.header.ContentDisposition;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;

@Path("/services")
public class Services {

	private static Logger LOGGER = LoggerFactory.getLogger(Services.class.getName());
	PersistanceController persister = new HivePersistanceControllerImpl();

	@POST
	@Path("/uploadFile")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadFile(FormDataMultiPart form)
			throws ParserConfigurationException, SAXException, IOException {
		
		LOGGER.info("Se ha recibido el archivo");

		String output = "failed";

		FormDataBodyPart filePart = form.getField("file");
		ContentDisposition headerOfFilePart = filePart.getContentDisposition();
		InputStream fileInputStream = filePart.getValueAs(InputStream.class);

		String nameFile = headerOfFilePart.getFileName();
		int lastIndexOf = nameFile.lastIndexOf(".");
		if (lastIndexOf == -1) {
			return Response.status(200).entity(output).build();
		}

		String extension = nameFile.substring(lastIndexOf + 1);

		if (extension.equalsIgnoreCase("XML")) {
			ParseXml parseXml = new ParseXml();
			BillParametersBean billParameters = parseXml.parseXml(fileInputStream);
			
			persister.saveAttributesHive(billParameters);
		} else {

			LOGGER.info("This a PDF file, it's missing save it into hive");
		}
		
		LOGGER.info("Se ha almacenado el archivo");

		output = "success";
		return Response.status(200).entity(output).build();
	}

	@POST
	@Path("/billParameters")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response sendParameters(BillServiceBean billService) {
		
		LOGGER.info("Se ha recibido QR");

		BillParametersBean billParameters = BillParametersBean.parseUrl(billService.getUrl());
		persister.saveAttributesHive(billParameters);
		
		LOGGER.info("Se ha procesado el QR");

		String response = "success";
		return Response.status(200).entity(response).build();
	}
	
	/**
	 * @param cardId
	 * @return
	 * @deprecated
	 */
	@GET
	@Path("/transactions/{cardId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response requestTransactions(@PathParam("cardId") String cardId) {
		LOGGER.info("Se han consultado transacciones para tarjeta " + cardId);
		
		List<TransactionBean> transactions = new ArrayList<TransactionBean>();
		TransactionBean trx = new TransactionBean();
		trx.setId("12345");
		trx.setDate(new Date());
		trx.setStatus("No Conciliada");
		trx.setConcept("7 Eleven Lomas Verdes");
		trx.setAmount(140.50);
		trx.setBalance(2354.50);
		transactions.add(trx);
		trx = new TransactionBean();
		trx.setId("12346");
		trx.setDate(new Date());
		trx.setStatus("Conciliada");
		trx.setConcept("Olive Garden palmas");
		trx.setAmount(350.50);
		trx.setBalance(2004.00);
		trx.addInvoice(new InvoiceBean("1234-123456-1234-1234", "SAPL850123986", null, new Date(), 350.50));
		transactions.add(trx);
		
		return Response.status(200).entity(transactions).build();
	}
	
	@GET
	@Path("/test/{cardId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response test(@PathParam("cardId") String cardId) {
		LOGGER.info("Se han consultado transacciones para tarjeta " + cardId);

		List<TransactionBean> transactions = persister.getTransactions(cardId, "");
		return Response.status(200).entity(transactions).build();
		
	}
}
