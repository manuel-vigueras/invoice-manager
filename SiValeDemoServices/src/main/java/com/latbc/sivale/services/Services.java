package com.latbc.sivale.services;

import java.io.IOException;
import java.io.InputStream;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import com.latbc.sivale.beans.BillParametersBean;
import com.latbc.sivale.beans.BillServiceBean;
import com.latbc.sivale.parser.ParseXml;
import com.latbc.sivale.persistance.HivePersistanceControllerImpl;
import com.sun.jersey.core.header.ContentDisposition;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;

@Path("/services")
public class Services {

	private static Logger LOGGER = LoggerFactory.getLogger(Services.class.getName());

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
			HivePersistanceControllerImpl helperMethods = new HivePersistanceControllerImpl();
			helperMethods.saveAttributesHive(billParameters);
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

		HivePersistanceControllerImpl helperMethods = new HivePersistanceControllerImpl();
		BillParametersBean billParameters = helperMethods.parseUrl(billService
				.getUrl());
		helperMethods.saveAttributesHive(billParameters);
		
		LOGGER.info("Se ha procesado el QR");

		String response = "success";
		return Response.status(200).entity(response).build();
	}
}
