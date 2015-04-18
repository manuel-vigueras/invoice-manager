package com.latbc.mail;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeUtility;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

public class Driver {

	private static Logger LOGGER = LoggerFactory.getLogger(Driver.class.getName());

	public static void main(String... args) {

		Properties props = System.getProperties();
		Session session = Session.getDefaultInstance(props);

		try {

			// javax.mail.Store store = session.getStore("pop3");
			// store.connect("mail.latbc.com.mx",
			// "manuel-vigueras@latbc.com.mx", "$M4nu3lv1gu367");

			javax.mail.Store store = session.getStore("imaps");
			store.connect("imap.gmail.com", "sivale.facturas@gmail.com",
					"SiValeFacturas");

			Folder inbox = store.getFolder("INBOX");
			inbox.open(Folder.READ_WRITE);

			// get the list of inbox messages
			Message[] messages = inbox.getMessages();

			if (messages.length == 0) {
				LOGGER.info("There are not messages to verify");
			} else {

				for (Message msg : messages) {

					if (msg.getContent() instanceof Multipart) {
						Multipart multipart = (Multipart) msg.getContent();

						for (int i = 0; i < multipart.getCount(); i++) {
							Part part = multipart.getBodyPart(i);
							String disposition = part.getDisposition();

							if ((disposition != null)
									&& ((disposition
											.equalsIgnoreCase(Part.ATTACHMENT) || (disposition
											.equalsIgnoreCase(Part.INLINE))))) {

								MimeBodyPart mimeBodyPart = (MimeBodyPart) part;

								String fileName = part.getFileName();
								String realFileName = MimeUtility
										.decodeText(fileName);

								int lastIndexOf = realFileName.lastIndexOf(".");
								if (lastIndexOf == -1) {
									return; // empty extension
								}

								String extension = realFileName
										.substring(lastIndexOf + 1);

								if (extension.equalsIgnoreCase("XML")
										|| extension.equalsIgnoreCase("PDF")) {

									InputStream inputStream = mimeBodyPart
											.getInputStream();

									ParseXml parseXml = new ParseXml();
									BillParametersBean billParameters = parseXml
											.parseXml(inputStream);
									HelperMethods helperMethods = new HelperMethods();
									boolean recordInserted = helperMethods
											.saveAttributesHive(billParameters);

									if (recordInserted) {
										msg.setFlag(Flags.Flag.DELETED, true);
									} else {
										LOGGER.info("The file was not created");
									}
								}
							}
						}
					}
				}
			}
			inbox.close(true);
			store.close();
		} catch (MessagingException e) {
			LOGGER.error("Error getting messages: " + e.getMessage());
		} catch (IOException e) {
			LOGGER.error("Error getting the attachments: " + e.getMessage());
		} catch (ParserConfigurationException e) {
			LOGGER.error("Parser Configuration: " + e.getMessage());
		} catch (SAXException e) {
			LOGGER.error("Sax Exception: " + e.getMessage());
		}

		LOGGER.info("It's done");
	}
}
