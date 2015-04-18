package com.latbc.sivale.parser;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.latbc.sivale.beans.BillParametersBean;

public class ParseXml {

	private static Logger LOGGER = LoggerFactory.getLogger(ParseXml.class.getName());

	public BillParametersBean parseXml(InputStream inputStream)
			throws ParserConfigurationException, SAXException, IOException {

		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser saxParser = factory.newSAXParser();
		final BillParametersBean billParameters = new BillParametersBean();
		
		LOGGER.info("It's started to parse the xml");
		DefaultHandler handler = new DefaultHandler() {
			
			public void startElement(String uri, String localName,
					String qName, Attributes attributes) throws SAXException {
				
				LOGGER.info("It's searching elements in the file");

				if (qName.equalsIgnoreCase("cfdi:Emisor")) {
					billParameters.setRfcIssuer(attributes.getValue("rfc"));
				}

				if (qName.equalsIgnoreCase("cfdi:Receptor")) {
					billParameters.setRfcReceiver(attributes.getValue("rfc"));
				}

				if (qName.equalsIgnoreCase("cfdi:Comprobante")) {
					billParameters.setAmount(attributes.getValue("total"));
				}

				if (qName.equalsIgnoreCase("tfd:TimbreFiscalDigital")) {
					billParameters.setTrxId(attributes.getValue("UUID"));
				}
			}
		};

		saxParser.parse(inputStream, handler);
		
		LOGGER.info("It's finished to parse the xml");
		
		return billParameters;
	}

}
